//
//  task.swift
//  task manager
//
//  Created by Jacob Tassinari on 9/18/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import Foundation
class makeTask {
    let title:String
    let taskDescription:String
    var completed:Bool = false
    var dateOfComplete:Date?
    var priorty: Int = 2
    init(title:String,taskDescription:String) {
        self.taskDescription = taskDescription
        self.title = title
    }
}
