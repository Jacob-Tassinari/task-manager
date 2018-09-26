//
//  task-list.swift
//  task manager
//
//  Created by Jacob Tassinari on 9/20/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import Foundation

class taskList {
    var tasks: [makeTask] = [makeTask(title: "YUm", taskDescription: "Prepare for feast with family"), makeTask(title: "hard work", taskDescription: "tear down the back porch"),makeTask(title: "ramp", taskDescription: "making ramp"),makeTask(title: "DooR", taskDescription: "fix the hole ing the door")]
    func priority() {
        //print it out from level 1 to 2 to 3.
        for tosk in tasks {
            if tosk.priorty == 1 {
                print("Priority 1 \(tosk.title)")
            }
        }
        for tosk in tasks {
            if tosk.priorty == 2 {
                print("Priority 2 \(tosk.title)")
            }
        }
        for tosk in tasks {
            if tosk.priorty == 3{
                print("Priority 3 \(tosk.title)")
            }
        }
    }
    func changePriority(){
        for tosk in 0..<tasks.count{
            print("\(tosk)Id = \(tasks[tosk].title) / \(tasks[tosk].taskDescription). current priority is \(tasks[tosk].priorty)")
        }
        print("please input the number id of the task you want to change the priority level of.")
        var userInput = Int(readLine()!)
        let vaild = Array(0..<tasks.count)
        while userInput == nil || !vaild.contains(userInput!){// input vaildation
            print("please renter the number.")
            userInput = Int(readLine()!)
        }
        //takes the next input as the the new priority level
        print("please input the number id of the task you want to change the priority level of.(ONE, Two, or three)")
        var UserInput = Int(readLine()!)
        let vaIld = Array(1...3)
        while !vaIld.contains(UserInput!) {// input vaildation
            print("please renter the number.")
            UserInput = Int(readLine()!)
        }
        //has to change it to a string to use the switch func
        var UseInput = ""
        if UserInput == 1 {
            UseInput = "one"
        }
        if UserInput == 2 {
            UseInput = "two"
        }
        if UserInput == 3 {
            UseInput = "three"
        }
        switch UseInput {
        case "one":
            if tasks[userInput!].priorty != 1 {
                tasks[userInput!].priorty = 1
                print("priority changed to 1.")
            } else {
                print("It's already priority 1.")
            }
        case "two":
            if tasks[userInput!].priorty != 2 {
                tasks[userInput!].priorty = 2
                print("priority changed to 2.")
            } else {
                print("It's already priority 2.")
            }
        case "three":
            if tasks[userInput!].priorty != 3 {
                tasks[userInput!].priorty = 3
                print("priority changed to 3.")
            } else {
                print("It's already priority 3.")
            }
        default:
            break
        }
    }
    func addTask(){
        //title input
        print("please input a title of the task")
        var UserInput = readLine()
        while UserInput == nil || UserInput == " "{// input vaildation
            print("please renter the title.")
            UserInput = readLine()
        }
        //description input
        print("please input a title of the task")
        var userInput = readLine()
        while userInput == nil || userInput == " "{// input vaildation
            print("please renter the title.")
            userInput = readLine()
        }
        tasks.append(makeTask(title: UserInput!, taskDescription: userInput!))
        print("new task is \(String(describing: tasks.last?.taskDescription)) / titled: \(String(describing: tasks.last?.title))")
    }
    func deletetask(){
        for index in 0..<tasks.count{
            print("\(index)ID = \(tasks[index].title)")
        }
        print("please enter the id of the task you want to delete.")
        var userInput = Int(readLine()!)
        let vaild = Array(0..<tasks.count)
        while userInput == nil || !vaild.contains(userInput!){// input vaildation
            print("please renter the number.")
            userInput = Int(readLine()!)
        }
        tasks.remove(at: userInput!)
    }
    func markasdone(){
        for index in 0..<tasks.count{
            if tasks[index].completed == false{
                print("\(index)ID = \(tasks[index].title)")
            }
        }
        var userInput = Int(readLine()!)
        let vaild = Array(0..<tasks.count)
        while userInput == nil || !vaild.contains(userInput!){// input vaildation
            print("please renter the number.")
            userInput = Int(readLine()!)
        }
        if !tasks[userInput!].completed{
            tasks[userInput!].completed = true
        }else{//vaildation
            print("task title:\(tasks[userInput!].title), is already checked as completed")
        }
    }
    func remarkasnotdone(){
        for index in 0..<tasks.count{
            if tasks[index].completed{
                print("\(index)ID = \(tasks[index].title)")
            }
        }
        var userInput = Int(readLine()!)
        let vaild = Array(0..<tasks.count)
        while userInput == nil || !vaild.contains(userInput!){// input vaildation
            print("please renter the number.")
            userInput = Int(readLine()!)
        }
        if tasks[userInput!].completed{
            tasks[userInput!].completed = false
        }else{//vaildation
            print("task title:\(tasks[userInput!].title), is already checked as uncompleted")
        }
    }
    func dates(){
        for index in 0..<tasks.count{
            print("\(index)ID = \(tasks[index].title)")
        
        }
        print("please input the id of the task you want add an date its need to be completed by")
        var userInput = Int(readLine()!)
        let vaild = Array(0..<tasks.count)
        while userInput == nil || !vaild.contains(userInput!){// input vaildation
            print("please renter the number.")
            userInput = Int(readLine()!)
        }
        //it uses the number inputed next as the number of days it is set as
        print("ok now please enter how many days it needs to be completed to by")
        var UserInput = Int(readLine()!)
        while UserInput == nil || UserInput! <= 0{// input vaildation
            print("please renter the number.")
            UserInput = Int(readLine()!)
        }
        //dates complex system below
        let currentCalender = Calendar.current
        let duedate = currentCalender.date(byAdding: .day, value: UserInput!, to: Date())
        tasks[userInput!].dateOfComplete = duedate
        let dateFormatter = DateFormatter() // to state the date looking better
        dateFormatter.dateFormat = "MM/dd/yyyy"
        print("This task is due to be done on: \(dateFormatter.string(from: duedate!))")
    }
    func printAll(){
        for index in 0..<tasks.count{
            print("\(index)ID = \(tasks[index].title)")
        }
    }
    func printcompleted(){
        for index in 0..<tasks.count{
            if tasks[index].completed{
                print("\(index)ID = \(tasks[index].title)")
            }
        }
    }
    func printuncompleted(){
        for index in 0..<tasks.count{
            if !tasks[index].completed{
                print("\(index)ID = \(tasks[index].title)")
            }
        }
    }
}
//NSUserDefaults
//JSON
