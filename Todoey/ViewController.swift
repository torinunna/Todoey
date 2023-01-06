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

extension ViewController {
    func setUpNavigationBar() {
        navigationItem.title = "Todoey"
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonPressed))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addButtonPressed() {
        let vc = AddViewController()
        self.present(vc, animated: true)
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}

