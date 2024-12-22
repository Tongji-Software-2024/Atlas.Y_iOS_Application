import SwiftUI
import PDFKit

struct PDFViewer: UIViewRepresentable {
    let pdfName: String

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        pdfView.backgroundColor = .white
        if let pdfData = NSDataAsset(name: pdfName)?.data {
            pdfView.document = PDFDocument(data: pdfData)
        }
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {}
}

struct UserGuideView: View {
    var body: some View {
        PDFViewer(pdfName: "UserGuide")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .navigationTitle("User Guide")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UserGuideView()
}
