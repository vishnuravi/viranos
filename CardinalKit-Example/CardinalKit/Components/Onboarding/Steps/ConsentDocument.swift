//
//  ConsentDocument.swift
//
//  Created for the CardinalKit Framework.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import ResearchKit

class ConsentDocument: ORKConsentDocument {
    // MARK: Properties
    
    
    // TODO: change placeholder consent code to real-world consent example.
    let ipsum = [
        "Devices and Apps: Mobile Health (mHealth) is the method of delivering healthcare through mobile technology. mHealth can include mobile devices and apps (e.g. laptop, tablet, iPhone, Android) and wearable technology (e.g. Fitbit). The use of mobile technologies allows investigators to collect data from the research participant when s/he is not physically present at the doctor’s office. This allows for a dramatic increase in data collection to aid researchers in understanding the illness or disease being studied. A mobile device is a computing device that can easily be carried or moved, such as a smartphone, tablet computer, portable hard drive (e.g., flash drives, USB memory sticks, or similar storage devices). These devices are particularly susceptible to loss or theft. If mobile devices are used for initial collection of subject identifiers, investigators must encrypt subject data files. Investigators should consider using a device that can be wiped remotely in the event of loss or theft.",

        "A mobile app is a software program that can be downloaded to a device. The data the app collects can be stored locally to the device or sent to remote storage locations. Mobile apps can collect data through two different mechanisms: passive and active data collection. In passive data collection, the participant has little awareness of the data collection effort, which requires no explicit actions on the participant's part.  Active  data  collection  involves  explicitly  asking  participants  for  information,  preferences,  and opinions.",

        "Downloading Apps: If you decide to join the study you will need to download the study application on your mobile phone. Then, periodically we will ask you to answer questions and perform some tasks via your mobile phone. These tasks may include answering questions about your health, exercise, medicines, and additional surveys, as well as performing some brief activities while holding your phone. Your study data will include your responses to surveys, in-app tasks, and certain health data collected from your phone’s biometric sensors (heart rate, sleep quality/amount, steps, etc).",

        "Your data, without your name, will be added to the data of other study participants and made available to groups of certified investigators for analysis.",

        "Procedures: What will you be asked to do? Download a mobile app (free) and register an account: You need to have the study app on your phone  in  order  to  participate  in  this  study.  Everyone  who  enrolls  will  first  complete  an  electronic registration  process.  The  registration  process  can  be  done  through  the  study  app  or  the  study  web portal. Registration will include entering your name, email address, and other general information about yourself. As part of this process you will also confirm your agreement to participate in the study. As part of the study, we will ask you to take a monthly survey using your phone as well as complete a monthly task to assess short-term memory. We will send notifications on your  phone  asking  you  to  complete  these  tasks  and  surveys. You  may  choose  to  act  at  your convenience, (either then or later) and you may choose to participate in all or only in some parts of the study. You have the right to refuse to answer particular questions or participate in particular aspects of the study.",

        "General Risks: The use of technology as part of this research project can present risk(s). Generally, it is possible that private data from a mobile device may be intercepted during transmission. [Describe how data is or will be transferred/transmitted. Indicate what level of encryption will be used, if any. Describe to what extent that  any  identifiers  will  be  removed].  Data shared on Viranos will only be shared with qualified clinical investigators following complete removal of information that might be used to identify you including your name, birthdate, and contact information. It  is possible  that  your  data  could  be  accessed  by  others should the participant lose his or her mobile device or lend the device to other people. Some additional risks are related to a loss of confidentiality, especially when using electronic devices to transmit, store, and access data.There is some possibility that others may see your open webpage or smartphone communications. In addition, certain apps or app protections may affect the battery life of the device.  Measures  to  protect  security  in these   instances   are   described   below.",

        "App or Device Security Protections: It is highly recommended that you set up a passcode on your own phone and/or electronic device to help prevent unauthorized access to your device and research data, especially for studies that involve collection of any private health information. It’s also recommended that a remote disable feature be set up on your device in case it’s lost or stolen. This will allow you to remotely disable or remove any apps and/or data.",


        "Limits to Data Protections or Confidentiality: In order to get access to intended or target data, the investigator might happen to get access to or be unable to avoid seeing certain data. While the investigator might have gained access to your location data, or financial, or other personal information on your device, this data will not be recorded or retained. Instead, we will only extract data that has already been stated in previous paragraphs.",

        "Data Transmission and Storage on Electronic Devices: Research data will be sent from the mobile app to the research team via [Describe how data will be transmitted. If the data will be on paper forms, describe how they will be sent to the investigator. If data will be stored electronically on a server, describe which server/where and security methods  to  maintain  privacy].  Please  note  that  we  will  keep  this  information  confidential  by  limiting individual access to the research data and keeping it in a secure location. The research data will be stored.",

        "Risks, Discomforts and Inconveniences Using Mobile Apps: Other people may glimpse the study notifications and/or reminders on your phone and realize you are enrolled in this study. This can make some people feel self-conscious. You can avoid that by putting a passcode on your phone to block unauthorized users from accessing your phone content. Be safe –just as you would not text while driving, do not fulfill study tasks while driving. Wait until you are in a safe place to perform tasks! You may have concerns about data security, privacy, and confidentiality. We take great care to protect your information, however there is a slight risk of loss of confidentiality. This is a low risk because we work  to  protect  your  privacy  by  separating  your  personal  information  (information  that  can directly identify you, such as your name or phone number) from the research data. However, even with removal of this information,it is sometimes possible to re-identify an individual given enough cross-referenced information about him or her. This risk, while very low, should still be contemplated prior to enrolling.Data collected in this study will count against your existing mobile data plan. You may configure the application to only use wi-fi connections to limit the impact this data collection has on your data plan.",

        "Costs: There is no cost to you to participate in this study other than costs related to your mobile data plan, if applicable.",

        "Confidentiality: Your confidentiality will be kept to the degree permitted by the technology being used. No guarantees can be made regarding the interception of data sent via the Internet by any third parties.",

        "Lost of Stolen Mobile Device: To prepare for the event that you may lose your mobile device, you should have created an iCloud account. This will enable you to remotely wipe information from your device should you misplace it.",

       "Information Stored in Medical Record: The information about you gathered from the mobile device or app will not be stored in your medical record history. Your primary care physician and other medical professionals will not be able to view the information you shared and that was collected about you during your participation in this study.",

        "Secondary Use of Data: The mobile application company chosen for this research study may have access to your information and use it in other ways. There is also the chance that depending on the agreement the research team and the mobile application company established, the mobile application company may own some or all of your information."


    ]
    
    // MARK: Initialization
    
    override init() {
        super.init()
        
        let config = CKPropertyReader(file: "CKConfiguration")
        
        let consentTitle = config.read(query: "Consent Title")
        
        title = NSLocalizedString(consentTitle, comment: "")
        
        let sectionTypes: [ORKConsentSectionType] = [
            .overview,
            .dataGathering,
            .privacy,
            .dataUse,
            .timeCommitment,
            .studySurvey,
            .studyTasks,
            .withdrawing
        ]
        
        let keys = ["Overview", "Data Gathering", "Privacy", "Data Use", "Time Commitment", "Study Survey", "Study Tasks", "Withdrawing"]
        
        let consentForm = config.readDict(query: "Consent Form")
        sections = []
        
        for sectionType in keys {
            let section = ORKConsentSection(type: sectionTypes[keys.index(of: sectionType)!])
            
            if let consentSectionText = consentForm[sectionType] {
                let localizedStep = NSLocalizedString(consentSectionText, comment: "")
                let localizedSummary = localizedStep.components(separatedBy: ".")[0] + "."
                
                section.summary = localizedSummary
                section.content = localizedStep
                if sections == nil {
                    sections = [section]
                } else {
                    sections!.append(section)
                }
            }
        }
        
        let signature = ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature")
        addSignature(signature)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ORKConsentSectionType: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .overview:
            return "Overview"
            
        case .dataGathering:
            return "DataGathering"
            
        case .privacy:
            return "Privacy"
            
        case .dataUse:
            return "DataUse"
            
        case .timeCommitment:
            return "TimeCommitment"
            
        case .studySurvey:
            return "StudySurvey"
            
        case .studyTasks:
            return "StudyTasks"
            
        case .withdrawing:
            return "Withdrawing"
            
        case .custom:
            return "Custom"
            
        case .onlyInDocument:
            return "OnlyInDocument"
        }
    }
}
