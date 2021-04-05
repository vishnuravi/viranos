//
//  ConnectView.swift
//  CardinalKit_Example
//
//  Created by Vishnu Ravi on 4/5/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI

struct ConnectView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Community")
                .font(.title)
                .fontWeight(.black)
                .padding(.bottom, 10)
            Text("Connect with other patients dealing with long COVID-19 symptoms.")
                .font(.subheadline)
                .padding(.bottom, 10)
            Text("Support Groups for Patients")
                .font(.headline)
                .fontWeight(.black)
                .padding(.bottom, 10)
            Spacer()
        }.padding(.all, 20)
    }
}

struct ConnectView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectView()
    }
}
