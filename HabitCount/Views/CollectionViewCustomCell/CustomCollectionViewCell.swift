//
//  CustomCollectionViewCell.swift
//  HabitCount
//
//  Created by Mohammed Drame on 3/4/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit
import Foundation

class CustomCollectionViewCell: UICollectionViewCell {
    public static var cellIdentifier = "cell"
    
    lazy var habitImage: UIImageView = {
        let habitImage = UIImageView(frame: .zero)
//                habitImage.backgroundColor = .orange
        habitImage.translatesAutoresizingMaskIntoConstraints = false
        habitImage.contentMode = .scaleAspectFit
        return habitImage
    }()
    
    func habitImageConstraints() {
        NSLayoutConstraint.activate([
            habitImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            habitImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            habitImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            habitImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(habitImage)
        habitImageConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    
    
    
    
    func setUI(object image: UIImage, selection withSelection: Bool) {
        if withSelection {
            self.habitImage.image = image.withRenderingMode(.alwaysOriginal) }
        else {
            self.habitImage.image = image.withRenderingMode(.alwaysTemplate)
            self.habitImage.tintColor = UIColor.gray }
        contentView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.9540881849)
        contentView.layer.cornerRadius = 15
    }
    
    
    
    
}
