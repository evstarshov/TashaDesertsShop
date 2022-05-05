//
//  CartTableViewController.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 05.05.2022.
//

import UIKit

class CartTableViewController: UITableViewController {
    
    // MARK: Lifecycle methods:

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableview()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    // MARK: Private methods:
    
    private func setTableview() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cartCell")
        tableView.register(
            UINib(
                nibName: "CartTableViewCell",
                bundle: nil),
            forCellReuseIdentifier: "cartCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.reloadData()
    }
    
    private func setNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
