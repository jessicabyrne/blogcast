/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 The model for an individual blog.
 */

import SwiftUI
import CoreLocation


struct Blog: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var description: String
    var link: String
    var imageURL: String
}

extension Blog {
    
    init(rssItem: RSSItem) {
        id = 1
        title = rssItem.title
        description = rssItem.description
        link = ""
        imageURL = ""
    }
}

extension Blog {
    var body: some View {
        HStack {
            ImageView(withURL: imageURL)
            Text("image here!")
        }
    }
}

