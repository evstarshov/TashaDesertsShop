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
    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Cell Configure
    
    func configure(with cellModel: CatalogResponseModel) {
        self.nameLabel?.text = cellModel.productName ?? "Name error"
        self.descriptionLabel?.text = cellModel.shortDescription ?? "Descroption error"
//        var priceString = String(cellModel.price)
//        priceLabel.text = priceString
    }
}
