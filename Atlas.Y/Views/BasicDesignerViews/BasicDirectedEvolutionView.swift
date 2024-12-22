import SwiftUI

struct BasicDirectedEvolutionView: View {
    @State private var data: [VariatProteinData] = {
        var items = [VariatProteinData]()
        let variatProteins = (1...114).map { String(format: "VR%04d", $0) }
        for variatProtein in variatProteins {
            let firstLetter = Character(UnicodeScalar(Int.random(in: 65...90))!)
            let number = Int.random(in: 1...100)
            let lastLetter = Character(UnicodeScalar(Int.random(in: 65...90))!)
            let mutant = "\(firstLetter)\(number)\(lastLetter)"
            let score = Double.random(in: 1...4)
            items.append(VariatProteinData(variatProtein: variatProtein, mutant: mutant, score: score))
        }
        return items
    }()

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom, spacing: 40) {
                Text("Directed Evolution Results")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                HStack(spacing: 8) {
                    Text("114")
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

            Text("Click to select an entry")
                .foregroundColor(.gray)
                .padding(.bottom, 2)

            ScrollView {
                VStack(spacing: 0) {
                    HStack {
                        Text("Variant ID")
                            .frame(maxWidth: .infinity, alignment: .center)
                        Text("Mutant")
                            .frame(maxWidth: .infinity, alignment: .center)
                        Text("Evolution Score")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .font(.headline)
                    .padding(.vertical, 12)
                    .background(Color.blue)
                    .foregroundColor(.white)

                    ForEach(data) { item in
                        NavigationLink(destination: BasicVariantDetailsView()) {
                            HStack {
                                Text(item.variatProtein)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                Text(item.mutant)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                Text(String(format: "%.6f", item.score))
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
    BasicDirectedEvolutionView()
}

struct VariatProteinData: Identifiable {
    let id = UUID()
    let variatProtein: String
    let mutant: String
    let score: Double
}
