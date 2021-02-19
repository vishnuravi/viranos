//
//  StudyTasks.swift
//
//  Created for the CardinalKit Framework.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import ResearchKit

/**
 This file contains some sample `ResearchKit` tasks
 that you can modify and use throughout your project!
*/
struct TaskSamples {
    
<<<<<<< HEAD:CardinalKit-Example/CardinalKit/Components/Study/StudyTasks.swift
    static let backgroundTask: ORKOrderedTask = {
        var steps = [ORKStep]()
=======
    /**
     Active tasks created with short-hand constructors from `ORKOrderedTask`
    */
    static let sampleTappingTask: ORKOrderedTask = {
        let intendedUseDescription = "Finger tapping is a universal way to communicate."
>>>>>>> upstream/main:CardinalKit-Example/CardinalKit/Components/Tasks/Model/TaskSamples.swift
        
        // Instruction step
        let initialStep = ORKInstructionStep(identifier: "BackgroundTask")
        initialStep.title = "Background Questionnaire"
        initialStep.text = "This information will be used to assess the long term physical and psychosocial outcomes of COVID-19. Please contact your medical provider for worsening symptoms."
        steps += [initialStep]


        let dateAnswerFormat = ORKAnswerFormat.dateAnswerFormat(withDefaultDate: nil, minimumDate: nil, maximumDate: Date(), calendar: nil)
        let q1Step = ORKQuestionStep(identifier: "q1", title: "Question 1", question: "What is your date of birth? ", answer: dateAnswerFormat)
        steps += [q1Step]
        
        
 
        let genderAnswerFormat = ORKTextChoiceAnswerFormat(style: .singleChoice, textChoices: [ORKTextChoice(text: "Male", value: 1 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Female", value: 2 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Other", value: 3 as NSCoding & NSCopying & NSObjectProtocol)])
        let q2Step = ORKQuestionStep(identifier: "q2", title: "Question 2", question: "What is your gender? ", answer: genderAnswerFormat)
        steps += [q2Step]
        
        //SUMMARY
        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Thank you"
        summaryStep.text = "We appreciate your time completing the qustionnaire."
    
        steps += [summaryStep]
     return ORKOrderedTask(identifier: "BackgroundTask", steps: steps)
    
<<<<<<< HEAD:CardinalKit-Example/CardinalKit/Components/Study/StudyTasks.swift
=======
    static let sampleWalkingTask: ORKOrderedTask = {
        let intendedUseDescription = "Tests ability to walk"
>>>>>>> upstream/main:CardinalKit-Example/CardinalKit/Components/Tasks/Model/TaskSamples.swift
        
    }()
    
<<<<<<< HEAD:CardinalKit-Example/CardinalKit/Components/Study/StudyTasks.swift

    static let sf12Task: ORKOrderedTask = {
=======
    /**
        Coffee Task Example for 9/2 Workshop
     */
    static let sampleCoffeeTask: ORKOrderedTask = {
        var steps = [ORKStep]()
        
        // Coffee Step
        let healthScaleAnswerFormat = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 3, step: 1, vertical: false, maximumValueDescription: "A Lot 😬", minimumValueDescription: "None 😴")
        let healthScaleQuestionStep = ORKQuestionStep(identifier: "CoffeeScaleQuestionStep", title: "Coffee Intake", question: "How many cups of coffee do you drink per day?", answer: healthScaleAnswerFormat)
        
        steps += [healthScaleQuestionStep]
        
        //SUMMARY
        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Thank you for tracking your coffee."
        summaryStep.text = "We appreciate your caffeinated energy! check out the results chart."
        
        steps += [summaryStep]
        
        return ORKOrderedTask(identifier: "SurveyTask-Coffee", steps: steps)
        
    }()
    
    /**
     Sample task created step-by-step!
    */
    static let sampleSurveyTask: ORKOrderedTask = {
>>>>>>> upstream/main:CardinalKit-Example/CardinalKit/Components/Tasks/Model/TaskSamples.swift
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
<<<<<<< HEAD:CardinalKit-Example/CardinalKit/Components/Study/StudyTasks.swift

=======
        
        
        let formItem = ORKFormItem(identifier: "FormItem1", text: "MODERATE ACTIVITIES, such as moving a table, pushing a vacuum cleaner, bowling, or playing golf:", answerFormat: textChoiceAnswerFormat)
        let formItem2 = ORKFormItem(identifier: "FormItem2", text: "Climbing SEVERAL flights of stairs:", answerFormat: textChoiceAnswerFormat)
        let formStep = ORKFormStep(identifier: "FormStep", title: "Daily Activities", text: "The following two questions are about activities you might do during a typical day. Does YOUR HEALTH NOW LIMIT YOU in these activities? If so, how much?")
        formStep.formItems = [formItem, formItem2]
        
        steps += [formStep]
        
        let booleanAnswer = ORKBooleanAnswerFormat(yesString: "Yes", noString: "No")
        let booleanQuestionStep = ORKQuestionStep(identifier: "QuestionStep", title: nil, question: "In the past four weeks, did you feel limited in the kind of work that you can accomplish?", answer: booleanAnswer)
        
        steps += [booleanQuestionStep]
        
>>>>>>> upstream/main:CardinalKit-Example/CardinalKit/Components/Tasks/Model/TaskSamples.swift
        //SUMMARY
        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Thank you"
        summaryStep.text = "We appreciate your time."
                
        //steps += [summaryStep]
    return ORKOrderedTask(identifier: "SurveyTask-SF12", steps: steps)
                
       
        
<<<<<<< HEAD:CardinalKit-Example/CardinalKit/Components/Study/StudyTasks.swift
=======
        steps += [summaryStep]
        
        return ORKOrderedTask(identifier: "SurveyTask-Assessment", steps: steps)
>>>>>>> upstream/main:CardinalKit-Example/CardinalKit/Components/Tasks/Model/TaskSamples.swift
    }()
    
   

        }


