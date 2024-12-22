import SwiftUI

struct BasicHomeView: View {
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Image("DefaultLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                Image("BasicVersionFrame")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
            }
            .padding(.bottom, 20)

            Image("TitlePrompt")
                .resizable()
                .scaledToFit()
                .frame(height: 30)
                .padding(.bottom, 20)

            NavigationLink(destination: BasicConfigurationView()) {
                HStack {
                    Text("START")
                        .font(.system(size: 24, weight: .bold))
                    Image(systemName: "arrow.right")
                        .font(.system(size: 24, weight: .bold))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding(.bottom, 10)

            BasicTableView()
        }
        .frame(maxWidth: 1000)
    }
}

struct BasicTableView: View {
    let data = [
        ["21 Dec. 2024 09:50", "KQC45421.fasta", "KQC45421.pdb", "MT"],
        ["21 Dec. 2024 10:32", "NP011802.fasta", "NP011802.pdb", "SP"],
        ["21 Dec. 2024 10:54", "BAA01255.fasta", "BAA01255.pdb", "GPI"],
        ["22 Dec. 2024 13:29", "ADS83421.fasta", "ADS83421.pdb", "PTS"],
        ["22 Dec. 2024 15:08", "FIB485347.fasta", "FIB485347.pdb", "NLS"]
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image(systemName: "clock")
                        .opacity(0)
                    Text("TIME")
                        .font(.system(size: 14, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                    Text("SEQUENCE / FASTA")
                        .font(.system(size: 14, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                    Text("PDB")
                        .font(.system(size: 14, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                    Text("SUBCELLULAR POSITION")
                        .font(.system(size: 14, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                }
                .padding(.bottom, 5)

                ForEach(data, id: \.self) { row in
                    HStack {
                        Spacer()
                        Image(systemName: "clock")
                        Text(row[0])
                            .frame(maxWidth: .infinity, alignment: .center)
                        Spacer()
                        Text(row[1])
                            .frame(maxWidth: .infinity, alignment: .center)
                        Spacer()
                        Text(row[2])
                            .frame(maxWidth: .infinity, alignment: .center)
                        Spacer()
                        Text(row[3])
                            .frame(maxWidth: .infinity, alignment: .center)
                        Spacer()
                    }
                    .padding(.vertical, 5)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
        }
        .frame(height: 143)
    }
}

#Preview {
    BasicHomeView()
}
