//
//  ViewController.swift
//  HabitCount
//
//  Created by Mohammed Drame on 3/4/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: -> Engine
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.1512203515, green: 0.1612353325, blue: 0.1522695124, alpha: 1)
        view.addSubview(mainTableView)
        mainTableViewConstraints()
        
        setNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.mainTableView.reloadData()
        presistence.setNeededToReloadHabitsData()
    }
    
    // MARK: -> Global Variables
    // Dummy DataBase
    var habitsDataBase = [
        HabitModel(title: "Go to bed before 10pm", image: HabitModel.Images.book),
        HabitModel(title: "Drink 8 Glasses of Water", image: HabitModel.Images.book),
        HabitModel(title: "Commit Today", image: HabitModel.Images.book),
        HabitModel(title: "Stand up every Hour", image: HabitModel.Images.book),HabitModel(title: "Go to bed before 10pm", image: HabitModel.Images.book),
        HabitModel(title: "Drink 8 Glasses of Water", image: HabitModel.Images.book),
        HabitModel(title: "Commit Today", image: HabitModel.Images.book),
        HabitModel(title: "Stand up every Hour", image: HabitModel.Images.book)
    ]
    
    private var presistence = PresistenceObject()
    
    // MARK: -> TableView
    
    lazy var mainTableView : UITableView = {
        let mainTableView = UITableView(frame: .zero)
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.backgroundColor = #colorLiteral(red: 0.1512203515, green: 0.1612353325, blue: 0.1522695124, alpha: 1)
        
        mainTableView.register(CustomeTableViewCell.self, forCellReuseIdentifier: CustomeTableViewCell.cellIdentifier)
        mainTableView.rowHeight = 100
        mainTableView.delegate = self
        mainTableView.dataSource = self
        return mainTableView
    }()
    
    func mainTableViewConstraints() {
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    
    
}


// MARK: -> TableView DataSource & Data Source

extension BaseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presistence.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CustomeTableViewCell.cellIdentifier, for: indexPath) as? CustomeTableViewCell {
            cell.initUI(object: presistence.list[indexPath.row])
            cell.backgroundColor = #colorLiteral(red: 0.1512203515, green: 0.1612353325, blue: 0.1522695124, alpha: 1)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       
        switch editingStyle {
        case .delete:
            let habitToDelete = presistence.list[indexPath.row]
            let habitIndexToDelete = indexPath.row
            // 1. create a alert controller and present
            let deleteAlert = UIAlertController(title: "Delete Habit", message: "Are you sure you want to delete \(habitToDelete.title)", preferredStyle: .alert)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
                self.presistence.deleteHabit(at: habitIndexToDelete)
                tableView.deleteRows(at: [indexPath], with: .automatic)
//                print("Deleted")
            }
            deleteAlert.addAction(deleteAction)
            self.present(deleteAlert, animated: true)
            break
        default:
            print("User Did not delete or insert tableView")
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedHabit = presistence.list[indexPath.row]
        let habitDetailVC = HabitDetailedViewController()
        habitDetailVC.habit = selectedHabit
        habitDetailVC.habitIndex = indexPath.row
        navigationController?.pushViewController(habitDetailVC, animated: true)
        tableView.backgroundColor = #colorLiteral(red: 0.1512203515, green: 0.1612353325, blue: 0.1522695124, alpha: 1)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
      presistence.swapHabits(habitIndex: sourceIndexPath.row, destinationIndex: destinationIndexPath.row)
    }
    

}


extension BaseViewController {
    
    func setNavBar() {
        title = "Habits"
        navigationController?.navigationBar.prefersLargeTitles =  true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "A D D", style: .done, target: self, action: #selector(addNewHabit))
//        navigationItem.leftBarButtonItem = self.editButtonItem
//        navigationItem.leftBarButtonItem?.tintColor = .systemYellow
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1512203515, green: 0.1612353325, blue: 0.1522695124, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    @objc func addNewHabit() {
        //        habitsDataBase.insert(, at: 0)
        //        let index = IndexPath(row: 0, section: 0)
        //        mainTableView.insertRows(at: [index], with: .fade)
//        performSegue(withIdentifier: "createNewHabit", sender: self)
        navigationController?.pushViewController(AddHabitViewController(), animated: true)
    }
    
}

extension Date {
    
    var stringValue: String {
        return DateFormatter.localizedString(from: self, dateStyle: .medium, timeStyle: .none)
    }
    
    var isToday: Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(self)
    }
    
    var isYesterday: Bool {
        let calendar = Calendar.current
        return calendar.isDateInYesterday(self)
    }
}

