//
//  BlogLoader.swift
//  Landmarks
//
//  Created by Jessica Byrne on 11/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import Combine

class BlogLoader: ObservableObject {
    var dataPublisher = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            dataPublisher.send(data)
        }
    }
    
    init(urlString:String) {
       let feedParser = BlogParser()
        feedParser.parseFeed(url: "https://appleosophy.com/feed") { (rssItems) in
            self.rssItems = rssItems
        }
    }
}
