//
//  SuccessDataChangeViewController.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 16.04.2022.
//

import UIKit

class SuccessDataChangeViewController: UIViewController {

    @IBOutlet weak var goBackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: IBAction methods
    
    @IBAction func goToAuthButtonTapped() {
        let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthController") as! AuthViewController
        authVC.modalPresentationStyle = .fullScreen
        self.present(authVC, animated: true)
    }
}
