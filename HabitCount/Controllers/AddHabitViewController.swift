//
//  AddHabitViewController.swift
//  HabitCount
//
//  Created by Mohammed Drame on 3/4/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class AddHabitViewController: UIViewController {
    
    let habitImages = HabitModel.Images.allCases
    
    var selectedIndexPath: IndexPath? {
        didSet {
            var indexPaths: [IndexPath] = []
            if let selectedIndexPath = selectedIndexPath {
                indexPaths.append(selectedIndexPath)
            }
            if let oldValue = oldValue {
                indexPaths.append(oldValue)
            }
            mainCollectionView.performBatchUpdates({
                self.mainCollectionView.reloadItems(at: indexPaths)
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainCollectionView)
        mainCollectionViewConstraints()
        view.addSubview(pickedPhotoButton)
        pickedPhotoButtonConstraints()
        
        title  = "Select Photo"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    
    lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        mainCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.cellIdentifier)
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        mainCollectionView.backgroundColor = #colorLiteral(red: 0.1512203515, green: 0.1612353325, blue: 0.1522695124, alpha: 1)
        return mainCollectionView
    }()
    
    func mainCollectionViewConstraints() {
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        NSLayoutConstraint.activate([
            mainCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    lazy var pickedPhotoButton: UIButton = {
        let pickedPhotoButton = UIButton(frame: .zero)
        pickedPhotoButton.backgroundColor = .systemYellow
        pickedPhotoButton.setTitle("Pick Photo", for: .normal)
        pickedPhotoButton.translatesAutoresizingMaskIntoConstraints =  false
        pickedPhotoButton.addTarget(self, action: #selector(pickButtonPressed), for: .touchUpInside)
        pickedPhotoButton.setTitleColor(#colorLiteral(red: 0.1512203515, green: 0.1612353325, blue: 0.1522695124, alpha: 1), for: .normal)
        pickedPhotoButton.titleLabel?.font = UIFont(name: "Arial", size: 20)
        pickedPhotoButton.clipsToBounds = true
        pickedPhotoButton.layer.cornerRadius = 20
        return pickedPhotoButton
    }()
    
    @objc func pickButtonPressed() {
        guard let selectedIndex = selectedIndexPath else { return }
        let confirmVC = ConfirmHabitViewController()
        confirmVC.selectedImage = habitImages[selectedIndex.row]
        navigationController?.pushViewController(confirmVC, animated: true)
        
    }
    
    
    func pickedPhotoButtonConstraints() {
        NSLayoutConstraint.activate([
            pickedPhotoButton.topAnchor.constraint(equalTo: mainCollectionView.bottomAnchor, constant: 10),
            pickedPhotoButton.leadingAnchor.constraint(equalTo: mainCollectionView.leadingAnchor),
            pickedPhotoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            pickedPhotoButton.trailingAnchor.constraint(equalTo: mainCollectionView.trailingAnchor)
        ])
    }
    
    
}


extension AddHabitViewController {
    
    func setupNavBar() {
        title = "Select Image"
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAddHabit(_:)))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc func cancelAddHabit(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}




extension AddHabitViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return habitImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.cellIdentifier, for: indexPath) as? CustomCollectionViewCell
        if indexPath == selectedIndexPath {
            cell!.setUI(object: habitImages[indexPath.row].image, selection: true)
            cell!.backgroundColor =  #colorLiteral(red: 0.1512203515, green: 0.1612353325, blue: 0.1522695124, alpha: 1)
        }
        else {
            cell!.setUI(object: habitImages[indexPath.row].image, selection: false)
        }
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 4, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if selectedIndexPath == indexPath {
            selectedIndexPath = nil
        } else {
            selectedIndexPath = indexPath
        }
        print("Current Index: \(indexPath.row)")
        return false
    }
    
    
    
    
    
}
