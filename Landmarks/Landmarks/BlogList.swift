/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of blogs.
*/

import SwiftUI

struct BlogList: View {
    
    @Binding var blogs: [Blog]
    
    var body: some View {
        NavigationView {
            List(blogData) { blog in
                NavigationLink(destination: BlogDetail(blog: blog)) {
                    BlogRow(blog: blog)
                }
            }
            .navigationBarTitle(Text("Blogs"))
        }
    }
}

struct BlogList_Previews: PreviewProvider {
    @State static var blogs = blogData
    
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            BlogList(blogs: $blogs)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
