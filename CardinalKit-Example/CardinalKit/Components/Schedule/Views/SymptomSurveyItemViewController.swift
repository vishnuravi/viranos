//
//  SymptomSurveyItemViewController.swift
//  CardinalKit_Example
//
//  Created by Ashley on 3/27/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//


import Foundation
import CareKit
import ResearchKit
import CareKitUI
import CareKitStore

// 1. Subclass a task view controller to customize the control flow and present a ResearchKit survey!
class SymptomSurveyItemViewController: OCKInstructionsTaskViewController, ORKTaskViewControllerDelegate {

    // 2. This method is called when the use taps the button!
    override func taskView(_ taskView: UIView & OCKTaskDisplayable, didCompleteEvent isComplete: Bool, at indexPath: IndexPath, sender: Any?) {

        // 2a. If the task was marked incomplete, fall back on the super class's default behavior or deleting the outcome.
        if !isComplete {
            super.taskView(taskView, didCompleteEvent: isComplete, at: indexPath, sender: sender)
            return
        }
/*
        // 2b. If the user attempted to mark the task complete, display a ResearchKit survey.
        let answerFormat = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 1, defaultValue: 5, step: 1, vertical: false, maximumValueDescription: "A LOT!", minimumValueDescription: "a little")
        let feedbackStep = ORKQuestionStep(identifier: "feedback", title: "Feedback", question: "How are you liking CardinalKit?", answer: answerFormat)
        let surveyTask2 = ORKOrderedTask(identifier: "feedback", steps: [feedbackStep])
        let surveyViewController = ORKTaskViewController(task: surveyTask2, taskRun: nil)
        surveyViewController.delegate = self
 */
        
       // let sf12Task: ORKOrderedTask = {
            var steps = [ORKStep]()
            
            // Instruction step
            let instructionStep = ORKInstructionStep(identifier: "IntroStep")
            instructionStep.title = "COVID-19 Questionnaire"
            instructionStep.text = "This information will be used to assess the long term physical and psychosocial outcomes of COVID-19. Please contact your medical provider for worsening symptoms."
            
            steps += [instructionStep]
            
            //Q1
            //In general, would you say your health is:
            let healthScaleAnswerFormat = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 1, defaultValue: 3, step: 1, vertical: false, maximumValueDescription: "Excellent", minimumValueDescription: "Poor")
            let healthScaleQuestionStep = ORKQuestionStep(identifier: "HealthScaleQuestionStep", title: "Question #1", question: "In general, would you say your health is:", answer: healthScaleAnswerFormat)
            
            steps += [healthScaleQuestionStep]
            
            //Q2
            let healthScaleAnswerFormat2 = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 1, defaultValue: 3, step: 1, vertical: false, maximumValueDescription: "Excellent", minimumValueDescription: "Poor")
            let healthScaleQuestionStep2 = ORKQuestionStep(identifier: "HealthScaleQuestionStep2", title: "Question #2", question: "In general, would you say your quality of life is:", answer: healthScaleAnswerFormat2)
            
            steps += [healthScaleQuestionStep2]
            
            //Q3
            let healthScaleAnswerFormat3 = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 1, defaultValue: 3, step: 1, vertical: false, maximumValueDescription: "Excellent", minimumValueDescription: "Poor")
            let healthScaleQuestionStep3 = ORKQuestionStep(identifier: "HealthScaleQuestionStep3", title: "Question #3", question: "In general, how would you rate your physical health?", answer: healthScaleAnswerFormat3)
                
            steps += [healthScaleQuestionStep3]
            
            //Q4
            let healthScaleAnswerFormat4 = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 1, defaultValue: 3, step: 1, vertical: false, maximumValueDescription: "Excellent", minimumValueDescription: "Poor")
            let healthScaleQuestionStep4 = ORKQuestionStep(identifier: "HealthScaleQuestionStep4", title: "Question #4", question: "In general, how would you rate your mental health, including your mood and ability to think?", answer: healthScaleAnswerFormat4)
                
            steps += [healthScaleQuestionStep4]
            
            //Q5
            let healthScaleAnswerFormat5 = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 1, defaultValue: 3, step: 1, vertical: false, maximumValueDescription: "Excellent", minimumValueDescription: "Poor")
            let healthScaleQuestionStep5 = ORKQuestionStep(identifier: "HealthScaleQuestionStep5", title: "Question #5", question: "In general, how would you rate your satisfaction with your social activities and relationships?", answer: healthScaleAnswerFormat5)
                
            steps += [healthScaleQuestionStep5]
            
            //Q6
            let healthScaleAnswerFormat6 = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 1, defaultValue: 3, step: 1, vertical: false, maximumValueDescription: "Excellent", minimumValueDescription: "Poor")
            let healthScaleQuestionStep6 = ORKQuestionStep(identifier: "HealthScaleQuestionStep6", title: "Question #6", question: "In general, please rate how well you carry out your usual social activities and roles. (This includes activities at home, at work and in your community, and responsibilities as a parent, child, spouse, employee, friend, etc.)", answer: healthScaleAnswerFormat6)
                
            steps += [healthScaleQuestionStep6]
            
            //Q7
            let healthScaleAnswerFormat7 = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 1, defaultValue: 3, step: 1, vertical: false, maximumValueDescription: "Completely", minimumValueDescription: "Not at all")
            let healthScaleQuestionStep7 = ORKQuestionStep(identifier: "HealthScaleQuestionStep7", title: "Question #7", question: "To what extent are you able to carry out your everyday physical activities such as walking, climbing stairs, carrying groceries, or moving a chair?", answer: healthScaleAnswerFormat7)
                
            steps += [healthScaleQuestionStep7]
            
            //Q8
            let healthScaleAnswerFormat8 = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 1, defaultValue: 3, step: 1, vertical: false, maximumValueDescription: "Never", minimumValueDescription: "Always")
            let healthScaleQuestionStep8 = ORKQuestionStep(identifier: "HealthScaleQuestionStep8", title: "Question #8", question: "In the past 7 days, how often have you been bothered by emotional problems such as feeling anxious, depressed or irritable?", answer: healthScaleAnswerFormat8)
                
            steps += [healthScaleQuestionStep8]
            
            //Q9
            let healthScaleAnswerFormat9 = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 1, defaultValue: 3, step: 1, vertical: false, maximumValueDescription: "None", minimumValueDescription: "Very severe")
            let healthScaleQuestionStep9 = ORKQuestionStep(identifier: "HealthScaleQuestionStep9", title: "Question #9", question: "In the past 7 days, how would you rate your fatigue on average?", answer: healthScaleAnswerFormat9)
                      
            steps += [healthScaleQuestionStep9]
            
            //Q10
            let healthScaleAnswerFormat10 = ORKAnswerFormat.scale(withMaximumValue: 10, minimumValue: 1, defaultValue: 5, step: 1, vertical: false, maximumValueDescription: "No pain", minimumValueDescription: "Worst pain imaginable")
            let healthScaleQuestionStep10 = ORKQuestionStep(identifier: "HealthScaleQuestionStep10", title: "Question #10", question: "In the past 7 days, how would you rate your pain on average?", answer: healthScaleAnswerFormat10)
                      
            steps += [healthScaleQuestionStep10]
            
            //Symptoms
            let textAnswerFormat = ORKAnswerFormat.textAnswerFormat()
            let textStep = ORKQuestionStep(identifier: "TextStep", title: "Symptoms", question: "Please list all other symptoms you have experienced in the past month. For example, this might include cough, fever, muscle weakness, diarrhea, loss of taste or smell, skin rash, memory lapses, etc. ", answer: textAnswerFormat)
            
            steps += [textStep]

            //SUMMARY
            let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
            summaryStep.title = "Thank you"
            summaryStep.text = "We appreciate your time."
                    
            //steps += [summaryStep]
        //return ORKOrderedTask(identifier: "survey", steps: steps)
        let surveyTask = ORKOrderedTask(identifier: "survey2", steps: steps)
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
/*
        // 4a. Retrieve the result from the ResearchKit survey
        let survey = taskViewController.result.results!.first(where: { $0.identifier == "survey2" }) as! ORKStepResult
        let feedbackResult = survey.results!.first as! ORKScaleQuestionResult
        let answer = Int(truncating: feedbackResult.scaleAnswer!)

        // 4b. Save the result into CareKit's store
        controller.appendOutcomeValue(value: answer, at: IndexPath(item: 0, section: 0), completion: nil)
 */
    }
 
}

class SymptomSurveyItemViewSynchronizer: OCKInstructionsTaskViewSynchronizer {

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
