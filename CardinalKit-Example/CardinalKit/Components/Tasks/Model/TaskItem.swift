//
//  StudyTableItem.swift
//
//  Created for the CardinalKit Framework.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import Foundation
import UIKit
import ResearchKit
import SwiftUI

enum TaskItem: Int {

    /*
     * STEP (1) APPEND TABLE ITEMS HERE,
     * Give each item a recognizable name!
     */
    case //sampleResearchKitSurvey,
         //sampleResearchKitActiveTask,
         //sampleCoreMotionAppleWatch,
         // sampleFunCoffeeSurvey,
         resources,
         backgroundSurvey,
         survey
    
    /*
     * STEP (2) for each item, what should its
     * title on the list be?
     */
    var title: String {
        switch self {
        case .backgroundSurvey:
            return "Background Questionnaire"
        case .survey:
            return "Symptom Questionnaire"
        //case .sampleCoreMotionAppleWatch:
           // return "Sensors Demo"
//        case .sampleFunCoffeeSurvey:
//            return "Coffee Survey"
        case .resources:
            return "Patient Resources"
        }
    }
    
    /*
     * STEP (3) do you need a subtitle?
     */
    var subtitle: String {
        switch self {
        case .backgroundSurvey:
            return "One-time demographic questionnaire"
        case .survey:
            return "Weekly symptom reporting"
       // case .sampleCoreMotionAppleWatch:
         //   return "CoreMotion & Cloud Storage"
//        case .sampleFunCoffeeSurvey:
//            return "How do you like your coffee?"
        case .resources:
            return "Support for patients"
        }
    }
    
    /*
     * STEP (4) what image would you like to associate
     * with this item under the list view?
     * Check the Assets directory.
     */
    var image: UIImage? {
        switch self {
        case .backgroundSurvey:
            return getImage(named: "ActivityIcon")
//        case .sampleFunCoffeeSurvey:
//            return getImage(named: "CoffeeIcon")
       // case .sampleCoreMotionAppleWatch:
         //   return getImage(named: "WatchIcon")
        case .resources:
            return getImage(named: "CKLogoIcon")
        default:
            return getImage(named: "SurveyIcon")
        }
    }
    
    /*
     * STEP (5) what section should each item be under?
     */
    var section: String {
        switch self {
        case .backgroundSurvey, .survey:
            return "Current Tasks"
//        case .sampleFunCoffeeSurvey:
//            return "Your Interests"
        case .resources:
            return "Learn"
        }
    }

    /*
     * STEP (6) when each element is tapped, what should happen?
     * define a SwiftUI View & return as AnyView.
     */
    var action: some View {
        switch self {
        case .backgroundSurvey:
            return AnyView(CKTaskViewController(tasks: StudyTasks.backgroundTask))
        case .survey:
            return AnyView(CKTaskViewController(tasks: StudyTasks.sf12Task))
        //case .sampleCoreMotionAppleWatch:
          //  return AnyView(SensorsDemoUIView())
//        case .sampleFunCoffeeSurvey:
//            return AnyView(CKTaskViewController(tasks: TaskSamples.sampleCoffeeTask))
        case .resources:
            return AnyView(ResourcesView())
        }
    }
    
    /*
     * HELPERS
     */
    
    fileprivate func getImage(named: String) -> UIImage? {
        UIImage(named: named) ?? UIImage(systemName: "questionmark.square")
    }
    
    static var allValues: [TaskItem] {
        var index = 0
        return Array (
            AnyIterator {
                let returnedElement = self.init(rawValue: index)
                index = index + 1
                return returnedElement
            }
        )
    }
    
}
