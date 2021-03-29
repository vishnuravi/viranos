
//
//  DashboardView.swift
//  CardinalKit_Example
//
//  Created by Vishnu Ravi on 9/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//
import SwiftUI
import SwiftUICharts
import Foundation
import FirebaseFirestore

struct DashboardUIView: View {
    var body: some View {
        
        VStack{
            Text("Dashboard").font(.system(size: 25, weight:.bold)).padding(5)
            
            
            ScrollView {
                LineChartView(data: [35,35,40,35,45,42,43,43,42], title: "Overall Health", legend: "PROMIS global health // score", form: ChartForm.large, rateValue: 0).padding(10)
                LineChartView(data: [2320,4142,4450,3640,4640,3230,3120,4321,4214], title: "Steps", legend: "Average Step Count", form: ChartForm.large, rateValue: 0).padding(20)
                LineChartView(data: [7,7,8,6,8,7,5,78], title: "Sleep", legend: "Hours of Sleep", form: ChartForm.large, rateValue: 0).padding(10)
            }
            
        }
    }
}

struct DashboardUIView_Previews: PreviewProvider {
    static var previews: some View {
        return DashboardUIView()
    }
}


    
    

