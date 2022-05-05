//
//  CakeItemViewController.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 02.05.2022.
//

import UIKit

class CakeItemViewController: UIViewController {
    
    // MARK: IBOoutlets:
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var goToCartButton: UIBarButtonItem!
    @IBOutlet weak var itemStackView: UIStackView!
   
    
    // MARK: Private properties:
    
    let factory = RequestFactory()
    var productId: Int?
    
    //MARK: Lifecycle methods:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productId = ProductIdKeeper.productId
        getItem { product in
            DispatchQueue.main.async {
                self.nameLabel.text = product.productName
                self.descriptionLabel.text = product.description
                self.priceLabel.text = String(product.price ?? 0)
                if let imageUrl = URL(string: product.picUrl ?? "https://www.pngjoy.com/pngm/309/5828658_trailer-hd-omg-404-not-found-transparent-png.png") {
                    self.itemImageView.loadImage(url: imageUrl)
                }
            }
        }
    }
    
    // MARK: IBAction methods:
    
    @IBAction func addtoCartButtonTapped() {
        guard self.addToCartButton.isEnabled == true else { return }
        CartKeeper.shared.cartItems.append(CartItems(productId: ProductIdKeeper.productId, productName: ProductIdKeeper.productName, price: ProductIdKeeper.price, picUrl: ProductIdKeeper.picUrl))
        self.addToCartButton.isEnabled = false
        self.addToCartButton.backgroundColor = .gray
        print("Added to cart \(ProductIdKeeper.productName ?? "Error")")
    }
    
    @IBAction func goToCartButtonTapped() {
        let cartVC = self.storyboard?.instantiateViewController(withIdentifier: "cartVC") as! CartTableViewController
        cartVC.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(cartVC, animated: true)
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
