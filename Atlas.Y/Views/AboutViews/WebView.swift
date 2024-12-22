import SwiftUI
import WebKit

struct WebViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let url = URL(string: "https://2024.igem.wiki/tongji-software")!
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

struct WebView: View {
    var body: some View {
        WebViewContainer()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .navigationTitle("Wiki")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    WebView()
}
