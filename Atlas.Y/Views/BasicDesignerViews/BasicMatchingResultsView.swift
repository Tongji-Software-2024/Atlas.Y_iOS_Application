import SwiftUI

struct BasicMatchingResultsView: View {
    @State private var data: [FusionProteinData] = {
        var items = [FusionProteinData]()
        let fusionProteins = (1...32).map { String(format: "FP%04d", $0) }.shuffled()
        for fusionProtein in fusionProteins {
            let signal = String(format: "SP%04d", Int.random(in: 1000...9999))
            let linker = String(format: "LK%04d", Int.random(in: 1000...9999))
            let stability = Double.random(in: 100...500)
            items.append(FusionProteinData(fusionProtein: fusionProtein, signal: signal, linker: linker, stability: stability))
        }
        return items.sorted { $0.stability < $1.stability }
    }()

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom, spacing: 40) {
                Text("Matching Results")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                HStack(spacing: 8) {
                    Text("32")
                        .foregroundColor(.blue)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("results")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .padding(.bottom, 2)
            }
            .padding(.bottom, 10)

            HStack(spacing: 40) {
                HStack(spacing: 8) {
                    Text("SEQUENCE / FASTA:")
                        .foregroundColor(.blue)
                        .bold()
                    Text("P00445.fasta")
                }

                HStack(spacing: 8) {
                    Text("PDB:")
                        .foregroundColor(.blue)
                        .bold()
                    Text("1B4L.pdb")
                }

                HStack(spacing: 8) {
                    Text("SUBCELLULAR POSITION:")
                        .foregroundColor(.blue)
                        .bold()
                    Text("NES")
                }
            }
            .font(.subheadline)
            .padding(.bottom, 20)

            Text("Click to select an entry")
                .foregroundColor(.gray)
                .padding(.bottom, 2)

            ScrollView {
                VStack(spacing: 0) {
                    HStack {
                        Text("Fusion Protein")
                            .frame(maxWidth: .infinity, alignment: .center)
                        Text("Signal")
                            .frame(maxWidth: .infinity, alignment: .center)
                        Text("Linker")
                            .frame(maxWidth: .infinity, alignment: .center)
                        Text("Stability")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .font(.headline)
                    .padding(.vertical, 12)
                    .background(Color.blue)
                    .foregroundColor(.white)

                    ForEach(data) { item in
                        NavigationLink(destination: BasicResultDetailsView()) {
                            HStack {
                                Text(item.fusionProtein)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                Text(item.signal)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                Text(item.linker)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                Text(String(format: "%.2f", item.stability))
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .padding(.vertical, 12)
                            .background(Color.white)
                            .border(Color.blue, width: 0.5)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: 1000)
        .padding()
    }
}

#Preview {
    BasicMatchingResultsView()
}

struct FusionProteinData: Identifiable {
    let id = UUID()
    let fusionProtein: String
    let signal: String
    let linker: String
    let stability: Double
}
