//
//  BadgeView.swift
//  CardinalKit_Example
//
//  Created by Vishnu Ravi on 4/5/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI

struct Badge {
    let id = UUID()
    let title: String
    let logo: String
    let color: Color
}

struct BadgeView: View {
    
    let points = 100 // sample data

    var levels: Int {
        // every 50 points increases your level by 1
        return self.points / 50
    }
    
    // all available badges
    var allBadges: [Badge] = [
        Badge(title: "COVID Hero", logo: "flame.fill", color: .blue),
        Badge(title: "Knight of Sanitizer", logo: "drop", color: .orange),
        Badge(title: "Lord Viranos", logo: "bolt.slash", color: .yellow)
    ]
    
    var badges: [Badge] {
        // every additional level gets the next badge
        return Array(allBadges[0...self.levels])
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Points")
                .font(.title)
                .fontWeight(.black)
                .padding(.bottom, 20)
            Text("You have \(points) points!")
                .font(.title)
                .fontWeight(.light)
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
                ForEach(badges, id:\.id) { badge in
                    GeometryReader { geometry in
                        Rectangle()
                            .foregroundColor(badge.color)
                            .overlay(
                                VStack{
                                    Image(systemName: badge.logo)
                                        .font(.system(size: 60))
                                        .foregroundColor(.white)
                                        .padding(.bottom, 15)
                                    Text(badge.title)
                                        .foregroundColor(.white)
                                }
                            )
                            .frame(width: 200, height: 300, alignment: .center)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                            .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                    }
                }
            }
            .padding(.trailing, 200)
            .padding(.leading, 20)
        }
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
