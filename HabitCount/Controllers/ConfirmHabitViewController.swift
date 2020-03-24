//
//  ConfirmHabitViewController.swift
//  HabitCount
//
//  Created by Mohammed Drame on 3/4/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class ConfirmHabitViewController: UIViewController {
    
    // ! Because image is needed memditorily...
    var selectedImage: HabitModel.Images!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pickedImage)
        pickedImageConstraints()
        view.addSubview(habitNameLabel)
        habitNameLabelConstraints()
        view.addSubview(habitNameTextField)
        habitNameTextFieldContstraints()
        view.addSubview(createHabitButton)
        createHabitButtonConstraints()
        
        updateUI()
    }
    
    private func updateUI() {
        title = "New Habit"
        pickedImage.image = selectedImage.image
    }
    
    lazy var pickedImage: UIImageView = {
        let pickedImage = UIImageView(frame: .zero)
        pickedImage.contentMode = .scaleAspectFit
        pickedImage.translatesAutoresizingMaskIntoConstraints = false
        //        pickedImage.image = UIImage(named: "book")
        return pickedImage
    }()
    
    func pickedImageConstraints() {
        NSLayoutConstraint.activate([
            pickedImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            pickedImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            pickedImage.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 3),
            pickedImage.heightAnchor.constraint(equalToConstant: 200)
            //            pickedImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            //            pickedImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            //            pickedImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70)
        ])
    }
    
    lazy var habitNameLabel: UILabel = {
        let habitNameLabel = UILabel(frame: .zero)
        habitNameLabel.text = "Name of New Habit"
        habitNameLabel.font = UIFont(name: "Arial", size: 30)
        habitNameLabel.textColor = .white
        habitNameLabel.textAlignment = .center
        //        habitNameLabel.backgroundColor = .systemPink
        habitNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return habitNameLabel
    }()
    
    func habitNameLabelConstraints() {
        NSLayoutConstraint.activate([
            habitNameLabel.topAnchor.constraint(equalTo: pickedImage.bottomAnchor, constant: 20),
            habitNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            habitNameLabel.widthAnchor.constraint(equalToConstant: self.view.frame.size.width / 1),
            habitNameLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    lazy var habitNameTextField: UITextField = {
        let habitNameTextField = UITextField(frame: .zero)
        habitNameTextField.translatesAutoresizingMaskIntoConstraints =  false
        habitNameTextField.placeholder = "    Hahit Name"
        habitNameTextField.textAlignment = .left
        habitNameTextField.backgroundColor = .white
        //        habitNameTextField.clipsToBounds = true
        
        // styling
        habitNameTextField.layer.masksToBounds = true
        habitNameTextField.layer.cornerRadius = 10
        habitNameTextField.layer.borderWidth = 10
        habitNameTextField.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return habitNameTextField
    }()
    
    func habitNameTextFieldContstraints() {
        NSLayoutConstraint.activate([
            habitNameTextField.topAnchor.constraint(equalTo: habitNameLabel.bottomAnchor, constant: 10),
            habitNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            habitNameTextField.widthAnchor.constraint(equalToConstant: view.frame.size.width / 1.5),
            habitNameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    lazy var createHabitButton:UIButton = {
        let createHabitButton = UIButton(frame: .zero)
        createHabitButton.backgroundColor = .green
        createHabitButton.translatesAutoresizingMaskIntoConstraints = false
        createHabitButton.setTitle("Create Habit", for: .normal)
        createHabitButton.setTitleColor(.black, for: .normal)
        createHabitButton.layer.cornerRadius = 10
        createHabitButton.addTarget(self, action: #selector(createHabitButtonPressed), for: .touchUpInside)
        return createHabitButton
    }()
    
    
    @objc func createHabitButtonPressed() {
        var persistenceLayer = PresistenceObject()
        guard let habitText = habitNameTextField.text else { return }
        persistenceLayer.createNewHabit(habitTitle: habitText, selectedImage: selectedImage)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func createHabitButtonConstraints() {
        NSLayoutConstraint.activate([
            createHabitButton.topAnchor.constraint(equalTo: habitNameTextField.bottomAnchor, constant: 15),
            createHabitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createHabitButton.widthAnchor.constraint(equalToConstant: view.frame.size.width / 1.5),
            createHabitButton.heightAnchor.constraint(equalToConstant: 60)
            //            createHabitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
    }
    
    
    
    
    
    
    
    
}
