import SwiftUI
import WebKit

struct BasicResultDetailsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 15) {
                VStack(alignment: .center) {
                    Text("Fusion Protein")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.semibold)

                    ScrollableTextBox(
                        text: "LAALNHISALAEAAAKEAAAKMVQAVAVLKGDAGVSGVVKFEQASESEPTTVSYEIAGNSPNAERGFHIHEFGDATNGCVSAGPHFNPFKKTHGAPTDEVRHVGDMGNVKTDENGVAKGSFKDSLIKLIGPTSVVGRSVVIHAGQDDLGKGDTEESLKTGNAGPRPACGVIGLTN",
                        height: 150
                    )

                    Text("Interactive 3D Structure")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.semibold)

                    WebView(url: URL(string: "http://110.42.214.164")!)
                        .frame(height: 300)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack(alignment: .center) {
                    Text("Signal")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.semibold)

                    ScrollableTextBox(
                        text: "KKRKKD",
                        height: 100
                    )

                    Text("Linker")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.semibold)

                    ScrollableTextBox(
                        text: "AEAAAKEAAAKEAAAK",
                        height: 100
                    )

                    Text("Target Protein")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.semibold)

                    ScrollableTextBox(
                        text: "MVQAVAVLKGDAGVSGVVKFEQASESEPTTVSYEIAGNSPNAERGFHIHEFGDATNGCVSAGPHFNPFKKTHGAPTDEVRHVGDMGNVKTDENGVAKGSFKDSLIKLIGPTSVVGRSVVIHAGQDDLGKGDTEESLKTGNAGPRPACGVIGLTN",
                        height: 200
                    )
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            HStack(spacing: 15) {
                NavigationLink(destination: BasicConfigurationView()) {
                    HStack {
                        Text("Function Evaluation")
                            .font(.system(size: 18, weight: .bold))
                    }
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }

                NavigationLink(destination: BasicConfigurationView()) {
                    HStack {
                        Text("Stability Evaluation")
                            .font(.system(size: 18, weight: .bold))
                    }
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }

            NavigationLink(destination: BasicConfigurationView()) {
                HStack {
                    Text("Sequence Optimization")
                        .font(.system(size: 18, weight: .bold))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
        .frame(maxWidth: 1000)
    }
}

#Preview {
    BasicResultDetailsView()
}

struct ScrollableTextBox: View {
    let text: String
    let height: CGFloat

    var body: some View {
        ScrollView {
            Text(text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: height)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 2)
        )
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
