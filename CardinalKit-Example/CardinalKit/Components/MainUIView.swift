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
<<<<<<< HEAD
    let config = CKPropertyReader(file: "CKConfiguration")
=======
    let config = CKConfig.shared
    
    @State var useCareKit = false
>>>>>>> upstream/main
    
    init() {
        self.color = Color(config.readColor(query: "Primary Color"))
    }
    
    var body: some View {
        TabView {
<<<<<<< HEAD
            StudyActivitiesUIView(color: self.color)
                .tabItem {
                    Image("tab_activities").renderingMode(.template)
                    Text("Activities")
            }

            ProfileUIView(color: self.color)
                .tabItem {
                    Image("tab_profile").renderingMode(.template)
                    Text("Profile")
                }
        }.accentColor(self.color)
=======
            TasksUIView(color: self.color).tabItem {
                Image("tab_tasks").renderingMode(.template)
                Text("Tasks")
            }
            
            if useCareKit {
                ScheduleViewControllerRepresentable().tabItem {
                    Image("tab_schedule").renderingMode(.template)
                    Text("Schedule")
                }
                
                CareTeamViewControllerRepresentable().tabItem {
                    Image("tab_care").renderingMode(.template)
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
>>>>>>> upstream/main
    }
}

struct MainUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainUIView()
    }
}
