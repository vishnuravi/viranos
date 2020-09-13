//
//  StudyTableItem.swift
//
//  Created for the CardinalKit Framework.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import Foundation
import UIKit
import ResearchKit

enum StudyTableItem: Int {
    
    static var allValues: [StudyTableItem] {
        var index = 0
        return Array (
            AnyIterator {
                let returnedElement = self.init(rawValue: index)
                index = index + 1
                return returnedElement
            }
        )
    }

    // table items
    case survey, survey2, activeTask

    var task: ORKOrderedTask {
        switch self {
        case .survey:
            return StudyTasks.backgroundTask
        case .survey2:
            return StudyTasks.sf12Task
        case .activeTask:
            return StudyTasks.memoryTask
        }
        
    }

    var title: String {
        switch self {
        case .survey:
            return "Background Questionnaire"
        case .survey2:
            return "COVID-19 Questionnaire"
        case .activeTask:
            return "Memory Task"
        }
    }

    var subtitle: String {
        switch self {
        case .survey:
                return "Answer a few questions about yourself (one time only)"
        case .survey2:
            return "Report your symptoms and functioning"
        case .activeTask:
            return "Complete a brief task to assess your spatial memory"
        }
    }

    var image: UIImage? {
        switch self {
        case .survey:
            return UIImage(named: "virus")
        case .survey2:
            return UIImage(systemName: "square.and.pencil")
        default:
            return UIImage(systemName: "memories")
        }
    }
    
//    case coffee
//
//    var task: ORKOrderedTask {
//        switch self {
//        case .coffee:
//            return StudyTasks.coffeeTask
//        }
//    }
//
//    var title: String {
//        switch self {
//        case .coffee:
//            return "Coffee Task"
//        }
//    }
//
//    var subtitle: String {
//        switch self {
//        case .coffee:
//            return "Record your coffee intake for the day."
//        }
//    }
//
//    var image: UIImage? {
//        switch self {
//        case .coffee:
//            return UIImage(named: "CoffeeIcon")
//        }
//    }
}
