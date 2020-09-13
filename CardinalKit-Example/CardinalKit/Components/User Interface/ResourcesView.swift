//
//  ResourcesView.swift
//  CardinalKit_Example
//
//  Created by Vishnu Ravi on 9/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import SwiftUI

struct ResourcesView: View {
    var body: some View {
        VStack {
            Text("Resources").font(.system(size: 25, weight:.bold))
            Text("Frequently Updated")
                .font(.caption)
                .padding(.top, 5)
            ScrollView {
                VStack {
                    CardView(title: "Points", headline: "Incentives", description: "Redeem participation points for rewards like gift cards, badges and more.", button: "View My Rewards")
                    CardView(title: "Clinical Studies", headline: "Research", description: "Learn about clinical studies for patients having long term symptoms of COVID-19", button: "View Studies")
                    CardView(title: "Community", headline: "Connect", description: "Connect with other people experiencing long term COVID-19 symptoms", button: "Open Chat")
                }
            }
        }
    }
}

struct DetailView: View {
    var body: some View {
        ScrollView {
            
        }
    }
}

struct CardView: View {
    var title: String
    var headline: String
    var description: String
    var button: String
    
    let config = CKPropertyReader(file: "CKConfiguration")
    
    var body: some View {
        VStack {
            //            Image("swiftui-button")
            //                .resizable()
            //                .aspectRatio(contentMode: .fit)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(headline)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(title)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text(description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Button(action: {
                        // button action
                    }){
                        Text(button)
                            .padding(10)
                            .font(.system(size: 12, weight: .bold, design: .default))
                            .foregroundColor(.white).background(Color(config.readColor(query: "Primary Color")))
                            .cornerRadius(10)
                    }.padding(.top, 10)
                }
                .layoutPriority(100)
                
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 3)
        )
            .padding([.top, .horizontal])
    }
}

struct ResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesView()
    }
}
