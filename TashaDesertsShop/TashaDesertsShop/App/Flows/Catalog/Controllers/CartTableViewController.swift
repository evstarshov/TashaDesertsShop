//
//  CartTableViewController.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 05.05.2022.
//

import UIKit

class CartTableViewController: UITableViewController {
    
    // MARK: Private properties:
    
    private var cartItems = [CartItems]()
    
    // MARK: Lifecycle methods:

    override func viewDidLoad() {
        super.viewDidLoad()
        cartItems = CartKeeper.shared.cartItems
        setTableview()
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if CartKeeper.shared.cartItems.count == 0 {
            let cell = UITableViewCell()
            cell.textLabel?.text = "Корзина пуста"
            self.tableView.tableFooterView = nil
            return cell
        } else {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        let item = self.cartItems[indexPath.row]
        let cellModel = CartCellModelFactory.cartCellModel(from: item)
        cell.configure(from: cellModel)
        return cell
        }
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
