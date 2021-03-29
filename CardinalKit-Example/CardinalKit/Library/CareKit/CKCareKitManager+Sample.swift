//
//  CKCareKitManager+Sample.swift
//  CardinalKit_Example
//
//  Created by Santiago Gutierrez on 12/21/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import CareKit
import CareKitStore
import Contacts
import UIKit

internal extension OCKStore {

    // Adds tasks and contacts into the store
    func populateSampleData() {

        let thisMorning = Calendar.current.startOfDay(for: Date())
        let aFewDaysAgo = Calendar.current.date(byAdding: .day, value: -3, to: thisMorning)!
        let beforeBreakfast = Calendar.current.date(byAdding: .hour, value: 8, to: aFewDaysAgo)!
        let afterLunch = Calendar.current.date(byAdding: .hour, value: 14, to: aFewDaysAgo)!

        let coffeeElement = OCKScheduleElement(start: beforeBreakfast, end: nil, interval: DateComponents(day: 1))
        let coffeeSchedule = OCKSchedule(composing: [coffeeElement])
        var coffee = OCKTask(id: "coffee", title: "Drink Water ☕️", carePlanUUID: nil, schedule: coffeeSchedule)
        coffee.impactsAdherence = true
        
        let surveyElement = OCKScheduleElement(start: thisMorning, end: nil , interval: DateComponents(day: 60))
        let surveySchedule = OCKSchedule(composing: [surveyElement])
        var survey = OCKTask(id: "survey", title: "Background Survey 📝", carePlanUUID: nil, schedule: surveySchedule)
        survey.impactsAdherence = true
        survey.instructions = "Complete a one-time background survey."
        
        let surveyElement2 = OCKScheduleElement(start: thisMorning, end: nil, interval: DateComponents(day: 7))
        let surveySchedule2 = OCKSchedule(composing: [surveyElement2])
        var survey2 = OCKTask(id: "survey2", title: "Symptom Reporting Survey 📝", carePlanUUID: nil, schedule: surveySchedule2)
        survey2.impactsAdherence = true
        survey2.instructions = "Complete your weekly survey to report your overall health and functioning."
        
        
        
        // Doxylamine and Nausea DEMO.
       
        let doxylamineSchedule = OCKSchedule(composing: [
            OCKScheduleElement(start: beforeBreakfast, end: nil,
                               interval: DateComponents(day: 2)),

            OCKScheduleElement(start: afterLunch, end: nil,
                               interval: DateComponents(day: 4))
        ])

        var doxylamine = OCKTask(id: "doxylamine", title: "Take Doxylamine",
                                 carePlanUUID: nil, schedule: doxylamineSchedule)
        doxylamine.instructions = "Take 25mg of doxylamine when you experience nausea."

        let nauseaSchedule = OCKSchedule(composing: [
            OCKScheduleElement(start: beforeBreakfast, end: nil, interval: DateComponents(day: 2),
                               text: "Anytime throughout the day", targetValues: [], duration: .allDay)
            ])

        var nausea = OCKTask(id: "nausea", title: "Track your nausea",
                             carePlanUUID: nil, schedule: nauseaSchedule)
        nausea.impactsAdherence = false
        nausea.instructions = "Tap the button below anytime you experience nausea."
    
 
        addTasks([survey, survey2], callbackQueue: .main, completion: nil)

        createContacts()
    }
    
    func createContacts() {
        var contact1 = OCKContact(id: "ashley", givenName: "Dr. Reid",
                                  familyName: "Griffin", carePlanUUID: nil)
        contact1.asset = "ReidGriffin"
        contact1.title = "Infectious Disease Specialist"
        contact1.role = "Long-term COVID-19 Clinic"
        contact1.emailAddresses = [OCKLabeledValue(label: CNLabelEmailiCloud, value: "ashley@viranosproject.org")]
        contact1.phoneNumbers = [OCKLabeledValue(label: CNLabelWork, value: "(111) 111-1111")]
        contact1.messagingNumbers = [OCKLabeledValue(label: CNLabelWork, value: "(111) 111-1111")]

        contact1.address = {
            let address = OCKPostalAddress()
            address.street = "318 Campus Drive"
            address.city = "Stanford"
            address.state = "CA"
            address.postalCode = "94305"
            return address
        }()

        var contact2 = OCKContact(id: "vishnu", givenName: "Dr. Vishnu",
                                  familyName: "Ravi", carePlanUUID: nil)
        contact2.asset = "VishnuRavi"
        contact2.title = "Primary Care Provider"
        contact2.role = "Internal Medicine Clinic"
        contact2.phoneNumbers = [OCKLabeledValue(label: CNLabelWork, value: "(324) 555-7415")]
        contact2.messagingNumbers = [OCKLabeledValue(label: CNLabelWork, value: "(324) 555-7415")]
        contact2.address = {
            let address = OCKPostalAddress()
            address.street = "318 Campus Drive"
            address.city = "Stanford"
            address.state = "CA"
            address.postalCode = "94305"
            return address
        }()
        
        var contact3 = OCKContact(id: "mohini", givenName: "Dr. Mohini",
                                  familyName: "Adkar", carePlanUUID: nil)
        contact3.asset = "MohiniAdkar"
        contact3.title = "Pulmonologist"
        contact3.role = "Outpatient Pulmonology Clinic"
        contact3.phoneNumbers = [OCKLabeledValue(label: CNLabelWork, value: "(324) 555-7415")]
        contact3.messagingNumbers = [OCKLabeledValue(label: CNLabelWork, value: "(324) 555-7415")]
        contact3.address = {
            let address = OCKPostalAddress()
            address.street = "325 Campus Drive"
            address.city = "Stanford"
            address.state = "CA"
            address.postalCode = "94305"
            return address
        }()

        addContacts([contact2, contact3, contact1])
    }
    
}

