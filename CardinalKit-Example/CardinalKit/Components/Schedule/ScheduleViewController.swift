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
                let tipText = "Below are your upcoming surveys. You can also access resources for clinical trials and connect with others."

               
                
                // Only show the tip view on the current date
                if Calendar.current.isDate(date, inSameDayAs: Date()) {
                    let tipView = TipView()
                    tipView.headerView.titleLabel.text = tipTitle
                    tipView.headerView.detailLabel.text = tipText
                    tipView.imageView.image = UIImage(named: "GraphicOperatingSystem")
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
                
                let resources = TipView()
                var body: some View {
                    VStack {
                        Text("Resources").font(.system(size: 25, weight:.bold)).padding(5)
                        Text("Frequently Updated")
                            .font(.caption)
                            .padding(.top, 5)
                        ScrollView {
                            VStack {
                                CardView(title: "Points", headline: "Incentives", description: "Redeem participation points for rewards like gift cards, badges and more.", button: "View My Rewards", modal: "memes")
                                CardView(title: "Clinical Studies", headline: "Research", description: "Learn about clinical studies for patients having long term symptoms of COVID-19", button: "View Studies", modal: "studies")
                                CardView(title: "Community", headline: "Connect", description: "Connect with other people experiencing long term COVID-19 symptoms", button: "Open Chat", modal: "threads")
                            }
                        }
                    }
                }
                resources.headerView.titleLabel.text = "Resources"
                resources.headerView.detailLabel.text = "Add in cards for clinical studies, community, and points..."
                //tipView2.imageView.image = UIImage(named: "GraphicOperatingSystem")
                listViewController.appendView(resources, animated: false)
                
    
                    
                }
            /*
                // Create a card for the water task if there are events for it on this day.
                if let doxylamineTask = tasks.first(where: { $0.id == "doxylamine" }) {

                    let doxylamineCard = OCKChecklistTaskViewController(
                        task: doxylamineTask,
                        eventQuery: .init(for: date),
                        storeManager: self.storeManager)

                    listViewController.appendViewController(doxylamineCard, animated: false)
                }

                
                // Create a card for the nausea task if there are events for it on this day.
                // Its OCKSchedule was defined to have daily events, so this task should be
                // found in `tasks` every day after the task start date.
                if let nauseaTask = tasks.first(where: { $0.id == "nausea" }) {

                    // dynamic gradient colors
                    let nauseaGradientStart = UIColor { traitCollection -> UIColor in
                        return traitCollection.userInterfaceStyle == .light ? #colorLiteral(red: 0.9960784314, green: 0.3725490196, blue: 0.368627451, alpha: 1) : #colorLiteral(red: 0.8627432641, green: 0.2630574384, blue: 0.2592858295, alpha: 1)
                    }
                    let nauseaGradientEnd = UIColor { traitCollection -> UIColor in
                        return traitCollection.userInterfaceStyle == .light ? #colorLiteral(red: 0.9960784314, green: 0.4732026144, blue: 0.368627451, alpha: 1) : #colorLiteral(red: 0.8627432641, green: 0.3598620686, blue: 0.2592858295, alpha: 1)
                    }

                    // Create a plot comparing nausea to medication adherence.
                    let nauseaDataSeries = OCKDataSeriesConfiguration(
                        taskID: "nausea",
                        legendTitle: "Nausea",
                        gradientStartColor: nauseaGradientStart,
                        gradientEndColor: nauseaGradientEnd,
                        markerSize: 10,
                        eventAggregator: OCKEventAggregator.countOutcomeValues)

                    let doxylamineDataSeries = OCKDataSeriesConfiguration(
                        taskID: "doxylamine",
                        legendTitle: "Doxylamine",
                        gradientStartColor: .systemGray2,
                        gradientEndColor: .systemGray,
                        markerSize: 10,
                        eventAggregator: OCKEventAggregator.countOutcomeValues)

                    let insightsCard = OCKCartesianChartViewController(
                        plotType: .bar,
                        selectedDate: date,
                        configurations: [nauseaDataSeries, doxylamineDataSeries],
                        storeManager: self.storeManager)

                    insightsCard.chartView.headerView.titleLabel.text = "Nausea & Doxylamine Intake"
                    insightsCard.chartView.headerView.detailLabel.text = "This Week"
                    insightsCard.chartView.headerView.accessibilityLabel = "Nausea & Doxylamine Intake, This Week"
                    listViewController.appendViewController(insightsCard, animated: false)

                    // Also create a card that displays a single event.
                    // The event query passed into the initializer specifies that only
                    // today's log entries should be displayed by this log task view controller.
                    let nauseaCard = OCKButtonLogTaskViewController(task: nauseaTask, eventQuery: .init(for: date),
                                                                    storeManager: self.storeManager)
                    listViewController.appendViewController(nauseaCard, animated: false)
                }
 */
            }
        }
    }
    






