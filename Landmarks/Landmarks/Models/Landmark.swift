/*
See LICENSE folder for this sample’s licensing information.
https://developer.apple.com/documentation/ios_ipados_release_notes/ios_13_release_notes
 
Abstract:
The model for an individual blog.
*/

import SwiftUI
import Combine
import CoreLocation
import SDWebImage

struct Blog: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var description: String
    var link: String
    var imageURL: String
}

struct Model: Identifiable {
    var id = UUID()
    var imageURL: String

    static let imageURLArray: [Model] = [
        .init(imageURL: "https://financialpanther.com/wp-content/uploads/cropped-Financial-Panther-icon-1-32x32.png"),
        .init(imageURL:
            "https://financialpanther.com/wp-content/uploads/cropped-Financial-Panther-icon-1-32x32.png"
        )
    ]
}



extension Blog {
    func loadImage() {

    let imageURL = URL(string: "https://financialpanther.com/wp-content/uploads/cropped-Financial-Panther-icon-1-32x32.png")!
    imageView.sd_setImage(with: URL(string: "http://www.domain.com/path/to/image.jpg"), placeholderImage: UIImage(named: "placeholder.png"))
    }
}

