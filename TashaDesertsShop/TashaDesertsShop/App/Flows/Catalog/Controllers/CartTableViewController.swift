//
//  CartTableViewController.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 05.05.2022.
//

import UIKit
import FirebaseCrashlytics

protocol CartDelegate {
    func deleteItem(_ index: Int)
}

class CartTableViewController: UITableViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var cartContentLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    // MARK: Private properties:
    
    private let factory = RequestFactory()
    
    // MARK: Lifecycle methods:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableview()
        GoogleAnalyticsLogger.logEvent(name: "view_cart", key: "result", value: "success")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if CartKeeper.shared.cartItems.count == 0 {
            return 1
        } else {
            cartContentLabel.text = "Выбрано товаров \(CartKeeper.shared.cartItems.count) на сумму \(CartKeeper.shared.cartItems.map { $0.price! }.reduce(0, +).formattedString)"
            return CartKeeper.shared.cartItems.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if CartKeeper.shared.cartItems.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "emptyCell", for: indexPath)
            cell.textLabel?.text = "Корзина пуста"
            cell.textLabel?.textAlignment = .center
            self.tableView.tableFooterView = nil
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as? CartTableViewCell
            let item = CartKeeper.shared.cartItems[indexPath.row]
            let cellModel = CartCellModelFactory.cartCellModel(from: item)
            cell?.configure(from: cellModel)
            cell?.delegate = self
            cell?.row = indexPath.row
            return cell ?? UITableViewCell()
        }
    }
    
    // MARK: IBAction methods:
    
    @IBAction func buyButtonTapped() {
        print("Payment begin")
        let factory = factory.makeCartRequestFactory()
        let user = UserKeeper.shared.userLogin
        let alert = UIAlertController(title: "Корзина", message: "Спасибо за покупку!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        factory.payCart(user: user ?? User(id: 123)) { response in
            switch response.result {
            case .success:
                DispatchQueue.main.async {
                    self.present(alert, animated: true, completion: {
                        CartKeeper.shared.cartItems = []
                        self.tableView.reloadData()
                    })
                }
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
    // MARK: Private methods:
    
    private func setTableview() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "emptyCell")
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

// MARK: CartTableViewController delegate extension:

extension CartTableViewController: CartDelegate {
    func deleteItem(_ index: Int) {
        guard let itemName = CartKeeper.shared.cartItems[index].productName else {
            Crashlytics.crashlytics().log("itemName is nil!")
            return
        }
        let cartFactory = factory.makeCartRequestFactory()
        let request = CartRequest(productId: index)
        let alert = UIAlertController(title: "Корзина", message: "Вы действительно хотите удалить \(itemName) из корзины?", preferredStyle: .alert)
        alert.view.accessibilityIdentifier = "cart_alert"
        alert.view.accessibilityValue = "Do you want to remove the item from cart?"
        alert.addAction(UIAlertAction(title: "Да", style: .destructive, handler: { _ in
            CartKeeper.shared.cartItems.remove(at: index)
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Нет", style: .default, handler: nil))
        
        cartFactory.deleteFromCart(cart: request) { response in
            switch response.result {
            case .success:
                DispatchQueue.main.async {
                    self.present(alert, animated: true, completion: nil)
                }
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
}
