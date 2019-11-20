//
//  BlogLoader.swift
//  Landmarks
//
//  Created by Jessica Byrne on 11/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import Combine

private let feedURL = "https://appleosophy.com/feed"
class BlogLoader: ObservableObject {
    
    let feedParser = BlogParser()

    @Published
    var blogs: [Blog] = []
    
    func load() {
        feedParser.parseFeed(url: feedURL) { result in
            do {
                self.blogs = try result.get().map { Blog(rssItem: $0) }
            } catch {
                // todo: handle error
            }

         }
    }
}
