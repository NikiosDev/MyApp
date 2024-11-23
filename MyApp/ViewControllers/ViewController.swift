//
//  ViewController.swift
//  MyApp
//
//  Created by Olga on 21.11.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    // MARK: - Private properties
    private let userName = "Helga"
    private let password = "123456"
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.user = userName
        
    // MARK: - Lifecycle
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  // MARK: - IBActions
    @IBAction func lognButtonPressed() {
        guard userNameTF.text == userName && passwordTF.text == password else {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password")
            return
        }
    }
    
    @IBAction func hintPassword(_ sender: Any) {
        showAlert(title: "Oops", message: "Your password is 123456")
    }
    
    @IBAction func hintUserName(_ sender: Any) {
        showAlert(title: "Oops", message: "Your User name is Helga")
    }
}
 
// MARK: - Alert
extension MainViewController {
   private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okButton)
        
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension MainViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            lognButtonPressed()
            performSegue(withIdentifier: "showWelcomeVC" , sender: nil)
        }
        return true
    }
}
