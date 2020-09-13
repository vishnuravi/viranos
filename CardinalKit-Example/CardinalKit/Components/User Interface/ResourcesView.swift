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
                    CardView(title: "Points", headline: "Incentives", description: "Redeem participation points for rewards like gift cards, badges and more.", button: "View My Rewards", modal: "memes")
                    CardView(title: "Clinical Studies", headline: "Research", description: "Learn about clinical studies for patients having long term symptoms of COVID-19", button: "View Studies", modal: "studies")
                    CardView(title: "Community", headline: "Connect", description: "Connect with other people experiencing long term COVID-19 symptoms", button: "Open Chat", modal: "threads")
                }
            }
        }
    }
}

struct MemeView: View {
    var body: some View {
        VStack {
            Text("Badges You've Earned").font(.title)
                .padding(.bottom, 10)
            Image("hercules_meme")
            .resizable()
            .aspectRatio(contentMode: .fit)
                .padding(.bottom, 10)
            Text("Keep doing activities daily to unlock more badges and rewards!").font(.caption)
        }
    }
}

struct ThreadView: View {
    let color: Color
    let config = CKPropertyReader(file: "CKConfiguration")
    var date = ""
    
    init(color: Color) {
        self.color = color
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM. d, YYYY"
        
        self.date = formatter.string(from: date)
    }
    
    var body: some View {
        VStack {
            Text("Add and read COVID experiences").font(.system(size: 18, weight: .regular)).padding()
            List {
                Section(header: Text("Threads: Choose a topic to see threads")) {
                    Section {
                        Text("Physical Health").font(.system(size: 18, weight:.bold))
                    }
                    
                    Section {
                        Text("Mental Health").font(.system(size: 18, weight:.bold))
                    }
                    
                    Section {
                        Text("Socioeconomic wellbeing").font(.system(size: 18, weight:.bold))
                    }
                }.listRowBackground(Color.white)
            }.listStyle(GroupedListStyle())
            
            Text("All threads are completely anonymous, for your privacy.").font(.system(size: 15, weight:.light))
            Spacer()
            
        }
    }
}

struct CardView: View {
    
    @State var showingThreads = false
    @State var showingMemes = false
    
    var title: String
    var headline: String
    var description: String
    var button: String
    var modal: String
    
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
                    
                    if(self.modal == "threads"){
                    Button(action: {
                        self.showingThreads.toggle()
                    }){
                        Text(button)
                            .padding(10)
                            .font(.system(size: 12, weight: .bold, design: .default))
                            .foregroundColor(.white).background(Color(config.readColor(query: "Primary Color")))
                            .cornerRadius(10)
                    }.padding(.top, 10)
                    .sheet(isPresented: $showingThreads) {
                        ThreadView(color: Color(self.config.readColor(query: "Primary Color")))
                    }
                    } else if(self.modal == "memes") {
                        Button(action: {
                            self.showingMemes.toggle()
                        }){
                            Text(button)
                                .padding(10)
                                .font(.system(size: 12, weight: .bold, design: .default))
                                .foregroundColor(.white).background(Color(config.readColor(query: "Primary Color")))
                                .cornerRadius(10)
                        }.padding(.top, 10)
                        .sheet(isPresented: $showingMemes) {
                            MemeView()
                        }
                    } else {
                        Button(action: {
                            // clinical studies action
                        }){
                            Text(button)
                                .padding(10)
                                .font(.system(size: 12, weight: .bold, design: .default))
                                .foregroundColor(.white).background(Color(config.readColor(query: "Primary Color")))
                                .cornerRadius(10)
                        }.padding(.top, 10)
                    }
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
