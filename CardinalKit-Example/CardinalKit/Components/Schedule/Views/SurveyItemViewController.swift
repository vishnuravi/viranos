//
//  SurveyItemViewController.swift
//  CardinalKit_Example
//
//  Created by Santiago Gutierrez on 12/23/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import CareKit
import ResearchKit
import CareKitUI
import CareKitStore

// 1. Subclass a task view controller to customize the control flow and present a ResearchKit survey!

class SurveyItemViewController: OCKInstructionsTaskViewController, ORKTaskViewControllerDelegate {

    // 2. This method is called when the use taps the button!
    override func taskView(_ taskView: UIView & OCKTaskDisplayable, didCompleteEvent isComplete: Bool, at indexPath: IndexPath, sender: Any?) {

        // 2a. If the task was marked incomplete, fall back on the super class's default behavior or deleting the outcome.
        if !isComplete {
            super.taskView(taskView, didCompleteEvent: isComplete, at: indexPath, sender: sender)
            return
        }

        // 2b. If the user attempted to mark the task complete, display a ResearchKit survey.
        /*
        let answerFormat = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 1, defaultValue: 5, step: 1, vertical: false, maximumValueDescription: "A LOT!", minimumValueDescription: "a little")
        let feedbackStep = ORKQuestionStep(identifier: "feedback", title: "Feedback", question: "How are you liking CardinalKit?", answer: answerFormat)
        let surveyTask = ORKOrderedTask(identifier: "feedback", steps: [feedbackStep])
        let surveyViewController = ORKTaskViewController(task: surveyTask, taskRun: nil)
        surveyViewController.delegate = self
        */
        
        var steps = [ORKStep]()
        
        
        // Instruction step
        let initialStep = ORKInstructionStep(identifier: "BackgroundTask")
        initialStep.title = "Background Questionnaire"
        initialStep.text = "This brief background questionnaire will ask you to report your demographic and clinical characteristics."
        steps += [initialStep]


        let dateAnswerFormat = ORKAnswerFormat.dateAnswerFormat(withDefaultDate: nil, minimumDate: nil, maximumDate: Date(), calendar: nil)
        let q1Step = ORKQuestionStep(identifier: "q1", title: "Question 1", question: "What is your date of birth? ", answer: dateAnswerFormat)
        steps += [q1Step]
        
        
 
        let genderAnswerFormat = ORKTextChoiceAnswerFormat(style: .singleChoice, textChoices: [ORKTextChoice(text: "Male", value: 1 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Female", value: 2 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Other", value: 3 as NSCoding & NSCopying & NSObjectProtocol)])
        let q2Step = ORKQuestionStep(identifier: "q2", title: "Question 2", question: "What is your gender? ", answer: genderAnswerFormat)
        steps += [q2Step]
        
        
        let raceAnswerFormat = ORKTextChoiceAnswerFormat(style: .multipleChoice, textChoices: [ORKTextChoice(text: "Asian or Asian American", value: 1 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "American Indian or Alaska Native", value: 2 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Black or African American", value: 3 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "White or Caucasian", value: 4 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Other", value: 5 as NSCoding & NSCopying & NSObjectProtocol)])
        let q3Step = ORKQuestionStep(identifier: "q3", title: "Question 3", question: "What race do you consider yourself to be? One or more categories may be selected.", answer: raceAnswerFormat)
        steps += [q3Step]
        
        
        let ethnicityAnswerFormat = ORKTextChoiceAnswerFormat(style: .singleChoice, textChoices: [ORKTextChoice(text: "Yes", value: 1 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "No", value: 2 as NSCoding & NSCopying & NSObjectProtocol)])
        let q4Step = ORKQuestionStep(identifier: "q4", title: "Question 4", question: "Do you consider yourself Hispanic or Latino/Latina?", answer: ethnicityAnswerFormat)
        steps += [q4Step]
        
        let educationAnswerFormat = ORKTextChoiceAnswerFormat(style: .singleChoice, textChoices: [ORKTextChoice(text: "High school, GED, or less", value: 1 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Some college", value: 2 as NSCoding & NSCopying & NSObjectProtocol),  ORKTextChoice(text: "College graduate or more", value: 3 as NSCoding & NSCopying & NSObjectProtocol)])
        let q5Step = ORKQuestionStep(identifier: "q5", title: "Question 5", question: "What is your highest level of education completed?", answer: educationAnswerFormat)
        steps += [q5Step]
        
        let conditionsAnswerFormat = ORKTextChoiceAnswerFormat(style: .multipleChoice, textChoices: [ORKTextChoice(text: "Asthma", value: 1 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Cancer", value: 2 as NSCoding & NSCopying & NSObjectProtocol),  ORKTextChoice(text: "Chronic obstructive pulmonary disease", value: 3 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Diabetes", value: 4 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Dementia", value: 5 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Heart disease", value: 6 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "High blood pressure", value: 7 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "High cholesterol", value: 8 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Other", value: 9 as NSCoding & NSCopying & NSObjectProtocol)])
        let q6Step = ORKQuestionStep(identifier: "q6", title: "Question 6", question: "Has a doctor or health professional ever told you that you have one or more of the following conditions? One or more categories may be selected.", answer: conditionsAnswerFormat)
        steps += [q6Step]
        
        
        
        
        let coviddxAnswerFormat = ORKTextChoiceAnswerFormat(style: .singleChoice, textChoices: [ORKTextChoice(text: "Yes", value: "1" as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "No", value: "2" as NSCoding & NSCopying & NSObjectProtocol)])
        let q7Step = ORKQuestionStep(identifier: "q7", title: "Question 7", question: "Have you ever tested positive for COVID-19?", answer: coviddxAnswerFormat)
        steps += [q7Step]
        
        let coviddateAnswerFormat = ORKAnswerFormat.dateAnswerFormat(withDefaultDate: nil, minimumDate: nil, maximumDate: Date(), calendar: nil)
        let q8Step = ORKQuestionStep(identifier: "q8", title: "Question 8", question: "What date did you receive a positive test? ", answer: coviddateAnswerFormat)
       steps += [q8Step]
        
        
        let covidtxAnswerFormat = ORKAnswerFormat.textAnswerFormat()
        let q9Step = ORKQuestionStep(identifier: "q9", title: "Question 9", question: "Please describe what treatments, if any, you received after testing positive for COVID-19.",
            answer: covidtxAnswerFormat)
       steps += [q9Step]
        
        
        let covidhospitalAnswerFormat = ORKTextChoiceAnswerFormat(style: .singleChoice, textChoices: [ORKTextChoice(text: "Yes", value: 1 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "No", value: 2 as NSCoding & NSCopying & NSObjectProtocol)])
        let q10Step = ORKQuestionStep(identifier: "q10", title: "Question 10", question: "Were you hospitalized after being diagnosed with COVID-19?", answer: covidhospitalAnswerFormat)
       steps += [q10Step]
        
        let covidvaccineAnswerFormat = ORKTextChoiceAnswerFormat(style: .singleChoice, textChoices: [ORKTextChoice(text: "Yes", value: 1 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "No", value: 2 as NSCoding & NSCopying & NSObjectProtocol)])
        let q11Step = ORKQuestionStep(identifier: "q11", title: "Question 11", question: "Have you received one or more doses of the COVID-19 vaccine?", answer: covidvaccineAnswerFormat)
       steps += [q11Step]
        
        let covidvaccinedateAnswerFormat = ORKAnswerFormat.dateAnswerFormat(withDefaultDate: nil, minimumDate: nil, maximumDate: Date(), calendar: nil)
        let q12Step = ORKQuestionStep(identifier: "q12", title: "Question 12", question: "What date did you receive the first (or only) dose of the COVID-19 vaccine?", answer: covidvaccinedateAnswerFormat)
        steps += [q12Step]
        
        /*
        // Build Navigation Rules
       // if no for q7, skip to q11
        let task = ORKNavigableOrderedTask(identifier: "BackgroundTask", steps: steps)
        let resultSelector = ORKResultSelector(resultIdentifier:q7Step.identifier)
        let predicate = ORKResultPredicate.predicateForTextQuestionResult(with: resultSelector, expectedString: "2")
        let navigationRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(predicate, q11Step.identifier)])
                
        //task.setNavigationRule(navigationRule, forTriggerStepIdentifier: q7Step.identifier)
        
        */
        
        //SUMMARY
        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Thank you"
        summaryStep.text = "We appreciate your time completing the qustionnaire."
       steps += [summaryStep]
        
        
       // return ORKOrderedTask(identifier: "BackgroundTask", steps: steps)
    
           // as! ORKNavigableOrderedTask
      


        
       
                    
            //steps += [summaryStep]
        //return ORKOrderedTask(identifier: "survey", steps: steps)
        let surveyTask = ORKOrderedTask(identifier: "survey", steps: steps)
        let surveyViewController = ORKTaskViewController(task: surveyTask, taskRun: nil)
        surveyViewController.delegate = self

          

        // 3a. Present the survey to the user
        present(surveyViewController, animated: true, completion: nil)
    }

    // 3b. This method will be called when the user completes the survey.
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        taskViewController.dismiss(animated: true, completion: nil)
        guard reason == .completed else {
            taskView.completionButton.isSelected = false
            return
        }

        // 4a. Retrieve the result from the ResearchKit survey
        /*
        let survey = taskViewController.result.results!.first(where: { $0.identifier == "survey" }) as! ORKStepResult
        let feedbackResult = survey.results!.first as! ORKScaleQuestionResult
        let answer = Int(truncating: feedbackResult.scaleAnswer!)

        // 4b. Save the result into CareKit's store
        controller.appendOutcomeValue(value: answer, at: IndexPath(item: 0, section: 0), completion: nil)
 */
    }
}
 

class SurveyItemViewSynchronizer: OCKInstructionsTaskViewSynchronizer {

    // Customize the initial state of the view
    override func makeView() -> OCKInstructionsTaskView {
        let instructionsView = super.makeView()
        instructionsView.completionButton.label.text = "Start"
        return instructionsView
    }
    
    
    override func updateView(_ view: OCKInstructionsTaskView, context: OCKSynchronizationContext<OCKTaskEvents>) {
        super.updateView(view, context: context)

        // Check if an answer exists or not and set the detail label accordingly
        let element: [OCKAnyEvent]? = context.viewModel.first
        let firstEvent = element?.first
        
        if (firstEvent?.outcome?.values.first?.integerValue) != nil {
            view.headerView.detailLabel.text = "Survey completed!"
        } else {
            view.headerView.detailLabel.text = " "
        }
    }
    }
    
