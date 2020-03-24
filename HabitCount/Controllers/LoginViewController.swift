//
//  LoginViewController.swift
//  HabitCount
//
//  Created by Mohammed Drame on 3/22/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(welcomeBacklabel)
        welcomeBacklabelConstrain()
        view.addSubview(logoImage)
        logoImageConstraints()
        view.addSubview(logInRegisterStackView)
        logInRegisterStackViewConstraint()
        logInRegisterTextFields()
        
        view.addSubview(logIn)
        loginConstrain()
    }
    
    // Todo ...
    // 1. Create welcome back label ✅
    
    // 2. Create bounce Title label ✅
    
    // 3. Create logo imageView ✅
    
    // 4. Create stackview for email and password field ✅
    
    // 5. Create stackview constraing ✅
    
    // 6. create textfield ✅
    
    // 7. add textfields to stackview ✅
    
    // 8. create forgot password button ❌
    
    // 9. create log in button ✅
    
    // 10. stackview for singup label and sign up button
    
    // 11. create stackview constrain
    
    // 12. signup label and button and add to stackview
    
    lazy var welcomeBacklabel: UILabel = {
        let welcomeBacklabel = UILabel(frame: .zero)
        welcomeBacklabel.text = "Welcome Back ! ! !"
        welcomeBacklabel.font = UIFont(name: "Arial", size: 25)
        welcomeBacklabel.translatesAutoresizingMaskIntoConstraints = false
        return welcomeBacklabel
    }()
    
    func welcomeBacklabelConstrain() {
        NSLayoutConstraint.activate([
            welcomeBacklabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            welcomeBacklabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    lazy var logoImage: UIImageView = {
        let logoImage = UIImageView(frame: .zero)
        logoImage.contentMode = .scaleAspectFit
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = #imageLiteral(resourceName: "other")
        return logoImage
    }()
    
    func logoImageConstraints() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: welcomeBacklabel.topAnchor, constant: 60),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            logoImage.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 4),
            logoImage.heightAnchor.constraint(equalToConstant: 200)
            //            pickedImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            //            pickedImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            //            pickedImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70)
        ])
    }
    
    
    lazy var logInRegisterStackView: UIStackView = {
        let logInRegisterStackView = UIStackView(frame: .zero)
        logInRegisterStackView.axis = .vertical
        logInRegisterStackView.distribution = .fillEqually
        logInRegisterStackView.spacing = 5
        logInRegisterStackView.translatesAutoresizingMaskIntoConstraints = false
        return logInRegisterStackView
    }()
    
    func logInRegisterStackViewConstraint() {
        NSLayoutConstraint.activate([
            logInRegisterStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInRegisterStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            logInRegisterStackView.widthAnchor.constraint(equalToConstant: 280),
            logInRegisterStackView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    func logInRegisterTextFields() {
        for i in 0...1 {
            let logInRegisterTextFields = UITextField()
            logInRegisterTextFields.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            logInRegisterTextFields.layer.cornerRadius = 10
            logInRegisterTextFields.clipsToBounds = true
            logInRegisterTextFields.layer.borderWidth = 5
            logInRegisterTextFields.layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 0)
            logInRegisterTextFields.leftViewMode = .always
            let leftView = UIView(frame: CGRect(x: 0, y: 5, width: 10, height: logInRegisterTextFields.frame.size.height))
            logInRegisterTextFields.leftView = leftView
            // Ignore this ungly code, I' was testing something ...
            if i == 0 {
                logInRegisterTextFields.placeholder = "Email / UserName"
            } else {
                logInRegisterTextFields.placeholder = "PassWord"
            }
            logInRegisterStackView.addArrangedSubview(logInRegisterTextFields)
        }
    }
    
    
    lazy var logIn: UIButton = {
        let login = UIButton(frame: .zero)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.setTitle("logIn", for: .normal)
        login.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        login.layer.cornerRadius = 5
        login.addTarget(self, action: #selector(logInPress), for: .touchUpInside)
        return login
    }()
    
    @objc func logInPress() {
        performSegue(withIdentifier: "homefromlogin", sender: self)
    }
    
    func loginConstrain() {
        NSLayoutConstraint.activate([
            logIn.topAnchor.constraint(equalTo: logInRegisterStackView.bottomAnchor, constant: 20),
            logIn.widthAnchor.constraint(equalTo: logInRegisterStackView.widthAnchor),
            logIn.heightAnchor.constraint(equalToConstant: 70),
            logIn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    
    
    
    
    
}
