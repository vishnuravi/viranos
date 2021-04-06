
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

struct DashboardUIView: View {
    
    let color: Color;
    let config = CKConfig.shared
    
    // sample data for demo
    let physicalData: [Double] = [39,47,42,43,45,42,47,43,49]
    let mentalData: [Double] = [35,35,40,35,45,42,43,43,42]
    let stepData: [Double] = [2320,4142,4450,3640,4640,3230,3120,4321,4214]
    let sleepData: [Double] = [7,7,8,6,8,7,5,7,8]
    
    // full screen charts
    @State var showFullPhysicalChart = false
    @State var showFullMentalChart = false
    @State var showFullStepChart = false
    @State var showFullSleepChart = false
    
    init() {
        self.color = Color(config.readColor(query: "Primary Color"))
    }
    
    var body: some View {
        VStack{
            Text("Dashboard").font(.system(size: 25, weight:.bold)).padding(5)
            Divider()
            ScrollView(.vertical, showsIndicators: false) {
                LineChartView(data: physicalData, title: "Physical Health", legend: "PROMIS Global Health Survey", form: ChartForm.large, rateValue: 0).padding(.all, 30)
                
                Button(action: {
                    self.showFullPhysicalChart.toggle()
                }){
                    Text("Expand Chart")
                        .padding(10)
                        .font(.system(size: 12, weight: .bold, design: .default))
                        .foregroundColor(.white).background(self.color)
                        .cornerRadius(10)
                }.sheet(isPresented: $showFullPhysicalChart){
                    FullScreenChart(data: physicalData, title: "Physical Health", legend: "PROMIS Global Health Survey")
                }
                
                LineChartView(data: mentalData, title: "Mental Health", legend: "PROMIS Global Health Survey", form: ChartForm.large, rateValue: 0).padding(.all, 30)
                
                Button(action: {
                    self.showFullMentalChart.toggle()
                }){
                    Text("Expand Chart")
                        .padding(10)
                        .font(.system(size: 12, weight: .bold, design: .default))
                        .foregroundColor(.white).background(self.color)
                        .cornerRadius(10)
                }.sheet(isPresented: $showFullMentalChart){
                    FullScreenChart(data: mentalData, title: "Mental Health", legend: "PROMIS Global Health Survey")
                }
                
                LineChartView(data: stepData, title: "Activity", legend: "Average Weekly Step Count", form: ChartForm.large, rateValue: 0).padding(.all, 30)
                
                Button(action: {
                    self.showFullStepChart.toggle()
                }){
                    Text("Expand Chart")
                        .padding(10)
                        .font(.system(size: 12, weight: .bold, design: .default))
                        .foregroundColor(.white).background(self.color)
                        .cornerRadius(10)
                }.sheet(isPresented: $showFullStepChart){
                    FullScreenChart(data: stepData, title: "Activity", legend: "Average Step Count (Per Week)")
                }
                
                LineChartView(data: sleepData, title: "Sleep", legend: "Average Weekly Hours of Sleep", form: ChartForm.large, rateValue: 0).padding(.all, 30)
                
                Button(action: {
                    self.showFullSleepChart.toggle()
                }){
                    Text("Expand Chart")
                        .padding(10)
                        .font(.system(size: 12, weight: .bold, design: .default))
                        .foregroundColor(.white).background(self.color)
                        .cornerRadius(10)
                }.sheet(isPresented: $showFullSleepChart){
                    FullScreenChart(data: sleepData, title: "Sleep", legend: "Average Hours of Sleep (Per Week)")
                }
            }
        }.padding(.all, 20)
    }
    
    struct FullScreenChart: View {
        var data: [Double]
        var title: String
        var legend: String
        
        var body: some View {
            VStack {
                LineView(data: self.data, title: self.title, legend: self.legend).padding(.all, 20)
            }
        }
    }
    
    struct DashboardUIView_Previews: PreviewProvider {
        static var previews: some View {
            return DashboardUIView()
        }
    }
}




