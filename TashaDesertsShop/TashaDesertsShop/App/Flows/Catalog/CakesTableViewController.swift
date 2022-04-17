//
//  CakesTableViewController.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 17.04.2022.
//

import UIKit

class CakesTableViewController: UITableViewController {
    private let requestFactory = RequestFactory()
    private var catalog: [CatalogResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCatalog()
        
        //        tableView.register(UITableViewCell.self, forHeaderFooterViewReuseIdentifier: "headerCell")
        //        tableView.register(CakeTableViewCell.self, forHeaderFooterViewReuseIdentifier: "catalogCell")
        //        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalog.count
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
