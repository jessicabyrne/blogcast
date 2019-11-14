/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of blogs.
*/

import SwiftUI
import Combine

struct BlogRow: View {
    var blog: Blog

    var body: some View {
        HStack {
            ImageView(withURL: blog.imageURL)
            Text(verbatim: blog.title)
            Spacer()
        }
    }
}

struct BlogRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BlogRow(blog: blogData[0])
            BlogRow(blog: blogData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
