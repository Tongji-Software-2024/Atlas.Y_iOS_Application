import SwiftUI

struct BasicLocalCADScoreView: View {
    @State private var showResults: Bool = false
    @State private var selectedResidue: String = "Click on the 3D structure to select"
    @State private var selectedName: String = "Autofill after filling in Selected Residue Site"
    @State private var isAlertVisible: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom, spacing: 40) {
                Text("Function Evaluation")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                HStack(spacing: 8) {
                    Text("Local CAD Score")
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
                    Text("LK0011")
                }
            }
            .font(.subheadline)

            Divider()
                .frame(height: 1)
                .background(Color.gray.opacity(0.5))
                .padding(.top, 5)
                .padding(.bottom, 20)

            HStack(spacing: 15) {
                VStack(alignment: .center) {
                    Text("Interactive 3D Structure")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.semibold)

                    Image("ProteinBallView")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 560)
                        .onTapGesture {
                            selectedResidue = "429"
                            selectedName = "ALA"
                        }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack(alignment: .leading) {
                    if !showResults {
                        Text("Selected Residue Site")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fontWeight(.semibold)

                        InfoTextBox(
                            text: selectedResidue,
                            height: 52,
                            color: selectedResidue == "429" ? .black : .gray
                        )

                        Text("Selected Residue Name")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fontWeight(.semibold)
                            .padding(.top, 10)

                        InfoTextBox(
                            text: selectedName,
                            height: 52,
                            color: selectedName == "ALA" ? .black : .gray
                        )

                        Text("Radius Range (Å)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fontWeight(.semibold)
                            .padding(.top, 10)

                        InfoTextBox(
                            text: "10",
                            height: 52,
                            color: .black
                        )

                        Button(action: {
                            showResults.toggle()
                        }) {
                            HStack {
                                Text("Calculate")
                                    .font(.system(size: 18, weight: .bold))
                            }
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                        .padding(.top, 87)
                    } else {
                        Text("Center Residue")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fontWeight(.semibold)

                        Text("(ALA, 429)")
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text("Radius (Å)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fontWeight(.semibold)
                            .padding(.top, 10)

                        Text("10")
                            .frame(maxWidth: .infinity, alignment: .leading)

                        HStack {
                            Text("CAD A-A Score")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fontWeight(.semibold)
                            Image(systemName: "info.circle")
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    alertTitle = "CAD A-A Score"
                                    alertMessage = "CAD A-A Score measures the difference in contact areas between all atoms of the central residue and surrounding residues."
                                    isAlertVisible = true
                                }
                        }
                        .padding(.top, 10)

                        Text("0.9619899184")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)

                        HStack {
                            Text("CAD A-S Score")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fontWeight(.semibold)
                            Image(systemName: "info.circle")
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    alertTitle = "CAD A-S Score"
                                    alertMessage = "CAD A-S Score assesses the difference in contact areas between the central residue's atoms and surrounding side-chain atoms."
                                    isAlertVisible = true
                                }
                        }
                        .padding(.top, 10)

                        Text("0.9860982319")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)

                        Button(action: {
                            selectedResidue = "Click on the 3D structure to select"
                            selectedName = "Autofill after filling in Selected Residue Site"
                            showResults.toggle()
                        }) {
                            HStack {
                                Text("Calculate Another Site")
                                    .font(.system(size: 18, weight: .bold))
                            }
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                        .padding(.top, 77)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(maxWidth: 1000)
        .padding()
        .alert(isPresented: $isAlertVisible) {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    BasicLocalCADScoreView()
}

struct InfoTextBox: View {
    let text: String
    let height: CGFloat
    let color: Color

    var body: some View {
        ScrollView {
            Text(text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(color)
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
