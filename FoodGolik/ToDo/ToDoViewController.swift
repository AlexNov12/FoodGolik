//
//  ToDoViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 28.04.2024.
//

import UIKit
import SwipeCellKit
import RealmSwift

class ToDoViewController: UIViewController {
    
    var todoItems : Results<Item>?
    var realm = try! Realm()
    
    private let tableView: UITableView = .init(frame: .zero, style: .plain)
    private let addItemButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
//        tableView.allowsSelection = true
        tableView.delegate = self
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        view.addSubview(tableView)
        view.addSubview(addItemButton)
        setupLayout()
        setupAppearance()
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
}

// MARK: - SetupLayout
extension ToDoViewController {
    func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(addItemButton.snp.top).offset(40)
            make.bottom.leading.trailing.equalToSuperview()
        }
        addItemButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(100)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
    }
}
// MARK: - SetupAppearance
extension ToDoViewController {
    func setupAppearance() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.register(SwipeTableViewCell.self, forCellReuseIdentifier: "cell")
        
        addItemButton.setBackgroundImage(UIImage(systemName: "plus.app"), for: .normal)
        addItemButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    @objc
    func showAlert() {
        var textField = UITextField()
        let alert = UIAlertController(title: "Введите дело", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        let action = UIAlertAction(title: "Дело", style: .default) { (action) in
            let newItem = Item()
            newItem.title = textField.text!
            newItem.dateCreated = Date()
            self.save(item: newItem)
        }
        alert.addTextField { (allertTextField) in
            allertTextField.placeholder = "Вводите"
            textField = allertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Datasource and Delegate protocol
extension ToDoViewController: UITableViewDataSource, UITableViewDelegate {
    // Datasource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SwipeTableViewCell
        cell.delegate = self
        
        if let item = todoItems?[indexPath.row] {
            cell.textLabel?.text = item.title
            cell.accessoryType = item.done ? .checkmark : .none
        } else {
            cell.textLabel?.text = "Нет запланированных дел"
            cell.accessoryType = .none
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50.0
    }
    
    // Delegate methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let item = todoItems?[indexPath.row] {
            do {
                try realm.write{
                    item.done = !item.done
                }
            } catch {
               print("Error saving done status, \(error)")
            }
        }
        tableView.reloadData()
        
//         Чтобы подсвечивалась на долю секунду при нажатии
        tableView.deselectRow(at: indexPath, animated: true)

    }
}

// MARK: - SwipeTableViewCellDelegate protocol

extension ToDoViewController: SwipeTableViewCellDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Удалить") { action, indexPath in                                                                              self.updateModel(at: indexPath)
        }
        deleteAction.image = UIImage(systemName: "minus.circle")
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        return options
    }
    
    func updateModel(at indexPath: IndexPath) {
        if let itemForDeletion = self.todoItems?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(itemForDeletion)
                }
            } catch{
                print("Error deleting category, \(error)")
            }
        }
    }
}

// MARK: - SetupLayout
extension ToDoViewController {
    func save(item: Item) {
        do {
            try realm.write{
                realm.add(item)
            }
        } catch {
            print("Error saving context \(error)")
        }
        tableView.reloadData()
    }
    
    func loadItems() {
        todoItems = realm.objects(Item.self)

        tableView.reloadData()
    }
}


