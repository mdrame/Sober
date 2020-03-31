//
//  RegisterViewController.swift
//  HabitCount
//
//  Created by Mohammed Drame on 3/22/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(registerlabel)
        registerlabellabelConstrain()
        view.addSubview(registerTextFieldStackView)
        registerTextFieldStackViewConstraint()
        registerTextFields()
        view.addSubview(register)
        registerConstrain()
    }
    // Todo ...
    // 1. Registraction Label ✅
    // 2. StackView with constrain ✅
    // 3. Add three textfield to stackView ✅
    // 4. sign up button ✅
    // 5. already have an account label and create one button in a stackview
    
    lazy var registerlabel: UILabel = {
           let registerlabel = UILabel(frame: .zero)
           registerlabel.text = "Register"
           registerlabel.font = UIFont(name: "Arial", size: 20)
           registerlabel.translatesAutoresizingMaskIntoConstraints = false
           return registerlabel
       }()
       
       func registerlabellabelConstrain() {
           NSLayoutConstraint.activate([
               registerlabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
               registerlabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//               registerlabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
           ])
       }
    
    lazy var registerTextFieldStackView: UIStackView = {
        let registerTextFieldStackView = UIStackView(frame: .zero)
        registerTextFieldStackView.axis = .vertical
        registerTextFieldStackView.distribution = .fillEqually
        registerTextFieldStackView.spacing = 15
        registerTextFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        return registerTextFieldStackView
    }()
    
    func registerTextFieldStackViewConstraint() {
        NSLayoutConstraint.activate([
            registerTextFieldStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            registerTextFieldStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            registerTextFieldStackView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width / 1.5),
            registerTextFieldStackView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    
    func registerTextFields() {
        for i in 0...2 {
            let textFields = UITextField()
            textFields.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            textFields.layer.cornerRadius = 10
            textFields.clipsToBounds = true
            textFields.layer.borderWidth = 5
            textFields.layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 0)
            textFields.leftViewMode = .always
            let leftView = UIView(frame: CGRect(x: 0, y: 5, width: 10, height: textFields.frame.size.height))
            textFields.leftView = leftView
           if i == 0 {
               textFields.placeholder = "Name"
           } else if i == 1 {
               textFields.placeholder = "Email"
           } else if i == 2 {
            textFields.placeholder = "PassWord"
            }
            registerTextFieldStackView.addArrangedSubview(textFields)
        }
    }
    
    lazy var register: UIButton = {
           let register = UIButton(frame: .zero)
           register.translatesAutoresizingMaskIntoConstraints = false
           register.setTitle("Register", for: .normal)
           register.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
           register.layer.cornerRadius = 5
           register.addTarget(self, action: #selector(registerPress), for: .touchUpInside)
           return register
       }()
       
       @objc func registerPress() {
           performSegue(withIdentifier: "homefromlogin", sender: self)
       }
       
       func registerConstrain() {
           NSLayoutConstraint.activate([
               register.topAnchor.constraint(equalTo: registerTextFieldStackView.bottomAnchor, constant: 20),
               register.widthAnchor.constraint(equalTo: registerTextFieldStackView.widthAnchor),
               register.heightAnchor.constraint(equalToConstant: 70),
               register.centerXAnchor.constraint(equalTo: view.centerXAnchor)
           ])
       }
    
    
    
    
    
    
    
    

}
