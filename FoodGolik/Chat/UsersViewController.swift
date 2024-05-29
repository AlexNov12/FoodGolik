//
//  ChatViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 22.04.2024.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class UsersViewController: UIViewController {
    
    private let tableView: UITableView = .init(frame: .zero, style: .plain)
    var users = [CurentUser]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        setupLayout()
        setupAppearance()
        getAllUsers()
        
    }
}

// MARK: - SetupLayout
extension UsersViewController {
    func setupLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}

// MARK: - SetupAppearance
extension UsersViewController {
    func setupAppearance() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: "UserCellTableViewCell", bundle: nil), forCellReuseIdentifier: UserCellTableViewCell.reuseId)
    }
}

// MARK: - Datasource and Delegate protocol
extension UsersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count // ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCellTableViewCell.reuseId, for: indexPath) as! UserCellTableViewCell
        cell.selectionStyle = .none
        let cellName = users[indexPath.row]
        cell.configCell(cellName.email)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userId = users[indexPath.row].id
        let vc = ChatViewController()
        vc.otherId = userId
        vc.chatID = "fistChatId" // Что с этим делать и откуда будем тянуть пока вопрос
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Get data from Firebase
extension UsersViewController {
    func getAllUsers() {
        // Чтобы себя не выводил в списке чатов
        guard let email = Auth.auth().currentUser?.email else {return}
        Firestore.firestore().collection("users")
        .whereField("email", isNotEqualTo: email)
        .getDocuments { snap, err in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            }

            var currentUsers = [CurentUser]()
            if let docs = snap?.documents {
                for doc in docs {
                    let data = doc.data()
                    let userId = doc.documentID
                    if let email = data["email"] as? String {
                        currentUsers.append(CurentUser(id: userId, email: email))
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.users = currentUsers
                self.tableView.reloadData()
            }
        }
    }
}
