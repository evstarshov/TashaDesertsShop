//
//  CakesTableViewController.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 17.04.2022.
//

import UIKit

class CakesTableViewController: UITableViewController {
    private let requestFactory = RequestFactory()
    var catalog: [CatalogResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCatalog()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cakesCell")
        tableView.register(
                    UINib(
                        nibName: "CakeTableViewCell",
                        bundle: nil),
                    forCellReuseIdentifier: "cakesCell")
        tableView.reloadData()
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
}
