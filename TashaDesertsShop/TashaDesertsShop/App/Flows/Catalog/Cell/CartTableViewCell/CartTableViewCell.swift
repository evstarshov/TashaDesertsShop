//
//  CartTableViewCell.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 05.05.2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    // MARK: IBOutlets:
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImage: RoundImageView!
    @IBOutlet weak var deteteItemButton: UIButton!
    
    // MARK: Public properties:
    
    public var delegate: CartDelegate?
    public var row: Int?
    
    // MARK: Lifecycle methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: IBActions
    
    @IBAction func deleteItemButtonTapped() {
        guard let row = row else { return }
        print("deleting item from cart at row \(row)")
        delegate?.deleteItem(row)
    }
    
    // MARK: Cell configure method
    
    public func configure(from model: CartCellModel) {
        self.productNameLabel?.text = model.productName ?? "Name error"
        self.priceLabel.text = String(model.price ?? 0)
        
        if let imageUrl = URL(string: model.picUrl ?? "https://www.pngjoy.com/pngm/309/5828658_trailer-hd-omg-404-not-found-transparent-png.png") {
            productImage.loadImage(url: imageUrl)
        }
    }
}
