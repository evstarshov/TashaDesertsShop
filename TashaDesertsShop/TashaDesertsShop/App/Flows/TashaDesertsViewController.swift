//
//  GBShopViewController.swift
//  GBShop
//
//  Created by Ярослав on 01.12.2021.
//

import UIKit

class TashaDesertsShopViewController: UIViewController {
    let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeAuthRequest()
    }
    
    // MARK: Request methods
    
    func makeAuthRequest() {
        let factory = requestFactory.makeAuthRequestFactory()
        let user = User(login: "Login", password: "Password")
        
        factory.login(userName: user.login ?? "", password: user.password ?? "") { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}
