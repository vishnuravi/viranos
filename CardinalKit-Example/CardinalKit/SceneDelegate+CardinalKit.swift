//
//  SceneDelegate+CardinalKit.swift
//  CardinalKit_Example
//
//  Created by Santiago Gutierrez on 10/13/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import SwiftUI
import ResearchKit

extension SceneDelegate: ORKPasscodeDelegate {
    
    /**
     Blocks the app from use until a validated passcode is entered.
     
     Uses `present()` to trigger an `ORKPasscodeViewController`
    */
    func CKLockApp() {
        //only lock the app if there is a stored passcode and a passcode controller isn't already being shown.
        guard ORKPasscodeViewController.isPasscodeStoredInKeychain() && !(window?.rootViewController?.presentedViewController is ORKPasscodeViewController) else { return }
        
        window?.makeKeyAndVisible()
        
        //TODO: make text and passcodeType (?) configurable
        let config = CKPropertyReader(file: "CKConfiguration")
        
        let passcodeViewController = ORKPasscodeViewController.passcodeAuthenticationViewController(withText: config.read(query: "Passcode On Return Text"), delegate: self)
        window?.rootViewController?.present(passcodeViewController, animated: false, completion: nil)
    }
    
    func passcodeViewControllerDidFinish(withSuccess viewController: UIViewController) {
        // dismiss passcode prompt screen
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func passcodeViewControllerDidFailAuthentication(_ viewController: UIViewController) {
        // TODO: handle authentication failure
    }
    
}
