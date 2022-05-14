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
    var product: ProductResponse?
    
    //MARK: Lifecycle methods:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productId = ProductIdKeeper.productId
        configureVC()
    }
    
    // MARK: IBAction methods:
    
    @IBAction func addtoCartButtonTapped() {
        guard let product = product else { return }
        print("Added to cart \(ProductIdKeeper.productName ?? "Error")")
        let cartFactory = factory.makeCartRequestFactory()
        let request = CartRequest(productId: product.productId, quantity: 1)
        cartFactory.addToCart(cart: request) { response in
            switch response.result {
            case .success:
                DispatchQueue.main.async {
                    let item = CartItems(productId: product.productId, productName: product.productName, price: product.price, picUrl: product.picUrl)
                    CartKeeper.shared.cartItems.append(item)
                    self.showAddToCartSuccessAlert()
                }
            case .failure(let error): print(error.localizedDescription)
            }
        }
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
    
    private func configureVC() {
        getItem { product in
            DispatchQueue.main.async {
                self.product = product
                self.nameLabel.text = product.productName
                self.descriptionLabel.text = product.description
                self.priceLabel.text = String(product.price ?? 0)
                if let imageUrl = URL(string: product.picUrl ?? "https://www.pngjoy.com/pngm/309/5828658_trailer-hd-omg-404-not-found-transparent-png.png") {
                    self.itemImageView.loadImage(url: imageUrl)
                }
            }
        }
    }
    
    private func showAddToCartSuccessAlert() {
        let alert = UIAlertController(title: "Корзина", message: "Товар успешно добавлен в корзину.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Окей", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
