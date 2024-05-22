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
        
        messages.append(Message(sender: selfSender, messageId: "1", sentDate: Date().addingTimeInterval(-11200), kind: .text("Hello")))
        messages.append(Message(sender: otherSender, messageId: "2", sentDate: Date().addingTimeInterval(-10200), kind: .text("Hello! All is good!")))
        messages.append(Message(sender: otherSender, messageId: "2", sentDate: Date().addingTimeInterval(-90200), kind: .text("And you?")))
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        showMessageTimestampOnSwipeLeft = true
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
        let msg = Message(sender: selfSender, messageId: "1234", sentDate: Date(), kind: .text(text))
        messages.append(msg)
        service.sendMessage(otherId: self.otherId, convoId: self.chatID, message: msg, text: text) {
            [weak self] isSend in // Вопрос, что такое "isSend", но мб это имя замыкания у нас тут будеь
            
            DispatchQueue.main.async {
                inputBar.inputTextView.text = nil
                self?.messagesCollectionView.reloadData()
                self?.messagesCollectionView.scrollToLastItem(animated: true)
            }
            
        }

    }
}

// Возможно, придется создавать новый файл VC, чтобы там расписать работу с сервисом, либо в уже имеющийся запихивать, пока пусть будет тут.

// MARK: - Messanger
class Service{
    func sendMessage(otherId: String?, convoId: String?, message: Message, text: String, completion: @escaping (Bool) -> ()) {
        if convoId == nil {
            // create new convo
        } else {
            let msg:[String: Any] = [
                "date": Date(),
                "sender": message.sender.senderId,
                "text": text
            ]
            Firestore.firestore().collection("conversations").document(convoId!).collection("messages").addDocument(data: msg) { err in
                if err == nil {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
    }
    
    func updateConvo(){
        
    }
    
    func getConvoId() {
        
    }
    
    func getAllMessages() {
        
    }
    
    func getOneMessage() {
        
    }
}

