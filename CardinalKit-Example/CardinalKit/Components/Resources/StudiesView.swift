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
            Text("No clinical studies available at the moment, please check back later.").font(.subheadline)
            Spacer()
        }.padding(.all, 20)
    }
}
struct StudiesView_Previews: PreviewProvider {
    static var previews: some View {
        StudiesView()
    }
}
