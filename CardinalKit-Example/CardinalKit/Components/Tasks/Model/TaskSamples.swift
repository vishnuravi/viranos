//
//  StudyTasks.swift
//
//  Created for the CardinalKit Framework.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import ResearchKit


struct StudyTasks2 {
    
    static let backgroundTask: ORKOrderedTask = {
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
        
        
        // Build Navigation Rules
       // if no for q7, skip to q11
        let task = ORKNavigableOrderedTask(identifier: "BackgroundTask", steps: steps)
        let resultSelector = ORKResultSelector(resultIdentifier:q7Step.identifier)
        let predicate = ORKResultPredicate.predicateForTextQuestionResult(with: resultSelector, expectedString: "2")
        let navigationRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(predicate, q11Step.identifier)])
                
        //task.setNavigationRule(navigationRule, forTriggerStepIdentifier: q7Step.identifier)
        
        
        
        //SUMMARY
        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Thank you"
        summaryStep.text = "We appreciate your time completing the qustionnaire."
       steps += [summaryStep]
        
        
        return ORKOrderedTask(identifier: "BackgroundTask", steps: steps)
    
            as! ORKNavigableOrderedTask     
        
    }()
    

    static let sf12Task: ORKOrderedTask = {
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
    return ORKOrderedTask(identifier: "SurveyTask-SF12", steps: steps)
                
       
    }()
    
}
/**
 This file contains some sample `ResearchKit` tasks
 that you can modify and use throughout your project!
*/
struct TaskSamples {
    
    /**
     Active tasks created with short-hand constructors from `ORKOrderedTask`
    */
    static let sampleTappingTask: ORKOrderedTask = {
        let intendedUseDescription = "Finger tapping is a universal way to communicate."
        
        return ORKOrderedTask.twoFingerTappingIntervalTask(withIdentifier: "TappingTask", intendedUseDescription: intendedUseDescription, duration: 10, handOptions: .both, options: ORKPredefinedTaskOption())
    }()
    
    static let sampleWalkingTask: ORKOrderedTask = {
        let intendedUseDescription = "Tests ability to walk"
        
        return ORKOrderedTask.shortWalk(withIdentifier: "ShortWalkTask", intendedUseDescription: intendedUseDescription, numberOfStepsPerLeg: 20, restDuration: 30, options: ORKPredefinedTaskOption())
    }()
    
    /**
        Coffee Task Example for 9/2 Workshop
     */
    static let coffeeTask: ORKOrderedTask = {
        var steps = [ORKStep]()
        
        // Instruction step
        let instructionStep = ORKInstructionStep(identifier: "IntroStep")
        instructionStep.title = "Patient Questionnaire"
        instructionStep.text = "This information will help your doctors keep track of how you feel and how well you are able to do your usual activities. If you are unsure about how to answer a question, please give the best answer you can and make a written comment beside your answer."
        
        steps += [instructionStep]
        
        // Coffee Step
        let healthScaleAnswerFormat = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 3, step: 1, vertical: false, maximumValueDescription: "A Lot 😬", minimumValueDescription: "None 😴")
        let healthScaleQuestionStep = ORKQuestionStep(identifier: "HealthScaleQuestionStep", title: "Coffee Intake", question: "How many cups of coffee did you have today?", answer: healthScaleAnswerFormat)
        
        steps += [healthScaleQuestionStep]
        
        //SUMMARY
        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Thank you for tracking your coffee."
        summaryStep.text = "We appreciate your time."
        
        steps += [summaryStep]
        
        return ORKOrderedTask(identifier: "SurveyTask-Coffee", steps: steps)
        
    }()
    
    /**
     Sample task created step-by-step!
    */
    static let sampleSurveyTask: ORKOrderedTask = {
        var steps = [ORKStep]()
        
        // Instruction step
        let instructionStep = ORKInstructionStep(identifier: "IntroStep")
        instructionStep.title = "Patient Questionnaire"
        instructionStep.text = "This information will help your doctors keep track of how you feel and how well you are able to do your usual activities. If you are unsure about how to answer a question, please give the best answer you can and make a written comment beside your answer."
        
        steps += [instructionStep]
        
        //In general, would you say your health is:
        let healthScaleAnswerFormat = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 1, defaultValue: 3, step: 1, vertical: false, maximumValueDescription: "Excellent", minimumValueDescription: "Poor")
        let healthScaleQuestionStep = ORKQuestionStep(identifier: "HealthScaleQuestionStep", title: "Question #1", question: "In general, would you say your health is:", answer: healthScaleAnswerFormat)
        
        steps += [healthScaleQuestionStep]
        
        let textChoices = [
            ORKTextChoice(text: "Yes, Limited A lot", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Yes, Limited A Little", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "No, Not Limited At All", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
        ]
        let textChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
        let textStep = ORKQuestionStep(identifier: "TextStep", title: "Daily Activities", question: "MODERATE ACTIVITIES, such as moving a table, pushing a vacuum cleaner, bowling, or playing golf:", answer: textChoiceAnswerFormat)
        
        steps += [textStep]
        
        
        let formItem = ORKFormItem(identifier: "FormItem1", text: "MODERATE ACTIVITIES, such as moving a table, pushing a vacuum cleaner, bowling, or playing golf:", answerFormat: textChoiceAnswerFormat)
        let formItem2 = ORKFormItem(identifier: "FormItem2", text: "Climbing SEVERAL flights of stairs:", answerFormat: textChoiceAnswerFormat)
        let formStep = ORKFormStep(identifier: "FormStep", title: "Daily Activities", text: "The following two questions are about activities you might do during a typical day. Does YOUR HEALTH NOW LIMIT YOU in these activities? If so, how much?")
        formStep.formItems = [formItem, formItem2]
        
        steps += [formStep]
        
        let booleanAnswer = ORKBooleanAnswerFormat(yesString: "Yes", noString: "No")
        let booleanQuestionStep = ORKQuestionStep(identifier: "QuestionStep", title: nil, question: "In the past four weeks, did you feel limited in the kind of work that you can accomplish?", answer: booleanAnswer)
        
        steps += [booleanQuestionStep]
        
        //SUMMARY
        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Thank you."
        summaryStep.text = "We appreciate your time."
        
        steps += [summaryStep]
        
        return ORKOrderedTask(identifier: "SurveyTask-Assessment", steps: steps)
    }()
}
