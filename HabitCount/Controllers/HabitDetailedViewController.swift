//
//  HabitDetailedViewController.swift
//  HabitCount
//
//  Created by Mohammed Drame on 3/21/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class HabitDetailedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageViewIcon)
        imageViewIconConstraints()
        view.addSubview(labelCurrentStreak)
        labelCurrentStreakConstraints()
        view.addSubview(labelCurrentStreakLabel)
        labelCurrentStreakLabelConstraints()
        view.addSubview(totalCompletionLabelsStack)
        totalCompletionLabelsStackConstraints()
        totalCompletionLabelsStack.addArrangedSubview(labelTotalCompletionsLabel)
        totalCompletionLabelsStack.addArrangedSubview(labelTotalCompletions)
        view.addSubview(labelBestStreakStackView)
        labelBestStreakStackViewConstraint()
        labelBestStreakStackView.addArrangedSubview(labelBestStreakLabel)
        labelBestStreakStackView.addArrangedSubview(labelBestStreak)
        view.addSubview(labelStartingDateStackView)
        labelStartingDateStackViewConstraint()
        labelStartingDateStackView.addArrangedSubview(labelStartingDateLabel)
        labelStartingDateStackView.addArrangedSubview(labelStartingDate)
        view.addSubview(buttonAction)
        buttonActionConstraint()
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    var habit: HabitModel!
    var habitIndex: Int!
    private var persistence = PresistenceObject()
    
    lazy var imageViewIcon: UIImageView = {
        let imageViewIcon = UIImageView(frame: .zero)
        imageViewIcon.contentMode = .scaleAspectFit
        imageViewIcon.translatesAutoresizingMaskIntoConstraints = false
        //        pickedImage.image = UIImage(named: "book")
        return imageViewIcon
    }()
    
    func imageViewIconConstraints() {
        NSLayoutConstraint.activate([
            imageViewIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            imageViewIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            imageViewIcon.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 3),
            imageViewIcon.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    lazy var labelCurrentStreak: UILabel = {
        let labelCurrentStreak = UILabel(frame: .zero)
        labelCurrentStreak.translatesAutoresizingMaskIntoConstraints = false
        labelCurrentStreak.backgroundColor = .systemRed
        labelCurrentStreak.textAlignment = .center
        return labelCurrentStreak
    }()
    
    func labelCurrentStreakConstraints() {
           NSLayoutConstraint.activate([
               labelCurrentStreak.topAnchor.constraint(equalTo: imageViewIcon.bottomAnchor, constant: 20),
               labelCurrentStreak.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
               labelCurrentStreak.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 3),
               labelCurrentStreak.heightAnchor.constraint(equalToConstant: 100)
           ])
       }
    
    lazy var labelCurrentStreakLabel: UILabel = {
        let labelCurrentStreak = UILabel(frame: .zero)
        labelCurrentStreak.translatesAutoresizingMaskIntoConstraints = false
        labelCurrentStreak.backgroundColor = .systemRed
        labelCurrentStreak.textAlignment = .center
        labelCurrentStreak.text = "Current Streak"
        return labelCurrentStreak
    }()
    
    func labelCurrentStreakLabelConstraints() {
              NSLayoutConstraint.activate([
                  labelCurrentStreakLabel.topAnchor.constraint(equalTo: labelCurrentStreak.bottomAnchor, constant: 0),
                  labelCurrentStreakLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                  labelCurrentStreakLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 3),
                  labelCurrentStreakLabel.heightAnchor.constraint(equalToConstant: 100)
              ])
          }
    
    lazy var labelTotalCompletions: UILabel = {
        let labelTotalCompletions = UILabel(frame: .zero)
        labelTotalCompletions.translatesAutoresizingMaskIntoConstraints = false
        labelTotalCompletions.backgroundColor = .systemRed
        labelTotalCompletions.textAlignment = .center
        return labelTotalCompletions
    }()
    
    
    lazy var labelTotalCompletionsLabel: UILabel = {
        let labelTotalCompletionsLabel = UILabel(frame: .zero)
        labelTotalCompletionsLabel.translatesAutoresizingMaskIntoConstraints = false
        labelTotalCompletionsLabel.backgroundColor = .systemRed
        labelTotalCompletionsLabel.textAlignment = .center
        labelTotalCompletions.text = "Total:"
        return labelTotalCompletionsLabel
    }()
    
    lazy var totalCompletionLabelsStack: UIStackView = {
        let totalCompletionLabelsStack = UIStackView(frame: .zero)
        totalCompletionLabelsStack.axis = .horizontal
        totalCompletionLabelsStack.translatesAutoresizingMaskIntoConstraints = false
        totalCompletionLabelsStack.distribution = .fillEqually
        totalCompletionLabelsStack.spacing = 50
        totalCompletionLabelsStack.backgroundColor = .systemPink
        return totalCompletionLabelsStack
    }()
    
    func totalCompletionLabelsStackConstraints() {
        NSLayoutConstraint.activate([
            totalCompletionLabelsStack.topAnchor.constraint(equalTo: labelCurrentStreakLabel.bottomAnchor, constant: 8),
            totalCompletionLabelsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            totalCompletionLabelsStack.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0),
            totalCompletionLabelsStack.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    lazy var labelBestStreak: UILabel = {
        let labelBestStreak = UILabel(frame: .zero)
        labelBestStreak.translatesAutoresizingMaskIntoConstraints = false
        labelBestStreak.backgroundColor = .systemRed
        labelBestStreak.textAlignment = .center
        return labelBestStreak
    }()
    
    lazy var labelBestStreakLabel: UILabel = {
           let labelBestStreak = UILabel(frame: .zero)
           labelBestStreak.translatesAutoresizingMaskIntoConstraints = false
           labelBestStreak.backgroundColor = .systemRed
           labelBestStreak.textAlignment = .center
           return labelBestStreak
       }()
    
    lazy var labelBestStreakStackView: UIStackView = {
        let labelBestStreakStackView = UIStackView(frame: .zero)
        labelBestStreakStackView.axis = .horizontal
        labelBestStreakStackView.translatesAutoresizingMaskIntoConstraints = false
        labelBestStreakStackView.distribution = .fillEqually
        labelBestStreakStackView.spacing = 50
        labelBestStreakStackView.backgroundColor = .systemPink
        return labelBestStreakStackView
    }()
    
    func labelBestStreakStackViewConstraint() {
           NSLayoutConstraint.activate([
               labelBestStreakStackView.topAnchor.constraint(equalTo: totalCompletionLabelsStack.bottomAnchor, constant: 8),
               labelBestStreakStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
               labelBestStreakStackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0),
               labelBestStreakStackView.heightAnchor.constraint(equalToConstant: 70)
           ])
       }
    
    
    
    lazy var labelStartingDate: UILabel = {
        let labelStartingDate = UILabel(frame: .zero)
        labelStartingDate.translatesAutoresizingMaskIntoConstraints = false
        labelStartingDate.backgroundColor = .systemRed
        labelStartingDate.textAlignment = .center
        return labelStartingDate
    }()
    
    lazy var labelStartingDateLabel: UILabel = {
          let labelStartingDate = UILabel(frame: .zero)
          labelStartingDate.translatesAutoresizingMaskIntoConstraints = false
          labelStartingDate.backgroundColor = .systemRed
          labelStartingDate.textAlignment = .center
          return labelStartingDate
      }()
    
    lazy var labelStartingDateStackView: UIStackView = {
        let labelBestStreakStackView = UIStackView(frame: .zero)
        labelBestStreakStackView.axis = .horizontal
        labelBestStreakStackView.translatesAutoresizingMaskIntoConstraints = false
        labelBestStreakStackView.distribution = .fillEqually
        labelBestStreakStackView.spacing = 50
        labelBestStreakStackView.backgroundColor = .systemPink
        return labelBestStreakStackView
    }()
    
    func labelStartingDateStackViewConstraint() {
           NSLayoutConstraint.activate([
               labelStartingDateStackView.topAnchor.constraint(equalTo: labelBestStreakStackView.bottomAnchor, constant: 8),
               labelStartingDateStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
               labelStartingDateStackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0),
               labelStartingDateStackView.heightAnchor.constraint(equalToConstant: 70)
           ])
       }
    
    
    lazy var buttonAction: UIButton = {
        let buttonAction = UIButton(frame: .zero)
        buttonAction.translatesAutoresizingMaskIntoConstraints = false
        buttonAction.backgroundColor = .systemRed
        buttonAction.setTitle("Mark as completed" , for: .normal)
        buttonAction.addTarget(self, action: #selector(pressActionButton), for: .touchUpInside)
        return buttonAction
    }()
    
    @objc func pressActionButton() {
        habit = persistence.markHabitAsCompleted(habitIndex)
        updateUI()
    }
    
    func buttonActionConstraint() {
        NSLayoutConstraint.activate([
            buttonAction.topAnchor.constraint(equalTo: labelStartingDateStackView.bottomAnchor, constant: 10),
            buttonAction.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonAction.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3),
            buttonAction.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    
    private func updateUI() {
        title = habit.title
        imageViewIcon.image = habit.selectedImage.image
        labelCurrentStreak.text = "\(habit.currentStreak) days"
        labelTotalCompletions.text = String(habit.numberOfCompletions)
        labelTotalCompletionsLabel.text = "Total:"
        labelBestStreak.text = String(habit.bestStreak)
        labelBestStreakLabel.text = "Best Streak:"
        labelStartingDate.text = habit.dateCreated.stringValue
        labelStartingDateLabel.text = "Starting Date:"
        if habit.completedToday {
            buttonAction.setTitle("Completed for Today!", for: .normal)
        } else {
            buttonAction.setTitle("Mark as Completed", for: .normal)
        }
    }
    
    
    
    
    
    
    
    
    
    
}
