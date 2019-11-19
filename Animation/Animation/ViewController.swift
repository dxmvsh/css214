//
//  ViewController.swift
//  Animation
//
//  Created by Dimash on 11/18/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var loginTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 10
        loginButton.alpha = 0
        loginButton.layer.borderColor = UIColor.white.cgColor
        UIView.animate(withDuration: 1.5, delay: 1, options: .curveEaseInOut, animations: {
            self.loginButton.alpha = 1
        })
        loginTF.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -500, 0, 0)
        UIView.animate(withDuration: 0.8, delay: 0.2, options: .curveEaseOut, animations: {
            self.loginTF.layer.transform = CATransform3DIdentity
        })
        passwordTF.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 500, 0, 0)
        UIView.animate(withDuration: 0.8, delay: 0.2, options: .curveEaseOut, animations: {
            self.passwordTF.layer.transform = CATransform3DIdentity
        })
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PhoneTableViewController") as! PhoneTableViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

