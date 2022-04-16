//
//  AuthViewController.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 15.04.2022.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var authButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    private let requestFactory = RequestFactory()
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginField.text = "rakodill"
        passwordField.text = "mypass"
    }
    
    // MARK: IBActions
    
    @IBAction func loginButtonTapped() {
        let factory = requestFactory.makeAuthRequestFactory()
        let user = User(login: loginField.text, password: passwordField.text)
        factory.login(user: user) { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let success): success.result == 1 ? self.proceedToMainScreen() : self.showError(success.errorMessage ?? "Неизвестная ошибка.")
                case .failure(let error): self.showError(error.localizedDescription)
                }
            }
        }
    }
    
    @IBAction func signUpButtonTapped() {
        let singupVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") as! SignUpViewController
        singupVC.modalPresentationStyle = .fullScreen
        self.present(singupVC, animated: true)
    }
    
    // MARK: Navigation
    
    private func proceedToMainScreen() {
        let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainScreenViewController
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC, animated: true)
    }
    
    // MARK: Alerts
    
    private func showError(_ errorMessage: String) {
        let alert = UIAlertController(title: "Ошибка авторизации", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок(", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
