/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of blogs.
*/

import SwiftUI

struct BlogRow: View {
    @ObjectBinding var remoteImageURL: RemoteImageURL
    var blog: Blog
    let model: Model

    var body: some View {
        HStack {
            ImageViewContainer(imageURL:model.imageURL)
                .frame(width: 50, height: 50)
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
