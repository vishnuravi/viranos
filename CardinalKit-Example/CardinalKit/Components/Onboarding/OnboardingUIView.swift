//
//  OnboardingUIView.swift
//  CardinalKit_Example
//
//  Created by Varun Shenoy on 8/14/20.
//  Copyright © 2020 Stanford University. All rights reserved.
//

import SwiftUI
import UIKit
import ResearchKit
import CardinalKit
import Firebase

struct OnboardingElement {
    let logo: String
    let title: String
    let description: String
}

struct OnboardingUIView: View {
    
    var onboardingElements: [OnboardingElement] = []
    let color: Color
    let config = CKPropertyReader(file: "CKConfiguration")
    @State var showingDetail = false
    
    var onComplete: (() -> Void)? = nil
    
    init(onComplete: (() -> Void)? = nil) {
        let onboardingData = config.readAny(query: "Onboarding") as! [[String:String]]
        
        self.color = Color(config.readColor(query: "Primary Color"))
        self.onComplete = onComplete
        
        for data in onboardingData {
            self.onboardingElements.append(OnboardingElement(logo: data["Logo"]!, title: data["Title"]!, description: data["Description"]!))
        }
    }

    var body: some View {
        VStack(spacing: 10) {
            Spacer()
<<<<<<< HEAD

            Text(config.read(query: "Team Name")).padding(.leading, 20).padding(.trailing, 20)
            Text(config.read(query: "Study Title"))
             .foregroundColor(self.color)
             .font(.system(size: 35, weight: .bold, design: .default)).padding(.leading, 20).padding(.trailing, 20)

            Spacer()
=======
            
            Image("SBDLogoGrey")
                .resizable()
                .scaledToFit()
                .padding(.leading, Metrics.PADDING_HORIZONTAL_MAIN*4)
                .padding(.trailing, Metrics.PADDING_HORIZONTAL_MAIN*4)
            
            Spacer(minLength: 2)
            
            Text(config.read(query: "Study Title"))
                .foregroundColor(self.color)
                .multilineTextAlignment(.center)
                .font(.system(size: 35, weight: .bold, design: .default))
                .padding(.leading, Metrics.PADDING_HORIZONTAL_MAIN)
                .padding(.trailing, Metrics.PADDING_HORIZONTAL_MAIN)
            
            Text(config.read(query: "Team Name"))
                .padding(.leading, Metrics.PADDING_HORIZONTAL_MAIN)
                .padding(.trailing, Metrics.PADDING_HORIZONTAL_MAIN)
>>>>>>> upstream/main

            PageView(self.onboardingElements.map { InfoView(logo: $0.logo, title: $0.title, description: $0.description, color: self.color) })

            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    self.showingDetail.toggle()
                }, label: {
                     Text("Join Study")
<<<<<<< HEAD
                        .padding(20).frame(maxWidth: .infinity)
                         .foregroundColor(.white).background(self.color)
                         .cornerRadius(15).font(.system(size: 20, weight: .bold, design: .default))
                }).sheet(isPresented: $showingDetail, onDismiss: {
=======
                        .padding(Metrics.PADDING_BUTTON_LABEL)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(self.color)
                        .cornerRadius(Metrics.RADIUS_CORNER_BUTTON)
                        .font(.system(size: 20, weight: .bold, design: .default))
                })
                .padding(.leading, Metrics.PADDING_HORIZONTAL_MAIN)
                .padding(.trailing, Metrics.PADDING_HORIZONTAL_MAIN)
                .sheet(isPresented: $showingDetail, onDismiss: {
>>>>>>> upstream/main
                    self.onComplete?()
                }, content: {
                    OnboardingViewController()
                })
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct InfoView: View {
    let logo: String
    let title: String
    let description: String
    let color: Color
    var body: some View {
        VStack(spacing: 10) {
            Circle()
                .fill(color)
                .frame(width: 100, height: 100, alignment: .center)
<<<<<<< HEAD
                .padding(6).overlay(
                    Text(logo).foregroundColor(.white).font(.system(size: 42, weight: .light, design: .default))
=======
                .padding(6)
                .overlay(
                    Text(logo)
                        .foregroundColor(.white)
                        .font(.system(size: 42, weight: .light, design: .default))
>>>>>>> upstream/main
                )

            Text(title).font(.title)
            
<<<<<<< HEAD
            Text(description).font(.body).multilineTextAlignment(.center).padding(.leading, 40).padding(.trailing, 40)
            
=======
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.leading, 40)
                .padding(.trailing, 40)
>>>>>>> upstream/main
        }
    }
}

struct OnboardingUIView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingUIView()
    }
}
