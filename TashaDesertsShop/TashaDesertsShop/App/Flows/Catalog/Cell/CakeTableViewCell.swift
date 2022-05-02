//
//  TableViewCell.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 17.04.2022.
//

import UIKit

class CakeTableViewCell: UITableViewCell {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImage: RoundImageView!
    
    // MARK: Cell Configure
    
    func configure(with cellModel: CatalogResponseModel) {
        self.nameLabel?.text = cellModel.productName ?? "Name error"
        self.descriptionLabel?.text = cellModel.shortDescription ?? "Descroption error"
        self.priceLabel?.text = String(cellModel.price ?? 0)
        
        if let imageUrl = URL(string: cellModel.picUrl ?? "https://www.pngjoy.com/pngm/309/5828658_trailer-hd-omg-404-not-found-transparent-png.png"){
                    productImage.loadImage(url: imageUrl)
                }
    }
}
