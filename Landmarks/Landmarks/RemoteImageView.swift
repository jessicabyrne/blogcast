//
//  RemoteImageView.swift
//  Landmarks
//
//  Created by Jessica Byrne on 11/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//
import SwiftUI

struct ImageViewContainer: View {
    @ObjectBinding var remoteImageURL: RemoteImageURL
    
    init(imageURL: String) {
        remoteImageURL = RemoteImageURL(imageURL: imageURL)
    }
    
    var body: some View {
        Image(uiImage: (remoteImageURL.data.isEmpty) ? UIImage(imageLiteralResourceName: "Swift") : UIImage(data: remoteImageURL.data)!)
        .resizeable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 250, height: 250)
    }
}
