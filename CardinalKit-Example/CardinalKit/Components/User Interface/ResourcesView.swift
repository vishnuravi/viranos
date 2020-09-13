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
            ScrollView {
                Text("Resources")
            }
        }
    }
}

struct ResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesView()
    }
}
