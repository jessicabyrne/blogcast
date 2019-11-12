//
//  ContentView.swift
//  Landmarks
//
//  Created by Jessica Byrne on 11/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(Model.imageURLArray) { model in
                    BlogRow(model: model, remoteImageURL: remoteImageURL)
                    } .navigationBarTitle(Text("Load Remote Images"))
            }
        }
    }
}
