import SwiftUI

struct MembershipPlanView: View {
    @State private var selectedPlan: Card? = nil

    let cards: [Card] = [
        Card(
            title: "Free",
            description: [
                "Basic protein localization design",
                "Overall functionality scoring",
                "Overall stability scoring"
            ],
            prices: []
        ),
        Card(
            title: "Professional",
            description: [
                "Includes all Free Version features",
                NestedDescription(
                    main: "Access to all algorithms in the algorithm store",
                    sub: [
                        "Specific site functionality scoring",
                        "Protein localization prediction system",
                        "Localization-optimized protein evolution system",
                        "Time-dynamic localization design system"
                    ]
                )
            ],
            prices: [
                Price(amount: "30$", duration: "1 month"),
                Price(amount: "160$", duration: "half year"),
                Price(amount: "300$", duration: "1 year")
            ]
        ),
        Card(
            title: "Company",
            description: [
                "Includes all Professional Version features",
                NestedDescription(
                    main: "Exclusive enterprise services and functions",
                    sub: [
                        "Custom Development",
                        "Team Management",
                        "Enterprise-level Data Security",
                        "Sustainability Reports"
                    ]
                )
            ],
            prices: [
                Price(amount: "100$", duration: "1 month"),
                Price(amount: "550$", duration: "half year"),
                Price(amount: "1000$", duration: "1 year")
            ]
        )
    ]

    var body: some View {
        VStack {
            Text("Membership Plan")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
                .padding(.bottom, 15)
            Text("Current Subscription: Free")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
                .padding(.bottom, 30)
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(cards.indices, id: \.self) { index in
                    CardView(card: cards[index])
                }
            }
        }
        .frame(maxWidth: 1000)
    }
}

struct Card: Identifiable {
    let id = UUID()
    let title: String
    let description: [Any]
    let prices: [Price]
}

struct NestedDescription {
    let main: String
    let sub: [String]
}

struct Price {
    let amount: String
    let duration: String
}

struct CardView: View {
    let card: Card

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(card.title)
                .font(.system(size: 24, weight: .bold))
                .padding(.bottom, 10)
            VStack(alignment: .leading, spacing: 5) {
                ForEach(card.description.indices, id: \.self) { index in
                    if let text = card.description[index] as? String {
                        Text("• \(text)")
                            .foregroundColor(.gray)
                    } else if let nested = card.description[index] as? NestedDescription {
                        Text("• \(nested.main)")
                            .foregroundColor(.gray)
                        VStack(alignment: .leading) {
                            ForEach(nested.sub, id: \.self) { subItem in
                                Text("  • \(subItem)")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            Spacer()
            if card.prices.isEmpty {
                Button("Your current subscription") {}
                .buttonStyle(DisabledButtonStyle())
            } else {
                Button("Subscribe") {}
                .buttonStyle(PrimaryButtonStyle())
            }
        }
        .padding(24)
        .frame(height: 500)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 3)
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

struct DisabledButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.3))
            .foregroundColor(.gray)
            .cornerRadius(8)
    }
}

#Preview {
    MembershipPlanView()
}
