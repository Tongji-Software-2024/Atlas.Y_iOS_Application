import SwiftUI

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
                        .padding(.top, 10)

                    Image("ProteinCartoonView")
                        .resizable()
                        .scaledToFit()
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
                        .padding(.top, 10)

                    ScrollableTextBox(
                        text: "AEAAAKEAAAKEAAAK",
                        height: 100
                    )

                    Text("Target Protein")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.semibold)
                        .padding(.top, 10)

                    ScrollableTextBox(
                        text: "MVQAVAVLKGDAGVSGVVKFEQASESEPTTVSYEIAGNSPNAERGFHIHEFGDATNGCVSAGPHFNPFKKTHGAPTDEVRHVGDMGNVKTDENGVAKGSFKDSLIKLIGPTSVVGRSVVIHAGQDDLGKGDTEESLKTGNAGPRPACGVIGLTN",
                        height: 246
                    )
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            HStack(spacing: 15) {
                NavigationLink(destination: BasicGlobalCADScoreView()) {
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

                NavigationLink(destination: BasicStabilityEvaluationView()) {
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
            .padding(.vertical, 10)

            NavigationLink(destination: BasicGlobalCADScoreView()) {
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
