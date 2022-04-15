//
//  SignUpViewController.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 15.04.2022.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var bioField: UITextField!
    @IBOutlet weak var genderControl: UISegmentedControl!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var clearFormButton: UIButton!
    
    private let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBAction methods:
    
    @IBAction func signupButtonTapped() {
        signupButton.backgroundColor = UIColor.opaqueSeparator
        signupButton.isEnabled = false
        
        let factory = requestFactory.makeSignupRequestFactory()
        let user = User(login: loginField.text,
                        password: passwordField.text,
                        email: emailField.text,
                        gender: genderControl.selectedSegmentIndex == 0 ? "М" : "Ж",
                        bio: bioField.text,
                        name: nameField.text,
                        lastname: lastnameField.text)
        factory.signup(user: user) { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let success): success.result == 1 ? self.showSuccessScreen() : self.showError(success.errorMessage ?? "Неизвестная ошибка.")
                case .failure(let error): self.showError(error.localizedDescription)
                }
            }
        }
    }
    
    @IBAction func cleanFormButtonTapped() {
        nameField.text = ""
        lastnameField.text = ""
        emailField.text = ""
        genderControl.selectedSegmentIndex = 0
        loginField.text = ""
        passwordField.text = ""
        bioField.text = ""
        signupButton.backgroundColor = UIColor.opaqueSeparator
        signupButton.isEnabled = false
    }
    
    // MARK: Private methods:
    
    private func showSuccessScreen() {
        let successVC = self.storyboard?.instantiateViewController(withIdentifier: "SuccessSignVC") as! SuccessSignViewController
        successVC.modalPresentationStyle = .fullScreen
        self.present(successVC, animated: true)
    }
    
    private func isFormFilled() -> Bool {
        guard nameField.text != "",
              lastnameField.text != "",
              emailField.text != "",
              loginField.text != "",
              passwordField.text != "" else {
                  return false
              }
        return true
    }
    
    private func showError(_ errorMessage: String) {
        let alert = UIAlertController(title: "Ошибка сервера", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
