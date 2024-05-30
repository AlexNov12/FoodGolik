//
//  ChatViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 20.05.2024.
//

import UIKit
import MessageKit
import InputBarAccessoryView
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}


struct Message: MessageType{
    var sender: MessageKit.SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKit.MessageKind
}

class ChatViewController: MessagesViewController {
    
    var chatID: String?
    var otherId: String?
    let service = Service() // Может и не нужно, если мы класс service посадим в этот VC
    let selfSender = Sender(senderId: "1", displayName: "Me")
    let otherSender = Sender(senderId: "2", displayName: "Johnye")
    
    var messages = [Message]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        showMessageTimestampOnSwipeLeft = true
        
        
        
        if chatID == nil {
            service.getConvoId(otherId: otherId!) { [weak self] chatId in
                self?.chatID = chatId
                
            }
        }
    }
    
    func getMessages(convoId: String) {
        
    }
}


// MARK: - Delegates for VC and Delegate protocol
extension ChatViewController: MessagesDisplayDelegate, MessagesLayoutDelegate, MessagesDataSource {
    func currentSender() -> MessageKit.SenderType {
        return selfSender
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
}

// MARK: - InputBarAccessoryViewDelegate
extension ChatViewController: InputBarAccessoryViewDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        let msg = Message(sender: selfSender, messageId: "", sentDate: Date(), kind: .text(text))
        messages.append(msg)
        service.sendMessage(otherId: self.otherId, convoId: self.chatID, text: text) {
            [weak self] convoId in
            
            DispatchQueue.main.async {
                inputBar.inputTextView.text = nil
                self?.messagesCollectionView.reloadData()
                self?.messagesCollectionView.scrollToLastItem(animated: true)
            }
            self?.chatID = convoId
            
        }
        
    }
}

// Возможно, придется создавать новый файл VC, чтобы там расписать работу с сервисом, либо в уже имеющийся запихивать, пока пусть будет тут.

// MARK: - Messanger
class Service{
    func sendMessage(otherId: String?, convoId: String?, text: String, completion: @escaping (String) -> ()) {
        let ref = Firestore.firestore()
        if let uid = Auth.auth().currentUser?.uid {
            if convoId == nil {
                // create new convo
                let convoId = UUID().uuidString
                
                let selfData:[String:Any] = [
                    "date": Date(),
                    "otherId":otherId!
                ]
                
                let otherData:[String:Any] = [
                    "date": Date(),
                    "otherId":uid
                ]
                //  у нас есть переписка с человеком Х
                ref.collection("users")
                    .document(uid)
                    .collection("conversations")
                    .document(convoId)
                    .setData(selfData)
                
                //  у человека Х есть переписка с нами
                ref.collection("users")
                    .document(otherId!)
                    .collection("conversations")
                    .document(convoId)
                    .setData(otherData)
                
                let msg:[String: Any] = [
                    "date": Date(),
                    "sender": uid,
                    "text": text
                ]
                
                let convoInfo:[String: Any] = [
                    "date": Date(),
                    "selfSender": uid,
                    "otherSender": otherId!
                ]
                
                ref.collection("conversations")
                    .document(convoId)
                    .setData(convoInfo) { err in
                        if let err = err{
                            print(err.localizedDescription)
                            return
                        }
                        ref.collection("conversations")
                            .document(convoId)
                            .collection("messages")
                            .addDocument(data:msg) { err in
                                if err == nil {
                                    completion(convoId)
                                }
                            }
                    }
                
                
            } else {
                let msg:[String: Any] = [
                    "date": Date(),
                    "sender": uid,
                    "text": text
                ]
                ref.collection("conversations").document(convoId!).collection("messages").addDocument(data: msg) { err in
                    if err == nil {
                        completion(convoId!)
                    }
                }
            }
        }
    }
    
    func updateConvo(){
        
    }
    
    func getConvoId(otherId: String, completion: @escaping (String) ->() ) {
        if let uid = Auth.auth().currentUser?.uid{
            let ref = Firestore.firestore()
            ref.collection("users")
                .document(uid)
                .collection("conversations")
                .whereField("otherId", isEqualTo: otherId)
                .getDocuments { snap, err in
                    if err != nil {
                        return
                    }
                    if let snap = snap, !snap.documents.isEmpty {
                        let doc = snap.documents.first
                        if let convoId = doc?.documentID{
                            completion(convoId)
                        }
                    }
                }
        }
    }
    
    func getAllMessages(chatId: String) {
        if let uid = Auth.auth().currentUser?.uid{
            var msgs = [Message]()
            let ref = Firestore.firestore()
            ref.collection("conversations")
                .document(chatId)
                .collection("messages")
                .limit(to: 50)
                .order(by: "date",descending: true)
                .addSnapshotListener { snap, err in
                    if err != nil {
                        return
                    }
                    if let snap = snap, !snap.documents.isEmpty {
                        var sender = Sender(senderId: uid, displayName: "Me")
                        for doc in snap.documents{
                            let data = doc.data()
                            let userId = data["sender"] as! String
                            let messageId = doc.documentID
                            let date = data["date"] as! Timestamp
                            let sendDate = date.dateValue()
                        }
                    }
                }
        }
    }
    
    func getOneMessage() {
        
    }
}
