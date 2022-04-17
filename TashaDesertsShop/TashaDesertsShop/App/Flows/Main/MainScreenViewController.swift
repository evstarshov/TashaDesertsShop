//
//  MainScreenViewController.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 15.04.2022.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    @IBOutlet weak var changeDataButton: UIButton!
    @IBOutlet weak var goToCatalogButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBAction methods:
    
    @IBAction func changeDataButtonTapped() {
        let editVC = self.storyboard?.instantiateViewController(withIdentifier: "ChangeDataVC") as! ChangeDataViewController
        editVC.modalPresentationStyle = .fullScreen
        self.present(editVC, animated: true)
    }
    
    @IBAction func exitButtonTapped() {
        let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthController") as! AuthViewController
        authVC.modalPresentationStyle = .fullScreen
        self.present(authVC, animated: true)
    }
    
    @IBAction func goToCatalogButtonTapped() {
        let cakesTVC = self.storyboard?.instantiateViewController(withIdentifier: "cakesVC") as! CakesTableViewController
        cakesTVC.modalPresentationStyle = .fullScreen
        self.present(cakesTVC, animated: true)
    }

}
