//
//  HealthDataStep.swift
//
//  Created for the CardinalKit Framework.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import HealthKit
import ResearchKit
import CardinalKit

class CKHealthDataStep: ORKInstructionStep {
    
<<<<<<< HEAD
    // TODO: save as configurable element
    var hkTypesToReadInBackground: Set<HKQuantityType> = []

=======
>>>>>>> upstream/main
    override init(identifier: String) {
        super.init(identifier: identifier)
        
        /* **************************************************************
         * customize the instruction text that user sees when
         * requesting health data permissions.
        **************************************************************/
        
        let config = CKConfig.shared
        
        for requestedHKType in config.readArray(query: "HealthKit Data to Read") {
            let id = HKQuantityTypeIdentifier(rawValue: "HKQuantityTypeIdentifier" + requestedHKType)
            let hkType = HKQuantityType.quantityType(forIdentifier: id)
            hkTypesToReadInBackground.insert(hkType!)
        }
        
        title = NSLocalizedString(config.read(query: "Health Permissions Title"), comment: "")
        text = NSLocalizedString(config.read(query: "Health Permissions Text"), comment: "")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

/**
 Wrapper for the `CKHealthDataStep` into a ResearchKit `ORKInstructionStepViewController`.
 
 This class was created to override the `goForward` functionality for when the `CKHealthDataStep`
 is presented in a task view.
*/
class CKHealthDataStepViewController: ORKInstructionStepViewController {
    
    /**
     When this step is being dismissed, get `HealthKit`  authorization in the process.
     
     Relies on a `CKHealthDataStep` instance as `self.step`.
    */
    override func goForward() {
        let manager = CKHealthKitManager.shared
        manager.getHealthAuthorization() { _,_ in
            OperationQueue.main.addOperation {
                super.goForward()
            }
        }
    }
}
