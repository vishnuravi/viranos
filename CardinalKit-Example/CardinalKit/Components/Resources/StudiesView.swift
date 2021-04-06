//
//  StudiesView.swift
//  CardinalKit_Example
//
//  Created by Vishnu Ravi on 4/5/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI

struct StudiesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Clinical Studies")
                .font(.title)
                .fontWeight(.black)
                .padding(.bottom, 10)
            
            Divider()
            
            Text("Hey!")
                .font(.title)
                .fontWeight(.light)
                .padding(.bottom, 10)
            Text("We don't have any studies for you to join at the moment, but please keep checking - we'll update this page as soon as there are.")
                .font(.headline)
                .fontWeight(.light)
            
            Spacer()
        
        }.padding(.all, 20)
    }
}
struct StudiesView_Previews: PreviewProvider {
    static var previews: some View {
        StudiesView()
    }
}
