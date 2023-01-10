//
//  ViewController.swift
//  Todoey
//
//  Created by YUJIN KWON on 2023/01/04.
//

import SnapKit
import UIKit

class ViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.dataSource = self
        tableView.register(ToDoCell.self, forCellReuseIdentifier: ToDoCell.identifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        setUpNavigationBar()
        setUpTableView()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ToDoCell.identifier, for: indexPath) as? ToDoCell
        cell?.setUpLayout()
        return cell ?? UITableViewCell()
    }
    
}

extension ViewController: UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController {
    func setUpNavigationBar() {
        navigationItem.title = "Todoey"
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonPressed))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addButtonPressed() {
        let alert = UIAlertController(title: "Add New Todoey", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: .default) { (action) in
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}

