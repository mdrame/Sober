//
//  OnBoardingViewController.swift
//  HabitCount
//
//  Created by Mohammed Drame on 3/22/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    var numOfScrollPages: Int = 3
    var scrollViewCurrentPage = 0
    var logIn_and_signUp_buttons_tittle = ["LogIn", "Register"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainScrollView)
        mainScrollViewConstrain()
        mainScrollView.addSubview(onBoardingImagesStackView)
        onBoardingImagesStackViewConstraint()
        onBoardingImagesStackView.addArrangedSubview(firstImage)
        view.addSubview(buttonsStackView)
        buttonsStackViewConstraint()
        buttons()
        view.addSubview(pageControl)
        pageControlConstraint()
        mainScrollView.delegate = self
    }
    
    // 1. Create Scrollview and set width to three Views ✅
    
    // 2. Create a UIImageView, add it to a stackView that is in the scrollView. leave space for login and signup button ✅
    
    // 3. create logIn and sigup button at the bottom on scrollView ✅
    
    // 4. Create UIPageController to determain which onboarding the user is on. ✅
    
    lazy var mainScrollView: UIScrollView = {
        let mainScrollView = UIScrollView(frame: .zero)
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.isPagingEnabled = true
        mainScrollView.contentSize.width = self.view.frame.size.width * 3
        //        mainScrollView.backgroundColor = .systemPink
        //        mainScrollView.showsHorizontalScrollIndicator = false
        return mainScrollView
    }()
    
    func mainScrollViewConstrain() {
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    lazy var onBoardingImagesStackView : UIStackView = {
        let onBoardingImagesStackView = UIStackView(frame: .zero)
        onBoardingImagesStackView.axis = .horizontal
        onBoardingImagesStackView.distribution = .fillEqually
        onBoardingImagesStackView.spacing = 20
        onBoardingImagesStackView.translatesAutoresizingMaskIntoConstraints = false
        return onBoardingImagesStackView
    }()
    
    func onBoardingImagesStackViewConstraint() {
        NSLayoutConstraint.activate([
            onBoardingImagesStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            onBoardingImagesStackView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 0),
            onBoardingImagesStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            onBoardingImagesStackView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor, constant: self.view.frame.size.width * 3)
        ])
    }
    
    lazy var firstImage: UIImageView = {
        let firstImage = UIImageView(frame: .zero)
        firstImage.image = #imageLiteral(resourceName: "onboard")
        firstImage.backgroundColor = .blue
        firstImage.contentMode = .scaleToFill
        firstImage.translatesAutoresizingMaskIntoConstraints = false
        return firstImage
    }()
    
    
    func buttons() {
        for i in 0...1 {
            let buttons = UIButton()
            buttons.setTitle("\(logIn_and_signUp_buttons_tittle[i])", for: .normal)
            buttons.setTitleColor(.black, for: .normal)
            buttons.backgroundColor = .systemYellow
            buttons.addTarget(self, action: #selector(loginAndRegisterButtonPress(sender:)), for: .touchUpInside)
            buttons.tag = i
            buttonsStackView.addArrangedSubview(buttons)
        }
    }
    
    @objc func loginAndRegisterButtonPress(sender: UIButton) {
        switch sender.tag {
        case 0:
            // perform seuge to login vc using storyBoard
            print("Seguing to login vc")
                        performSegue(withIdentifier: "login", sender: self)
            break
        case 1:
            print("Seguing to register vc")
                    performSegue(withIdentifier: "register", sender: self)
        default:
            print("Neather button Press")
        }
    }
    
    
    lazy var buttonsStackView : UIStackView = {
        let buttonsStackView = UIStackView(frame: .zero)
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 1
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        return buttonsStackView
    }()
    
    func buttonsStackViewConstraint() {
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: onBoardingImagesStackView.bottomAnchor, constant: 5),
            buttonsStackView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 0),
            buttonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    lazy var pageControl : UIPageControl = {
        let pageControl = UIPageControl(frame: .zero)
        //        pageControl.currentPage = 0
        pageControl.numberOfPages = numOfScrollPages
        pageControl.pageIndicatorTintColor = .systemYellow
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.1512203515, green: 0.1612353325, blue: 0.1522695124, alpha: 1)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        //        pageControl.backgroundColor = .blue
        //        pageControl.addTarget(self, action: #selector(controllerChanged), for: .valueChanged)
        return pageControl
    }()
    
    
    func pageControlConstraint() {
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: buttonsStackView.topAnchor, constant: -10),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.widthAnchor.constraint(equalToConstant: self.view.frame.size.width / 2),
            pageControl.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    
}



extension OnBoardingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset == CGPoint(x: 0, y: 0) {
            /// Returns the current page number to scrollViewCurrentPage property observer
            scrollViewCurrentPage = 0
            pageControl.currentPage = scrollViewCurrentPage
            
        } else if scrollView.contentOffset == CGPoint(x: self.view.frame.size.width, y: 0) {
            scrollViewCurrentPage = 1
            pageControl.currentPage = scrollViewCurrentPage
            
        } else if scrollView.contentOffset == CGPoint(x: self.view.frame.size.width * 2, y: 0) {
            scrollViewCurrentPage = 2
            pageControl.currentPage = scrollViewCurrentPage
            
        }
        
    }
    
    
    
}
