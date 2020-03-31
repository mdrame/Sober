//
//  PresistenceObject.swift
//  HabitCount
//
//  Created by Mohammed Drame on 3/4/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import Foundation


struct PresistenceObject {
    
    // Step 1 TemporaryPresistent Array
    private(set) public var list: [HabitModel] = []
    // Step 2 Presistent Key
    private static let userDegaultHabitModelKeyValue = "HABITS_COUNT"
    // Step 3 Init ReadMethod for struct
    init() {
        self.readHabits()
    }
    // CRUD Below
    @discardableResult
    mutating func createNewHabit(habitTitle title: String, selectedImage imageSelected: HabitModel.Images)->HabitModel {
        let newHabit = HabitModel(title: title, image: imageSelected)
        self.list.insert(newHabit, at: 0)
        self.saveHabits()
        return newHabit
    }
    
    func saveHabits() {
        guard let habitsData = try? JSONEncoder().encode(self.list) else { return }
        
        let userDefault = UserDefaults.standard
        userDefault.set(habitsData, forKey:  PresistenceObject.userDegaultHabitModelKeyValue)
        userDefault.synchronize()
    }
    
    private mutating func readHabits() {
        let userDefuailt = UserDefaults.standard
        guard let habitsData = userDefuailt.data(forKey: PresistenceObject.userDegaultHabitModelKeyValue),
            let habitsdata = try? JSONDecoder().decode([HabitModel].self, from: habitsData) else {
                print("Error Occured: Check userDefaultModelKey")
                return
        }
        
        self.list = habitsdata
    }
    
    func updateHabit() {
        
    }
    
    mutating func deleteHabit(at habitIndex: Int) {
        self.list.remove(at: habitIndex)
        self.saveHabits()
    }
    
    mutating func markHabitAsCompleted(_ habitIndex: Int) -> HabitModel {
        
        // Step 12
        var updatedHabit = self.list[habitIndex]
        
        // Step 13
        guard updatedHabit.completedToday == false else { return updatedHabit }
        
        updatedHabit.numberOfCompletions += 1
        
        // Step 14
        if let lastCompletionDate = updatedHabit.lastCompletionDate, lastCompletionDate.isYesterday {
            updatedHabit.currentStreak += 1
        } else {
            updatedHabit.currentStreak = 1
        }
        
        // Step 15
        if updatedHabit.currentStreak > updatedHabit.bestStreak {
            updatedHabit.bestStreak = updatedHabit.currentStreak
        }
        
        // Step 16
        let now = Date()
        updatedHabit.lastCompletionDate = now
        
        // Step 17
        self.list[habitIndex] = updatedHabit
        
        // Step 18
        self.saveHabits()
        return updatedHabit
    }
    
    
    mutating func setNeededToReloadHabitsData() {
        self.readHabits()
    }
    
    mutating func swapHabits(habitIndex: Int, destinationIndex: Int) {
        let habitToSwap = self.list[habitIndex]
        self.list.remove(at: habitIndex)
        self.list.insert(habitToSwap, at: destinationIndex)
        self.saveHabits()
    }
    
    
}
