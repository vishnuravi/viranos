//
//  MainUIView.swift
//  CardinalKit_Example
//
//  Created for the CardinalKit Framework.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import SwiftUI

struct MainUIView: View {
    
    let color: Color
    let config = CKConfig.shared
    
    @State var useCareKit = false
    
    init() {
        self.color = Color(config.readColor(query: "Primary Color"))
    }
    
    var body: some View {
        TabView {
            
            if useCareKit {
                ScheduleViewControllerRepresentable().tabItem {
                    Image("home").renderingMode(.template)
                    Text("Home")
                }
                
                DashboardUIView().tabItem {
                    Image("tab_dashboard").renderingMode(.template)
                    Text("Dashboard")
                }
                
                CareTeamViewControllerRepresentable().tabItem {
                    Image("tab_activities").renderingMode(.template)
                    Text("Contact")
                }
            }

            ProfileUIView(color: self.color).tabItem {
                Image("tab_profile").renderingMode(.template)
                Text("Profile")
            }
        }
        .accentColor(self.color)
        .onAppear(perform: {
            self.useCareKit = config.readBool(query: "Use CareKit")
        })
    }
}

struct MainUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainUIView()
    }
}
