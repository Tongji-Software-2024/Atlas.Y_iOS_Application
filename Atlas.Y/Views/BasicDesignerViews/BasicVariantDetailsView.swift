import SwiftUI

struct BasicVariantDetailsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom, spacing: 40) {
                Text("Variant Details")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding(.bottom, 10)

            HStack(spacing: 40) {
                HStack(spacing: 8) {
                    Text("VARIANT PROTEIN:")
                        .foregroundColor(.blue)
                        .bold()
                    Text("VR0001")
                }

                HStack(spacing: 8) {
                    Text("MUTANT:")
                        .foregroundColor(.blue)
                        .bold()
                    Text("D558W")
                }

                HStack(spacing: 8) {
                    Text("EVOLUTION SCORE:")
                        .foregroundColor(.blue)
                        .bold()
                    Text("3.450524")
                }
            }
            .font(.subheadline)

            Divider()
                .frame(height: 1)
                .background(Color.gray.opacity(0.5))
                .padding(.top, 5)
                .padding(.bottom, 20)
        }
        .frame(maxWidth: 1000)
        .padding()
    }
}

#Preview {
    BasicVariantDetailsView()
}
