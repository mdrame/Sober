//
//  CustomeTableViewCell.swift
//  HabitCount
//
//  Created by Mohammed Drame on 3/4/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class CustomeTableViewCell: UITableViewCell {
    static var cellIdentifier = "cell"
    
    // MARK: -> IBOutlets
    
    lazy var displayImage: UIImageView = {
        let diplayImage = UIImageView(frame: .zero)
        diplayImage.translatesAutoresizingMaskIntoConstraints = false
        diplayImage.contentMode = .scaleAspectFit
//        diplayImage.backgroundColor = .yellow
        return diplayImage
    }()
    
    func displayImageConstraints() {
        NSLayoutConstraint.activate([
            displayImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -220),
            displayImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
            displayImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -6),
            displayImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19),
            displayImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            displayImage.widthAnchor.constraint(equalToConstant: 100),
            displayImage.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    
    lazy var streakLabelName: UILabel = {
        let streakLabelName = UILabel(frame: .zero)
        streakLabelName.translatesAutoresizingMaskIntoConstraints = false
                streakLabelName.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 0.4121361302)
        streakLabelName.adjustsFontSizeToFitWidth = true
        streakLabelName.adjustsFontForContentSizeCategory =  true
        streakLabelName.numberOfLines = 0
        streakLabelName.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        streakLabelName.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        streakLabelName.textAlignment = .center
        streakLabelName.clipsToBounds = true
        streakLabelName.layer.cornerRadius = 10
        streakLabelName.layer.borderWidth = 2
        streakLabelName.layer.borderColor =  #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        return streakLabelName
    }()
    
    func streakLabelNameConstraints() {
        NSLayoutConstraint.activate([
            streakLabelName.topAnchor.constraint(equalTo: displayImage.topAnchor),
            streakLabelName.leadingAnchor.constraint(equalTo: displayImage.trailingAnchor, constant: 0),
            streakLabelName.bottomAnchor.constraint(equalTo: displayImage.bottomAnchor),
            streakLabelName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
        ])
    }
    
    
    lazy var streakLabelCount: UILabel = {
        let streakLabelCount = UILabel(frame: .zero)
        streakLabelCount.translatesAutoresizingMaskIntoConstraints = false
        streakLabelCount.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 0.5)
        streakLabelCount.adjustsFontSizeToFitWidth = true
        streakLabelCount.adjustsFontForContentSizeCategory =  true
        streakLabelCount.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        streakLabelCount.textAlignment = .center
        streakLabelCount.textColor = .white
        streakLabelCount.clipsToBounds = true
        streakLabelCount.layer.cornerRadius = 15
        streakLabelCount.layer.borderWidth = 2
        streakLabelCount.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        return streakLabelCount
    }()
    
    func streakLabelCountConstraints() {
        NSLayoutConstraint.activate([
            streakLabelCount.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19),
            streakLabelCount.leadingAnchor.constraint(equalTo: displayImage.trailingAnchor, constant: 200),
            streakLabelCount.bottomAnchor.constraint(equalTo: displayImage.bottomAnchor),
            streakLabelCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 90)
        ])
    }
    
    
    override init(style: UITableViewCell.CellStyle , reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(displayImage)
        displayImageConstraints()
        addSubview(streakLabelName)
        streakLabelNameConstraints()
        addSubview(streakLabelCount)
        streakLabelCountConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func initUI(object: HabitModel) {
        self.displayImage.image = UIImage(named: "\(object.selectedImage)")
        self.streakLabelName.text = object.title
        self.streakLabelCount.text = "Streak: \(object.numberOfCompletions)"
        
        contentView.backgroundColor = #colorLiteral(red: 0.1512203515, green: 0.1612353325, blue: 0.1522695124, alpha: 1)
    }
    
    
    
}



extension CustomeTableViewCell {
    
    
    
    
    
}
