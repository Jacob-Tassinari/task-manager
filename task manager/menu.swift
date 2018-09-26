//
//  menu.swift
//  task manager
//
//  Created by Jacob Tassinari on 9/18/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import Foundation


var shouldQuit = false
var counter = 0
var tasks = taskList()
class menu {
    func printMenuFunc(){
        print("""
            (1)create new tasks.
            (2)list of all tasks (Completed and Uncompleted).
            (3)list of uncompleted tasks.
            (4)list of completed tasks.
            (5)mark a task as complete.
            (6)mark a completed task as incomplete.
            (7)remove a task.
            (8)add date a task needs to be complete by
            (9)exit the program.
            (11)list all tasks and priority
            (12)change priority level
            """)
    }
    func getInput() -> String {
        var userInput = readLine()
        while userInput == nil || userInput == "" || !vaildateInput(userInput!){// input vaildation
            print("Please give a valid input.")
            userInput = readLine()
        }
        return userInput!
    }
    func vaildateInput(_ Input:String) -> Bool {// input vaildation for the menu
        let arrayCase = Array(0...12)// the amount of chocies
        guard let number  = Int(Input) else {
            return false
        }
        return arrayCase.contains(number)
        
    }
    func  handleinput(_ input: String) { // to get to the functions
        switch input {
        case "1":
            print("add task(1)")
            tasks.addTask()
        case "2":
            print("list of all tasks(2)")
            tasks.printAll()
        case "3":
            print("list of uncompleted tasks(3)")
            tasks.printuncompleted()
        case "4":
            print("list of completed tasks(4)")
            tasks.printcompleted()
        case "5":
            print("mark a task as completed(5)")
            tasks.markasdone()
        case "6":
            print("mark a task as uncompleted(6)")
            tasks.remarkasnotdone()
        case "7":
            print("remove a task(7)")
            tasks.deletetask()
        case "8":
            print("add date a task needs to be complete by (8)")
            tasks.dates()
        case "9":
            print("quit program(9)")
            quit()
        case "10":
            print("boop")
            counter += 1
            if counter % 10 == 0 {
                print(".---- -----     - .. -- . ...     .---- -----     - .... .. -. --. ...     .---- -----     .-- .- -.-- ...     - ---     - ---     ..-. .- .-.. .-..     .---- -----     - .... .. -. --. ...     - ---     .-. .. ... .     .---- -----     - .... .. -. --. ...     - ---     -... .-. .. -. --.     .-- .. - ....     ..- ... .---- -----     - -.-- .--. . ...     .---- -----     .-- .-. .. - . .-. ...     .---- -----     ... - --- .-. .. . ...     .---- -----     .--- --- ..- .-. -. . -.-- ...     .---- -----     --.- ..- . ... - ...     - ---     .-. ..- .. -.     . ...- . .-. -.-- - .... .. -. --.")
            }
            if counter == 100 {
                print("""
                    10 times 10 things 10 ways to to fall 10 things to rise 10 things to bring with us,
                    10 types 10 writers 10 stories 10 journeys 10 quests to ruin everything
                    """)
                print("bye thanks for stopping")
                quit()
            }
        case "0":
            for secs in stride(from: 15, to: 1, by: -1) {
                print("Beep")
                sleep(UInt32(secs))
            }
            print("hisss...")
            sleep(3)
            print("ka--- boom")
            print("...")
            quit()
        case "11":
            print("(11)list all tasks and priority")
            tasks.priority()
        case"12":
            print("(12)change priority level")
            tasks.changePriority()
        default:
            break
        }
    }
    func goop(){
        while !shouldQuit{
            printMenuFunc()
            handleinput(getInput())
        }
    }
    func quit(){
        shouldQuit = true
        print("logging out")
    }
}

