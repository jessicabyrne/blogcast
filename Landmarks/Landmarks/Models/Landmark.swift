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
    fileprivate var imageName: String
    var state: String
    var description: String
    var category: Category


    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
    }
}

extension Blog {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

