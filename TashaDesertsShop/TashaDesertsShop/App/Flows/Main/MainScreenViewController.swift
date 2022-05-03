//
//  MainScreenViewController.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 15.04.2022.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    //MARK: IBOutlets:
    
    @IBOutlet weak var changeDataButton: UIButton!
    @IBOutlet weak var goToCatalogButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
    //MARK: Lifecycle methods:

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: IBAction methods:
    
    @IBAction func changeDataButtonTapped() {
        let editVC = self.storyboard?.instantiateViewController(withIdentifier: "ChangeDataVC") as! ChangeDataViewController
        self.navigationController?.present(editVC, animated: true)
    }
    
    @IBAction func exitButtonTapped() {
        let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthController") as! AuthViewController
        self.navigationController?.pushViewController(authVC, animated: true)
    }
    
    @IBAction func goToCatalogButtonTapped() {
        let cakesTVC = self.storyboard?.instantiateViewController(withIdentifier: "cakesVC") as! CakesTableViewController
        self.navigationController?.pushViewController(cakesTVC, animated: true)
    }

}
