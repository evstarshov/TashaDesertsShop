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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
