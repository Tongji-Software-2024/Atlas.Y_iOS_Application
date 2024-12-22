import SwiftUI

struct BasicStabilityEvaluationView: View {
    @State private var data: [StabilityData] = [
        StabilityData(item: "Total Score", score: "2396.42", explanation: "Overall stability score"),
        StabilityData(item: "fa_atr", score: "-3337.41", explanation: "Favorable atomic attraction"),
        StabilityData(item: "fa_rep", score: "3215.46", explanation: "Unfavorable atomic repulsion"),
        StabilityData(item: "fa_sol", score: "2125.75", explanation: "Solvation energy"),
        StabilityData(item: "fa_intra_rep", score: "5.27", explanation: "Intra-residue repulsion"),
        StabilityData(item: "fa_intra_sol_xover4", score: "100.99", explanation: "Intra-residue solvation energy"),
        StabilityData(item: "lk_ball_wtd", score: "-64.03", explanation: "Weighted Lennard-Jones potential"),
        StabilityData(item: "fa_elec", score: "-809.04", explanation: "Electrostatic interactions"),
        StabilityData(item: "pro_close", score: "157.61", explanation: "Proline closure energy"),
        StabilityData(item: "hbond_sr_bb", score: "-157.53", explanation: "Short-range backbone-backbone hydrogen bonding"),
        StabilityData(item: "hbond_lr_bb", score: "-101.29", explanation: "Long-range backbone-backbone hydrogen bonding")
    ]

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom, spacing: 40) {
                Text("Stability Evaluation")
                    .font(.largeTitle)
                    .fontWeight(.bold)
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

            VStack(spacing: 0) {
                HStack {
                    Text("Item")
                        .frame(maxWidth: 300, alignment: .center)
                    Text("Score Value")
                        .frame(maxWidth: 160, alignment: .center)
                    Text("Explanation")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 50)
                }
                .font(.headline)
                .padding(.vertical, 12)
                .background(Color.blue)
                .foregroundColor(.white)

                ForEach(data) { item in
                    HStack {
                        Text(item.item)
                            .frame(maxWidth: 300, alignment: .center)
                        Text(item.score)
                            .frame(maxWidth: 160, alignment: .center)
                        Text(item.explanation)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.gray)
                            .padding(.leading, 50)
                    }
                    .padding(.vertical, 12)
                    .background(Color.white)
                    .border(Color.blue, width: 0.5)
                }
            }
        }
        .frame(maxWidth: 1000)
        .padding()
    }
}

#Preview {
    BasicStabilityEvaluationView()
}

struct StabilityData: Identifiable {
    let id = UUID()
    let item: String
    let score: String
    let explanation: String
}
