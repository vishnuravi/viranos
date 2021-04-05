//
//  ScheduleViewController.swift
//  CardinalKit_Example
//
//  Created by Santiago Gutierrez on 12/21/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import CareKit
import CareKitStore
import UIKit
import SwiftUI

class ScheduleViewController: OCKDailyPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
    }
    
    override func dailyPageViewController(_ dailyPageViewController: OCKDailyPageViewController, prepare listViewController: OCKListViewController, for date: Date) {
        
        let identifiers = ["doxylamine", "nausea", "coffee", "survey", "survey2", "steps", "heartRate"]
        var query = OCKTaskQuery(for: date)
        query.ids = identifiers
        query.excludesTasksWithNoEvents = true
        
        storeManager.store.fetchAnyTasks(query: query, callbackQueue: .main) { result in
            switch result {
            case .failure(let error): print("Error: \(error)")
            case .success(let tasks):
                
                // Add a non-CareKit view into the list
                let tipTitle = "Hi Ashley!"
                let tipText = "Thank you for joining! For many people, symptoms of COVID-19 can last for long after the initial infection. This is called long COVID-19. Get started by telling us about any symptoms you might be experiencing in the surveys below. You can also access resources and connect with others."
                
                // Only show the tip view on the current date
                if Calendar.current.isDate(date, inSameDayAs: Date()) {
                    let tipView = TipView()
                    tipView.headerView.titleLabel.text = tipTitle
                    tipView.headerView.detailLabel.text = tipText
                    tipView.imageView.image = UIImage(named: "covid")
                    listViewController.appendView(tipView, animated: false)
                }
                
                if let surveyTask = tasks.first(where: { $0.id == "survey" }) {
                    let surveyCard = SurveyItemViewController(
                        viewSynchronizer: SurveyItemViewSynchronizer(),
                        task: surveyTask,
                        eventQuery: .init(for: date),
                        storeManager: self.storeManager)
                    
                    listViewController.appendViewController(surveyCard, animated: false)
                }
                
                if let surveyTask2 = tasks.first(where: { $0.id == "survey2" }) {
                    let surveyCard2 = SymptomSurveyItemViewController(
                        viewSynchronizer: SymptomSurveyItemViewSynchronizer(),
                        task: surveyTask2,
                        eventQuery: .init(for: date),
                        storeManager: self.storeManager)
                    
                    listViewController.appendViewController(surveyCard2, animated: false)
                }
            }
        }
    }
}







