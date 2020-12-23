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


struct DashboardView: View {
    var body: some View {
        
        VStack{
            Text("Dashboard").font(.system(size: 25, weight:.bold))
            ScrollView {
                LineChartView(data: [35,35,40,61,45,42,43,43,42], title: "Overall Health", legend: "PROMIS global health score", form: ChartForm.large, rateValue: 0).padding(10)
                
                
                
                LineChartView(data: [2320,4142,4450,3640,4640,3230,3120,4321,4214], title: "Steps", legend: "Average Step Count", form: ChartForm.large, rateValue: 0).padding(20)
                
                 LineChartView(data: [40,35,37,44,35,35,30,35], title: "Sleep", legend: "Hours of Sleep", form: ChartForm.large, rateValue: 0).padding(10)
                
                
            }
            
        }
        
    }
    
}
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}


struct TooltipText: View {
    @State private var isActive = false
    
    let text: String
    let helpText: String
    var body: some View {
        Text(isActive ? helpText : text)
            .padding( isActive ? 6 : 0)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color.blue, lineWidth: isActive  ? 1 : 0)
            )
            .animation(.easeOut(duration: 0.2) )
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged( { _ in self.isActive = true } )
                .onEnded( { _ in self.isActive = false } )
            )
    }
    
   
}



   





