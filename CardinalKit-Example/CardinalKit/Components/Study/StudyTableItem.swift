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
    case survey, survey2

    var task: ORKOrderedTask {
        switch self {
        case .survey:
            return StudyTasks.backgroundTask
        case .survey2:
            return StudyTasks.sf12Task
            
        }
    }

    var title: String {
        switch self {
        case .survey:
            return "Background Questionnaire"
        case .survey2:
            return "Symptom Questionnaire"
        }
    }

    var subtitle: String {
        switch self {
        case .survey:
            return "One-time demographic questionnaire"
        case .survey2:
            return "Weekly symptom reporting"
        }
    }

    var image: UIImage? {
        switch self {
        case .survey:
            return UIImage(named: "ActivityIcon")
        default:
            return UIImage(named: "SurveyIcon")
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
