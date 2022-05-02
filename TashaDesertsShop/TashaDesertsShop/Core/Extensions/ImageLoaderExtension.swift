//
//  ImageLoaderExtension.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 17.04.2022.
//

import UIKit

extension UIImageView {
    func loadImage (url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
