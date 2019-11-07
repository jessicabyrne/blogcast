/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a blog.
*/

import SwiftUI

struct BlogDetail: View {
    var blog: Blog

    var body: some View {
        VStack {
            

            CircleImage(image: blog.image)
                .padding(.bottom, 30)
                .padding(.top, 30)


            VStack(alignment: .leading) {
                Text(blog.name)
                    .font(.title)

                HStack(alignment: .top) {
                    Text(blog.park)
                        .font(.subheadline)
                    Spacer()
                    Text(blog.state)
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
        .navigationBarTitle(Text(verbatim: blog.name), displayMode: .inline)
    }
}

struct BlogDetail_Previews: PreviewProvider {
    static var previews: some View {
        BlogDetail(blog: blogData[0])
    }
}
