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
    var image: Image {
        WebImage(url: URL(string: imageURL))
        .onSuccess { image, cacheType in
            // Success
        }
    }
}

