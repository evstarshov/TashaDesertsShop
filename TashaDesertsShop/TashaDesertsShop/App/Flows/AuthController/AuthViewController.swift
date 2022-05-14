//
//  AuthViewController.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 15.04.2022.
//

import UIKit
import FirebaseCrashlytics

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
        guard isFormFilled() else { return self.showFillError() }
        let factory = requestFactory.makeAuthRequestFactory()
        let user = User(login: loginField.text, password: passwordField.text)
        factory.login(user: user) { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let success):
                    if success.result == 1 {
                        UserKeeper.shared.userLogin = user
                        self.proceedToMainScreen()
                    } else {
                        self.showError(success.errorMessage ?? "Неизвестная ошибка.")
                    }
                case .failure(let error): self.showError(error.localizedDescription)
                }
            }
        }
    }
    
    @IBAction func signUpButtonTapped() {
        let singupVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") as! SignUpViewController
        self.navigationController?.present(singupVC, animated: true)
    }
    
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
        print("test crash")
        let numbers = [0]
        let _ = numbers[1]
    }
    
    // MARK: Navigation
    
    private func proceedToMainScreen() {
        GoogleAnalyticsLogger.logEvent(name: "login", key: "result", value: "success")
        let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainScreenViewController
        self.navigationController?.pushViewController(mainVC, animated: true)
    }
    
    // MARK: Alerts
    
    private func showError(_ errorMessage: String) {
        GoogleAnalyticsLogger.logEvent(name: "login", key: "result", value: "failture")
        let alert = UIAlertController(title: "Ошибка авторизации", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок(", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showFillError() {
        let alert = UIAlertController(title: "Ошибка", message: "Поля не заполнены", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок(", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: Private methods
    
    private func isFormFilled() -> Bool {
        guard loginField.text != "",
              passwordField.text != "" else {
            return false
        }
        return true
    }
    
}
