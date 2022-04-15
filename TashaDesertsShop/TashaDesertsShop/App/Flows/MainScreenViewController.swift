//
//  MainScreenViewController.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 15.04.2022.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    @IBOutlet weak var changeDataButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBAction methods:
    
    @IBAction func changeDataButtonTapped() {
        
    }
    
    @IBAction func exitButtonTapped() {
        let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthController") as! AuthViewController
        navigationController?.pushViewController(authVC, animated: true)
        
    }

}
