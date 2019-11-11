//
//  ContentView.swift
//  Landmarks
//
//  Created by Jessica Byrne on 11/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(Model.imageURLArray.identified(by: \.id)) { model in
                    ImageRow(model: model)
                    } .navigationBarTitle(Text("LoadRemoteIamges"))
            }
        }
    }
}
