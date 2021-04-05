//
//  BadgeView.swift
//  CardinalKit_Example
//
//  Created by Vishnu Ravi on 4/5/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI

struct BadgeView: View {
    
    var badges: [Color] = [.blue, .green, .orange, .red, .gray, .pink, .yellow]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Points")
                .font(.title)
                .fontWeight(.black)
                .padding(.bottom, 20)
            Text("You have 100 points!")
                .font(.body)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            Text("Thanks for being a part of our study! Keep doing weekly surveys to get more points and unlock more badges!")
                .font(.subheadline)
                .padding(.bottom, 10)
            Text("Badges You've Earned")
                .font(.title)
                .fontWeight(.black)
        }.padding(.all, 20)
        
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: 220) {
                ForEach(badges, id: \.self) { badge in
                    GeometryReader { geometry in
                        Rectangle()
                            .foregroundColor(badge)
                            .overlay(
                                Image(systemName: "star.circle").font(.system(size: 60)))
                            .frame(width: 200, height: 300, alignment: .center)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                            .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                    }
                }
            }.padding(.horizontal, 10)
        }
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
