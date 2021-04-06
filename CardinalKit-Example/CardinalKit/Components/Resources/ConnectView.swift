//
//  ConnectView.swift
//  CardinalKit_Example
//
//  Created by Vishnu Ravi on 4/5/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI

struct ConnectView: View {
    
    let color: Color;
    let config = CKConfig.shared
    
    init() {
        self.color = Color(config.readColor(query: "Primary Color"))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Community")
                .font(.title)
                .fontWeight(.black)
                .padding(.bottom, 10)
            Text("Connect with other patients dealing with and researchers studying Long COVID.")
                .font(.subheadline)
                .padding(.bottom, 10)
            Text("Support Groups for Patients")
                .font(.headline)
                .fontWeight(.black)
                .padding(.bottom, 10)
            
            Divider()
            
            Button(action: {
                if let url = URL(string: "https://patientslikeme.com/") {
                    UIApplication.shared.open(url)
                }
            }){
                VStack {
                    Text("Patients Like Me")
                        .font(.headline)
                }.padding(.all, 10)
                
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(.white).background(self.color)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
            
            Button(action: {
                if let url = URL(string: "https://www.longcovid.org/") {
                    UIApplication.shared.open(url)
                }
            }){
                VStack{
                    Text("Long COVID Support Group")
                        .font(.headline)
                }.padding(.all, 10)
                
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(.white).background(self.color)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
            
            Button(action: {
                if let url = URL(string: "https://patientresearchcovid19.com/") {
                    UIApplication.shared.open(url)
                }
            }){
                VStack{
                    Text("Patient-Led Research Collaborative")
                        .font(.headline)
                }.padding(.all, 10)
                
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(.white).background(self.color)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
            
            Spacer()
            
        }.padding(.all, 20)
    }
}

struct ConnectView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectView()
    }
}
