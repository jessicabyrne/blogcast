//
//  RemoteImageURL.swift
//  Landmarks
//
//  Created by Jessica Byrne on 11/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//
//
//The BindableObject protocol’s requirement is now willChange instead of didChange, and should now be sent before the object changes rather than after it changes. This change allows for improved coalescing of change notifications. (51580731)



import SwiftUI
import Combine

class RemoteImageURL: ObservableObject {
    var willChange = PassthroughSubject<Data, Never>()
    
    var data = Data() {
        willSet {
            willChange.send(data)
        }
    }
    
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.data = data
            }
            
        }.resume()
    }
}
