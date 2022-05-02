//
//  CakeItemViewController.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 02.05.2022.
//

import UIKit

class CakeItemViewController: UIViewController {
    
    // MARK: IBOoutlets:
    
    @IBOutlet weak var itemImageView: RoundImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    // MARK: Private properties:
    
    let factory = RequestFactory()
    var productId: Int?
    
    //MARK: Lifecycle methods:
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBAction methods:
    
    @IBAction func addtoCartButtonTapped() {
        
    }
    
    // MARK: Private methods:
    
    private func getItem(complition: @escaping (ProductResponse) -> Void) {
        guard let productId = productId else {
            return
        }
        let factory = factory.makeGetProductRequestFactory()
        factory.getProduct(productId: productId) { response in
            switch response.result {
            case .success(let result): complition(result)
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
}
