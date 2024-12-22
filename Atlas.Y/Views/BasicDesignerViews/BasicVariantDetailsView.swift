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

            Text("Sequence Comparison")
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.semibold)

            HStack(spacing: 15) {
                VStack(alignment: .center, spacing: 10) {
                    Text("Primary Sequence")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ScrollableTextBox(
                        text: "KKRKKDAEAAAKEAAAKEAAAKMGKKLRPPGTMTISNLLKQRVRYAPYLKKVKEAHELIPLFKNGQYLGWSGFTGVGTPKAVPEALIDHVEKNNLQGKLRFNLFVGASAGPEENRWAEHDMIIKRAPHQVGKPIAKAINQGRIEFFDKHLSMFPQDLTYGFYTRERKDNKILDYTIIEATAIKEDGSIVPGPSVGGSPEFITVSDKVIIEVNTATPSFEGIHDIDMPVNPPFRKPYPYLKVDDKCGVDSIPVDPEKVVAIVESTMRDQVPPNTPSDDMSRAIAGHLVEFFRNEVKHGRLPENLLPLQSGIGNIANAVIEGLAGAQFKHLTVWTEVLQDSFLDLFENGSLDYATATSVRLTEKGFDRAFANWENFKHRLCLRSQVVSNNPEMIRRLGVIAMNTPVEVDIYAHANSTNVNGSRMLNGLGGSADFLRNAKLSIMHAPSARPTKVDPTGISTIVPMASHVDQTEHDLDILVTDQGLADLRGLSPKERAREIINKCAHPDYQALLTDYLDRAEHYAKKHNCLHEPHMLKNAFKFHTNLAEKGTMKVDSWEPVD",
                        height: 400
                    )
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack(alignment: .center, spacing: 10) {
                    Text("Variant Sequence")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ScrollableTextBox(
                        text: "KKRKKDAEAAAKEAAAKEAAAKMGKKLRPPGTMTISNLLKQRVRYAPYLKKVKEAHELIPLFKNGQYLGWSGFTGVGTPKAVPEALIDHVEKNNLQGKLRFNLFVGASAGPEENRWAEHDMIIKRAPHQVGKPIAKAINQGRIEFFDKHLSMFPQDLTYGFYTRERKDNKILDYTIIEATAIKEDGSIVPGPSVGGSPEFITVSDKVIIEVNTATPSFEGIHDIDMPVNPPFRKPYPYLKVDDKCGVDSIPVDPEKVVAIVESTMRDQVPPNTPSDDMSRAIAGHLVEFFRNEVKHGRLPENLLPLQSGIGNIANAVIEGLAGAQFKHLTVWTEVLQDSFLDLFENGSLDYATATSVRLTEKGFDRAFANWENFKHRLCLRSQVVSNNPEMIRRLGVIAMNTPVEVDIYAHANSTNVNGSRMLNGLGGSADFLRNAKLSIMHAPSARPTKVDPTGISTIVPMASHVDQTEHDLDILVTDQGLADLRGLSPKERAREIINKCAHPDYQALLTDYLDRAEHYAKKHNCLHEPHMLKNAFKFHTNLAEKGTMKVDSWEPVW",
                        height: 400
                    )
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            Text("Score")
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.semibold)
                .padding(.top, 24)

            HStack(spacing: 8) {
                Text("Primary Protein Stability Score:")
                    .fontWeight(.semibold)
                Text("2396.42")
            }
            .padding(.top, 8)

            HStack(spacing: 8) {
                Text("Variant Protein Stability Score:")
                    .fontWeight(.semibold)
                Text("2592.41")
            }

            HStack(spacing: 8) {
                Text("Functionality Score:")
                    .fontWeight(.semibold)
                Text("0.770537")
            }
        }
        .frame(maxWidth: 1000)
        .padding()
    }
}

#Preview {
    BasicVariantDetailsView()
}
