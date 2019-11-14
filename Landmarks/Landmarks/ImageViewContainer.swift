//
//  RemoteImageView.swift
//  Landmarks
//
//  Created by Jessica Byrne on 11/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//
import SwiftUI
import Combine

struct ImageViewContainer: View {
    @ObservedObject var remoteImageURL: RemoteImageURL
    
    init(imageURL: String) {
        remoteImageURL = RemoteImageURL(imageURL: imageURL)
    }
    
    var body: some View {
        Image(uiImage: (remoteImageURL.data.isEmpty) ? UIImage(imageLiteralResourceName: "noimageavailable") : UIImage(data: remoteImageURL.data)!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 250)
    }
}
