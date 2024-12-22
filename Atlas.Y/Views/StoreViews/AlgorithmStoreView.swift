import SwiftUI

struct AlgorithmStoreView: View {
    @State private var selectedIndex = 0

    let cards = [
        AlgorithmCard(
            title: "Site-Specific CAD Scoring System",
            description: "The CAD scoring algorithm provides a quantitative evaluation of the structural similarity between a protein's active site and a reference model. This algorithm assesses the accuracy and physical realism of a protein model by calculating the differences in residue-residue contact areas. By selecting specific sites in the protein, users can obtain CAD scores for these locations, enabling precise evaluation of the structural fidelity and potential functionality of the site.",
            timesLeft: 3,
            price: 10
        ),
        AlgorithmCard(
            title: "Temporal Dynamic Localization Design System",
            description: "The Temporal Dynamic Localization Design System utilizes light-sensitive components and localization tags to achieve time-controlled regulation of protein localization. This system can precisely manipulate the positioning of proteins within cells or other environments, aiding in the study of protein behavior, interactions, and functions over time.",
            timesLeft: 3,
            price: 15
        ),
        AlgorithmCard(
            title: "Optimized Protein Evolution Localization System",
            description: "The Optimized Protein Evolution Localization System uses computational algorithms to assist in protein evolution. Based on the user's selection of a specific organelle, the system evolves the user's fusion protein to be suitable for localization within that organelle. This system is a powerful tool in the field of protein engineering, aiding in the design of proteins with enhanced localization capabilities and functionality tailored to specific cellular environments.",
            timesLeft: 3,
            price: 20
        ),
        AlgorithmCard(
            title: "Protein Localization Prediction System",
            description: "The Protein Localization Prediction System analyzes protein sequences and structural features using advanced algorithms to predict protein localization within cells. This system helps optimize research workflows, supports the design of novel proteins, enhances experimental efficiency, and improves protein design for specific cellular applications.",
            timesLeft: 3,
            price: 10
        )
    ]

    var body: some View {
        VStack {
            Text("Algorithm Store")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
                .padding(.bottom, 15)
            Text("Current Subscription: Free")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
                .padding(.bottom, 30)
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 20) {
                ForEach(cards.indices, id: \.self) { index in
                    AlgorithmCardView(card: cards[index])
                }
            }
        }
        .frame(maxWidth: 1000)
    }
}

struct AlgorithmCard {
    let title: String
    let description: String
    let timesLeft: Int
    let price: Int
}

struct AlgorithmCardView: View {
    let card: AlgorithmCard

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(card.title)
                .fontWeight(.bold)
            Text(card.description)
                .font(.subheadline)
                .foregroundColor(Color.gray)
            HStack {
                Text("\(card.timesLeft) times left")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                Spacer()
                Text("\(card.price)$")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
                Button("BUY") {}
                .padding(.vertical, 4)
                .padding(.horizontal, 24)
                .fontWeight(.bold)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 3)
    }
}

#Preview {
    AlgorithmStoreView()
}
