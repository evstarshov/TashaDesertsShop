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
    @IBOutlet weak var goBackButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBAction methods:
    
    @IBAction func signupButtonTapped() {
        guard isFormFilled() else { return self.showEditError() }
        signupButton.backgroundColor = UIColor.opaqueSeparator
        signupButton.isEnabled = false
        
        let factory = requestFactory.makeSignupRequestFactory()
        let user = User(login: loginField.text,
                        password: passwordField.text,
                        email: emailField.text,
                        gender: genderControl.selectedSegmentIndex == 0 ? "M" : "F",
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
        //signupButton.backgroundColor = UIColor.opaqueSeparator
        //signupButton.isEnabled = false
    }
    
    @IBAction func goBackButtonTapped() {
        let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthController") as! AuthViewController
        authVC.modalPresentationStyle = .fullScreen
        self.present(authVC, animated: true)
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
    
    private func showEditError() {
        let alert = UIAlertController(title: "Вы не заполнили поля", message: "Нужно заполнить все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func registerNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    // MARK: objc methods
    
    @objc func editingChanged(_ textField: UITextField) {
        guard isFormFilled() else {
            signupButton.backgroundColor = UIColor.opaqueSeparator
            signupButton.isEnabled = false
            return
        }
        signupButton.backgroundColor = UIColor.systemOrange
        signupButton.isEnabled = true
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        var contentInset: UIEdgeInsets = self.scrollView.contentInset
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        contentInset.bottom = keyboardFrame.size.height + 50
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification) {
        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
}

    
