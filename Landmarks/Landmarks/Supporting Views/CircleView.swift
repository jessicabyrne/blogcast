/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that clips an image to a circle and adds a stroke and shadow.
*/

import SwiftUI

struct CircleView: View {
    var view: AnyView

    var body: some View {
        view
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(view: AnyView(ImageView(withURL: "https://financialpanther.com/wp-content/uploads/cropped-Financial-Panther-icon-1-32x32.png")))
    }
}
