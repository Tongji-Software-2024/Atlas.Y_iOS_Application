import SwiftUI

struct WikiView: View {
    @State private var currentIndex: Int = 0

    let images = [
        "WikiPresentation1",
        "WikiPresentation2",
        "WikiPresentation3",
        "WikiPresentation4",
        "WikiPresentation5",
        "WikiPresentation6"
    ]

    var body: some View {
        VStack(spacing: 30) {
            GeometryReader { geometry in
                HStack(spacing: 15) {
                    ForEach(0..<images.count, id: \.self) { index in
                        Image(images[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: (geometry.size.width - 30) / 3, height: 200)
                            .clipped()
                            .cornerRadius(10)
                    }
                }
                .frame(width: geometry.size.width, alignment: .leading)
                .offset(x: CGFloat(-currentIndex) * (geometry.size.width / 3 + 15))
                .animation(.easeInOut, value: currentIndex)
            }
            .frame(height: 200)
            .padding(.horizontal)

            HStack(spacing: 15) {
                Button(action: {
                    if currentIndex > 0 {
                        currentIndex -= 1
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                }
                Button(action: {
                    if currentIndex < images.count - 3 {
                        currentIndex += 1
                    }
                }) {
                    Image(systemName: "chevron.right")
                        .font(.title)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                }
            }

            VStack(spacing: 10) {
                Text("Our WIKI provides a comprehensive overview of")
                    .font(.system(size: 36, weight: .semibold))

                Text("Atlas.Y toolkit's development")
                    .font(.system(size: 36, weight: .semibold))
                    .foregroundColor(.blue)

                VStack(spacing: 4) {
                    HStack {
                        Text("Our WIKI covers every link from")
                            .foregroundColor(.gray)
                        Text("the concept of topic selection, design principle,")
                            .foregroundColor(.blue)
                    }
                    Text("algorithm implementation to the actual construction.")
                        .foregroundColor(.blue)
                }

                VStack(spacing: 4) {
                    HStack {
                        Text("Besides,")
                            .foregroundColor(.gray)
                        Text("the advocacy strategy and human practices")
                            .foregroundColor(.blue)
                        Text("are also documented in detail.")
                            .foregroundColor(.gray)
                    }
                    Text("By visiting the WIKI, you can gain insight into the entire development process,")
                        .foregroundColor(.gray)
                    Text("explore our technical details and the thinking behind our decisions,")
                        .foregroundColor(.gray)
                    Text("and access a wealth of background information and resource support.")
                        .foregroundColor(.gray)
                }

                HStack {
                    NavigationLink(destination: WebView()) {
                        Text("CLICK HERE")
                            .font(.system(size: 36, weight: .semibold))
                            .foregroundColor(.blue)
                            .underline()
                    }
                    Text("to visit our WIKI")
                        .font(.system(size: 36, weight: .semibold))
                }
                .padding(.top, 36)
            }
            .padding()
        }
        .frame(maxWidth: 1000)
        .padding()
    }
}

#Preview {
    WikiView()
}
