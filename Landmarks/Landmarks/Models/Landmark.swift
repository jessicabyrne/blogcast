/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual blog.
*/

import SwiftUI
import CoreLocation
import SDWebImage


struct Blog: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var description: String
    var link: String
    var imageURL: String
}

extension Blog {
    var image: Image {
        imageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "noimageavailable.png"))
    }
}

