//
//  SuccessSignViewController.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 15.04.2022.
//

import UIKit

class SuccessSignViewController: UIViewController {
    
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func okButtonTapped() {
        let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthController") as! AuthViewController
        authVC.modalPresentationStyle = .fullScreen
        self.present(authVC, animated: true)
    }
}
