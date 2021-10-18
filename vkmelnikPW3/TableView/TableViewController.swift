//
//  TableViewController.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

protocol TableViewDisplayLogic {
    
}

class TableViewController: UIViewController {
    
    private var interactor: TableViewBuisnessLogic?
    private var tableView: UITableView?
    
    func setupViewController(interactor: TableViewBuisnessLogic) {
        self.interactor = interactor
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = #colorLiteral(red: 0.818212769, green: 0.6417710149, blue: 0.001925064622, alpha: 1)
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView?.reloadData()
    }

    private func setupTableView() {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        tableView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        tableView.pin(to: view, .left, .right)
        tableView.backgroundColor = .white
        self.tableView = tableView
        tableView.register(AlarmViewCell.self, forCellReuseIdentifier: "alarmViewCell")
        tableView.delegate = interactor?.getTableViewDelegate()
        tableView.dataSource = interactor?.getTableViewDataSource()
    }

}

extension TableViewController: TableViewDisplayLogic {
    
}
