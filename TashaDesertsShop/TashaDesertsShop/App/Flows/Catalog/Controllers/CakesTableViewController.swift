//
//  CakesTableViewController.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 17.04.2022.
//

import UIKit

class CakesTableViewController: UITableViewController {
    
    // MARK: Private properties:
    
    private let requestFactory = RequestFactory()
    private var catalog: [CatalogResponse] = []
    
    //MARK: Lifecycle methods:
    override func viewDidLoad() {
        super.viewDidLoad()
        getCatalog()
        setTableview()
        setNavigationBar()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalog.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cakesCell", for: indexPath) as! CakeTableViewCell
        let item = self.catalog[indexPath.row]
        let cellModel = CakesCellFactory.cellModel(from: item)
        cell.configure(with: cellModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productId = catalog[indexPath.row].productId
        let productName = catalog[indexPath.row].productName
        let price = catalog[indexPath.row].price
        let picture = catalog[indexPath.row].picUrl
        ProductIdKeeper.productId = productId ?? 0
        ProductIdKeeper.productName = productName ?? "Error"
        ProductIdKeeper.price = price ?? 0
        ProductIdKeeper.picUrl = picture ?? "Error" 
        let itemVC = self.storyboard?.instantiateViewController(withIdentifier: "itemVC") as! CakeItemViewController
        self.navigationController?.pushViewController(itemVC, animated: true)
    }
    
    
    // MARK: Private methods
    
    private func getCatalog() {
        let factory = requestFactory.makeGetCatalogRequestFactory()
        DispatchQueue.main.async {
            factory.getCatalog(pageNumber: 1, categoryId: 1) { response in
                switch response.result {
                case .success(let result):
                    self.catalog = result
                    DispatchQueue.main.async { self.tableView.reloadData() }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func setTableview() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cakesCell")
        tableView.register(
            UINib(
                nibName: "CakeTableViewCell",
                bundle: nil),
            forCellReuseIdentifier: "cakesCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.reloadData()
    }
    
    private func setNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
