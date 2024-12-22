import SwiftUI

struct FAQsView: View {
    @State private var currentFAQIndex: Int = 0

    let faqs: [FAQSectionModel] = [
        FAQSectionModel(
            question: "Q : How to select the appropriate signal peptide or linker peptide?",
            answer: "A : You can reset your password in the account sign-in page. When you reset your password, instructions are sent to the email address associated with your Atlas.Y Web Services account. You can follow the instructions in the email to reset your password.",
            points: []
        ),
        FAQSectionModel(
            question: "Q : What is the difference in the calculations of CAD A-A score and CAD A-S score in the Site-Specific CAD Scoring System?",
            answer: "A : Understanding the difference in calculations between CAD A-A score and CAD A-S score in the CAD scoring system is crucial for assessing the preservation of fusion protein functionality. Here are the key points to help you grasp this distinction:",
            points: [
                "CAD A-A score: This score calculates the contact area difference between the designated central residue and all surrounding atoms. This calculation method provides a comprehensive perspective, showcasing the interactions of the central residue and its environmental changes.",
                "CAD A-S score: This score, on the other hand, calculates the contact area difference between the central residue and the side chains of nearby residues, focusing on critical side chain interactions. This calculation method highlights the importance of side chains for protein function, especially near active sites."
            ]
        ),
        FAQSectionModel(
            question: "Q : How to interpret the table shown in the sequence optimization function page?",
            answer: "A : In the Sequence Optimization function page, the information displayed in the table can be understood as follows:",
            points: [
                "First Column: This column shows the ID of the mutant protein, serving as a unique identifier to distinguish between different mutants.",
                "Second Column (Mutant): This column indicates the mutation information in the format 'Original Amino Acid→Position→Mutated Amino Acid' (for example, 'A23G'), allowing you to quickly identify specific mutations.",
                "Third Column (Evolution Score): This score represents the level of optimization of the mutant sequence. If you have selected optimization for localization efficiency, a higher score indicates that the protein has a greater localization efficiency after directed evolution; if you have chosen fitness optimization, a higher score means that the protein is more stable in the corresponding organelle following directed evolution."
            ]
        ),
        FAQSectionModel(
            question: "Q : What experimental organisms does Atlas.Y support?",
            answer: "A : Currently, Atlas.Y primarily focuses on the subcellular localization systems of yeast, providing users with robust tools for the design and validation of protein targeting and localization within this model organism. However, we are actively working to expand our support to include additional species. Future iterations of Atlas.Y will consider the integration of mammalian cells, plant cells, and other experimental organisms to cater to a broader scientific community. Our goal is to establish Atlas.Y as a versatile and powerful tool for protein localization research, regardless of the experimental systems employed by users. By accommodating a diverse range of organisms, we aim to enhance the utility and applicability of Atlas.Y in various biological research contexts, ultimately facilitating advances in the understanding of protein dynamics across different cellular environments.",
            points: []
        ),
        FAQSectionModel(
            question: "Q : What is the potential application of Atlas.Y in industrial and research settings?",
            answer: "A : Atlas.Y possesses significant application value not only in fundamental research, aiding scientists in elucidating the mechanisms of protein subcellular localization, but also in various fields such as biomanufacturing, drug delivery, and disease treatment. For instance, researchers can leverage Atlas.Y to target proteins with specific functions to cellular organelles such as mitochondria or the endoplasmic reticulum, thereby optimizing metabolic or synthetic pathways within cells. Through precise control of protein localization, Atlas.Y facilitates the creation of \"cell factories\" that can conduct multiple distinct biological processes simultaneously across different subcellular regions. This capability substantially enhances the efficiency of biomanufacturing processes, paving the way for innovative approaches to produce valuable bioproducts and therapeutics. As such, Atlas.Y stands as a transformative tool in both basic scientific research and applied industrial biotechnology, promising to advance our understanding of cellular dynamics and improve the effectiveness of biotechnological applications.",
            points: []
        )
    ]

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                FAQSection(
                    question: faqs[currentFAQIndex].question,
                    answer: faqs[currentFAQIndex].answer,
                    points: faqs[currentFAQIndex].points
                )
            }
            .padding(.horizontal, 30)
            .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            HStack(spacing: 20) {
                Button(action: {
                    if currentFAQIndex > 0 {
                        currentFAQIndex -= 1
                    }
                }) {
                    Text("Previous")
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(currentFAQIndex > 0 ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(currentFAQIndex == 0)

                Button(action: {
                    if currentFAQIndex < faqs.count - 1 {
                        currentFAQIndex += 1
                    }
                }) {
                    Text("Next")
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(currentFAQIndex < faqs.count - 1 ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(currentFAQIndex == faqs.count - 1)
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 10)
        }
        .frame(maxWidth: 1000)
        .padding()
    }
}

struct FAQSectionModel {
    let question: String
    let answer: String
    let points: [String]?
}

struct FAQSection: View {
    var question: String
    var answer: String
    var points: [String]? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(question)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color.black)
            Text(answer)
                .font(.system(size: 16))
                .foregroundColor(Color.black)
                .lineSpacing(5)
            if let points = points {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(points, id: \.self) { point in
                        HStack(alignment: .top) {
                            Text("•")
                                .font(.system(size: 16))
                                .foregroundColor(Color.black)
                            Text(point)
                                .font(.system(size: 16))
                                .foregroundColor(Color.black)
                        }
                    }
                }
                .padding(.leading, 10)
            }
        }
    }
}

#Preview {
    FAQsView()
}
