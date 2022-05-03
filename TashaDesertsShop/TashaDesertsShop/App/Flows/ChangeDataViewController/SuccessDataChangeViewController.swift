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
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
