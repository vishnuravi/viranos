//
//  ResourcesView.swift
//  CardinalKit_Example
//
//  Created by Vishnu Ravi on 9/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//
import SwiftUI

struct ResourcesUIView: View {
    
    let color: Color;
    let config = CKConfig.shared
    
    init() {
        self.color = Color(config.readColor(query: "Primary Color"))
    }
    
    var body: some View {
        VStack {
            Text("Resources").font(.system(size: 25, weight:.bold))
            Divider()
            ScrollView {
                VStack {
                    CardView(title: "Points", headline: "Incentives", description: "Redeem participation points for rewards like gift cards, badges and more.", buttonLabel: "View My Rewards", modal: "badges")
                    CardView(title: "Clinical Studies", headline: "Research", description: "Learn about clinical studies for patients having long term symptoms of COVID-19.", buttonLabel: "View Studies", modal: "studies")
                    CardView(title: "Community", headline: "Connect", description: "Connect with other people experiencing long term COVID-19 symptoms.", buttonLabel: "Join the Community", modal: "connect")
                    CardView(title: "Study Team", headline: "Contacts", description: "Get in touch with the study team to get your questions answered.", buttonLabel: "Reach the Team", modal: "contacts")
                }
            }
        }.padding(.top, 10)
    }
}


struct ContactsView: View {
    var body: some View {
        CareTeamViewControllerRepresentable()
    }
}

struct CardView: View {
    
    let color: Color;
    let config = CKConfig.shared
    
    @State var showingBadges = false
    @State var showingStudies = false
    @State var showingConnect = false
    @State var showingContacts = false
    
    var title: String
    var headline: String
    var description: String
    var buttonLabel: String
    var modal: String
    
    init(title: String, headline: String, description: String, buttonLabel: String, modal: String) {
        self.color = Color(config.readColor(query: "Primary Color"))
        self.title = title
        self.headline = headline
        self.description = description
        self.buttonLabel = buttonLabel
        self.modal = modal
    }
    
    
    var body: some View {
        HStack(alignment: .center){
            VStack(alignment: .leading) {
                HStack{
                    if (self.modal == "studies"){
                        Image(systemName: "pills")
                    }
                    if (self.modal == "connect") {
                        Image(systemName: "person.2")
                    }
                    if (self.modal == "badges"){
                        Image(systemName: "star.circle")
                    }
                    if (self.modal == "contacts"){
                        Image(systemName: "message")
                    }
                    Text(headline)
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                Text(title)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                if(self.modal == "connect"){
                    Button(action: {
                        self.showingConnect.toggle()
                    }){
                        Text(buttonLabel)
                            .padding(10)
                            .font(.system(size: 12, weight: .bold, design: .default))
                            .foregroundColor(.white).background(self.color)
                            .cornerRadius(10)
                    }.padding(.top, 10)
                    .sheet(isPresented: $showingConnect){
                        ConnectView()
                    }
                }
                
                if(self.modal == "contacts"){
                    Button(action: {
                        self.showingContacts.toggle()
                    }){
                        Text(buttonLabel)
                            .padding(10)
                            .font(.system(size: 12, weight: .bold, design: .default))
                            .foregroundColor(.white).background(self.color)
                            .cornerRadius(10)
                    }.padding(.top, 10)
                    .sheet(isPresented: $showingContacts){
                        ContactsView()
                    }
                }
                
                if(self.modal == "badges") {
                    Button(action: {
                        self.showingBadges.toggle()
                    }){
                        Text(buttonLabel)
                            .padding(10)
                            .font(.system(size: 12, weight: .bold, design: .default))
                            .foregroundColor(.white).background(self.color)
                            .cornerRadius(10)
                    }.padding(.top, 10)
                    .sheet(isPresented: $showingBadges) {
                        BadgeView()
                    }
                }
                
                if(self.modal == "studies"){
                    Button(action: {
                        self.showingStudies.toggle()
                    }){
                        Text(buttonLabel)
                            .padding(10)
                            .font(.system(size: 12, weight: .bold, design: .default))
                            .foregroundColor(.white).background(self.color)
                            .cornerRadius(10)
                    }.padding(.top, 10)
                    .sheet(isPresented: $showingStudies) {
                        StudiesView()
                    }
                }
            }.padding(.all, 25)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color(UIColor(red: 0.49, green: 0.78, blue: 1.00, alpha: 1.00)))
        .modifier(CardModifier())
        .padding(.all, 10)
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
    }
    
}

struct ResourcesUIView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesUIView()
    }
}
