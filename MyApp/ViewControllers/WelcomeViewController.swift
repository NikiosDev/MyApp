//
//  WelcomeViewController.swift
//  MyApp
//
//  Created by Olga on 21.11.2024.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    
    var user = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let background = CAGradientLayer()
        background.colors = [UIColor.purple.cgColor, UIColor.blue.cgColor]
       background.frame = view.frame
        view.layer.insertSublayer(background, at: 0)
        greetingLabel.text = "Welcome, \(user)"
    }

    @IBAction func logOutButtonPressed() {
        dismiss(animated: true)
    }
}
