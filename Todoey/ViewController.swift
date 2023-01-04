//
//  ViewController.swift
//  Todoey
//
//  Created by YUJIN KWON on 2023/01/04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
    }
}

extension ViewController {
    func setUpNavigationBar() {
        navigationItem.title = "Todoey"
    }
}

