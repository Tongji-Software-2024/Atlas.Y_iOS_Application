import SwiftUI

struct BasicConfigurationView: View {
    @State private var showInfoAlert = false
    @State private var fastaButtonText = "Upload Fasta File"
    @State private var pdbButtonText = "Upload PDB File"
    @State private var fastaButtonColor = Color.white
    @State private var pdbButtonColor = Color.white

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 15) {
                VStack(alignment: .center, spacing: 10) {
                    Text("Protein Sequence Demand")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.semibold)
                    Button(fastaButtonText) {
                        fastaButtonText = "P00445.fasta"
                        fastaButtonColor = Color.blue
                    }
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(fastaButtonColor)
                    .foregroundColor(fastaButtonColor == Color.blue ? .white : .blue)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 2))
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack(alignment: .center, spacing: 10) {
                    Text("PDB Demand")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.semibold)
                    Button(pdbButtonText) {
                        pdbButtonText = "1b4l.pdb"
                        pdbButtonColor = Color.blue
                    }
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(pdbButtonColor)
                    .foregroundColor(pdbButtonColor == Color.blue ? .white : .blue)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 2))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            HStack {
                Text("Select Positioning Demand")
                    .frame(alignment: .leading)
                    .fontWeight(.semibold)

                Button(action: {
                    showInfoAlert.toggle()
                }) {
                    Image(systemName: "info.circle")
                }
                .alert(isPresented: $showInfoAlert) {
                    Alert(title: Text("Information"), message: Text("Here is more info about positioning demand."), dismissButton: .default(Text("OK")))
                }
            }
            .padding(.top, 12)

            HStack(spacing: 15) {
                Image("DefaultPositioningDemand")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 600)

                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(["NLS", "NES", "SP", "SP_TM", "SP_GPI", "GPI", "TM", "PTS", "MT", "LYS"], id: \.self) { buttonLabel in
                            Button(buttonLabel) {
                                // Button action here
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 2))
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(1)
                }
            }
            .frame(height: 300)

            Text("Choose Linker Properties")
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.semibold)
                .padding(.top, 12)

            HStack(spacing: 15) {
                VStack(alignment: .center, spacing: 10) {
                    Text("Mechanical Properties")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    MechanicalPropertiesSegmentedPicker()
                        .frame(width: 354)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack(alignment: .center, spacing: 10) {
                    Text("Solubility")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    SolubilitySegmentedPicker()
                        .frame(width: 354)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            NavigationLink(destination: BasicConfigurationView()) {
                HStack {
                    Text("Start Matching")
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding(.top, 20)
        }
        .frame(maxWidth: 1000)
    }
}

#Preview {
    BasicConfigurationView()
}

struct MechanicalPropertiesSegmentedPicker: View {
    @State private var selectedOption = 0

    let options = ["rigid", "flexible"]

    var body: some View {
        Picker("", selection: $selectedOption) {
            Text(options[0]).tag(0)
            Text(options[1]).tag(1)
        }
        .pickerStyle(SegmentedPickerStyle())
        .scaleEffect(CGSize(width: 1.4, height: 1.4))
    }
}

struct SolubilitySegmentedPicker: View {
    @State private var selectedOption = 0

    let options = ["hydrophilic", "hydrophobic"]

    var body: some View {
        Picker("", selection: $selectedOption) {
            Text(options[0]).tag(0)
            Text(options[1]).tag(1)
        }
        .pickerStyle(SegmentedPickerStyle())
        .scaleEffect(CGSize(width: 1.4, height: 1.4))
    }
}
