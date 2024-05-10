//
//  ToDoViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 28.04.2024.
//

import UIKit

class ToDoViewController: UIViewController {
    
    private let tableView: UITableView = .init(frame: .zero, style: .insetGrouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
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
            make.top.bottom.leading.trailing.equalToSuperview()
//            make.leading.equalTo(view.snp.leading).offset(0)
//            make.trailing.equalTo(view.snp.trailing).offset(0)
//            make.bottom.equalTo(view.snp.bottom).offset(0)
        }
    }
}
// MARK: - SetupAppearance
extension ToDoViewController {
    func setupAppearance() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

// MARK: - Datasource and Delegate protocol
extension ToDoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50.0
    }
    
    
}
