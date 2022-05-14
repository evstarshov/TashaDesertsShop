//
//  ChangeDataViewController.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 15.04.2022.
//

import UIKit
import FirebaseCrashlytics

class ChangeDataViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var genderControl: UISegmentedControl!
    
    private let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBAction methods:
    
    @IBAction func saveButtonTapped() {
        guard isFormFilled() else { return self.showFillError() }
        saveButton.backgroundColor = UIColor.opaqueSeparator
        saveButton.isEnabled =  false
        let factory = requestFactory.makeChangeUserDataRequestFactory()
        let user = User(id: 123,
                        login: loginTextField.text,
                        password: passwordTextField.text,
                        email: emailTextField.text,
                        gender: genderControl.selectedSegmentIndex == 0 ? "M" : "F",
                        bio: bioTextField.text,
                        name: nameTextField.text,
                        lastname: lastNameTextField.text)
        factory.changeUserData(user: user) { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let success): success.result == 1 ? self.showSuccessScreen() : self.showError(success.errorMessage ?? "Неизвестная ошибка.")
                case .failure(let error): self.showError(error.localizedDescription)
                }
            }
        }
    }
    
    @IBAction func cancelButtonTapped() {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: private methods:
    
    private func isFormFilled() -> Bool {
        guard nameTextField.text != "",
              lastNameTextField.text != "",
              emailTextField.text != "",
              loginTextField.text != "",
              passwordTextField.text != "",
              bioTextField.text != "" else {
            return false
        }
        return true
    }
    
    private func showSuccessScreen() {
        print("opening suscess vc")
        GoogleAnalyticsLogger.logEvent(name: "Data change", key: "change_data", value: "success")
        let editSuccessVC = self.storyboard?.instantiateViewController(withIdentifier: "EditDataSuccessVC") as! SuccessDataChangeViewController
        self.navigationController?.modalPresentationStyle = .fullScreen
        self.present(editSuccessVC, animated: true)
    }
    
    // MARK: Alerts
    
    private func showError(_ errorMessage: String) {
        GoogleAnalyticsLogger.logEvent(name: "Data change", key: "change_data", value: "Failture. Server error")
        let alert = UIAlertController(title: "Ошибка сервера", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showFillError() {
        GoogleAnalyticsLogger.logEvent(name: "Data change", key: "change_data", value: "fillment error")
        let alert = UIAlertController(title: "Ошибка", message: "Пожалуйста заполните все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
