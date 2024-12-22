import SwiftUI

struct BasicGlobalCADScoreView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom, spacing: 40) {
                Text("Function Evaluation")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                HStack(spacing: 8) {
                    Text("Global CAD Score")
                        .foregroundColor(.blue)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .padding(.bottom, 2)
            }
            .padding(.bottom, 10)

            HStack(spacing: 40) {
                HStack(spacing: 8) {
                    Text("FUSION PROTEIN:")
                        .foregroundColor(.blue)
                        .bold()
                    Text("FP0001")
                }

                HStack(spacing: 8) {
                    Text("SIGNAL:")
                        .foregroundColor(.blue)
                        .bold()
                    Text("SP0088")
                }

                HStack(spacing: 8) {
                    Text("LINKER:")
                        .foregroundColor(.blue)
                        .bold()
                    Text("0011")
                }
            }
            .font(.subheadline)
            .padding(.bottom, 20)

            HStack(spacing: 15) {
                VStack(alignment: .center) {
                    Text("Interactive 3D Structure")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.semibold)

                    Image("ProteinCartoonView")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 560)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack(alignment: .center) {
                    Text("Global CAD Score")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.semibold)

                    Text("0.9960938013")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)

                    InformaionTextBox(
                        text: "CAD-score values range from 0 to 1, where values close to 1 indicate that the fusion protein is highly similar to the original protein and retains its function intact, while values close to 0 indicate that the structure is more different and the function is significantly changed.",
                        title: "Scoring Instructions",
                        height: 145
                    )

                    Text("Evaluation")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.semibold)
                        .padding(.top, 14)

                    Text("High CAD Score")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.green)

                    Text("The structural integrity of your protein suggests that its original function is well maintained.")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray)

                    NavigationLink(destination: BasicGlobalCADScoreView()) {
                        HStack {
                            Text("Focus on Specific Sites")
                                .font(.system(size: 18, weight: .bold))
                        }
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .padding(.top, 14)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(maxWidth: 1000)
        .padding()
    }
}

#Preview {
    BasicGlobalCADScoreView()
}

struct InformaionTextBox: View {
    let text: String
    let title: String
    let height: CGFloat

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "info.circle")
                        .foregroundColor(.gray)
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.gray)
                }
                Text(text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 2)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
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
