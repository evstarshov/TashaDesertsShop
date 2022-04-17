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
    @IBOutlet weak var productImage: RoundImage!
    
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
        self.priceLabel?.text = String(cellModel.price ?? 0)
        
        if let imageUrl = URL(string: cellModel.picUrl ?? "https://www.pngjoy.com/pngm/309/5828658_trailer-hd-omg-404-not-found-transparent-png.png"){
                    productImage.loadImage(url: imageUrl)
                }
    }
}

final class RoundImage: UIImageView {
    @IBInspectable var borderColor: UIColor = .gray
    @IBInspectable var borderWidth: CGFloat = 1.5
    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}
