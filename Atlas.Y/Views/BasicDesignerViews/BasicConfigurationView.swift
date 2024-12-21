import SwiftUI
import AVKit

struct BasicConfigurationView: View {
    @State private var showInfoAlert = false
    @State private var fastaButtonText = "Upload Fasta File"
    @State private var pdbButtonText = "Upload PDB File"
    @State private var fastaButtonColor = Color.white
    @State private var pdbButtonColor = Color.white
    @State private var selectedButton: String? = nil
    @State private var player: AVPlayer? = nil
    @State private var isPlayingBasicVideo = false

    let videoMapping: [String: (index: Int, initial: String, basic: String)] = [
        "NLS": (0, "NLS_Initial", "NLS_Basic"),
        "NES": (1, "NES_Initial", "NES_Basic"),
        "SP": (2, "SP_Initial", "SP_Basic"),
        "SP_TM": (3, "SP_TM_Initial", "SP_TM_Basic"),
        "SP_GPI": (4, "SP_GPI_Initial", "SP_GPI_Basic"),
        "GPI": (5, "GPI_Initial", "GPI_Basic"),
        "TM": (6, "TM_Initial", "TM_Basic"),
        "PTS": (7, "PTS_Initial", "PTS_Basic"),
        "MT": (8, "MT_Initial", "MT_Basic"),
        "LYS": (9, "LYS_Initial", "LYS_Basic")
    ]

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
                if let player = player {
                    VideoPlayer(player: player)
                        .onAppear {
                            player.seek(to: .zero)
                            player.play()
                        }
                        .onDisappear {
                            player.pause()
                        }
                        .frame(width: 600, height: 300)
                } else {
                    Image("DefaultPositioningDemand")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 600, height: 300)
                }

                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(videoMapping.sorted(by: { $0.value.index < $1.value.index }), id: \.key) { buttonLabel, _ in
                            Button(buttonLabel) {
                                if (buttonLabel != selectedButton) {
                                    handleButtonPress(buttonLabel)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(selectedButton == buttonLabel ? Color.blue : Color.white)
                            .foregroundColor(selectedButton == buttonLabel ? .white : .blue)
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 2))
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 1)
                    .padding(.vertical, 4)
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

    func handleButtonPress(_ buttonLabel: String) {
        selectedButton = buttonLabel
        isPlayingBasicVideo = false
        if let videoPair = videoMapping[buttonLabel] {
            let initialURL = Bundle.main.url(forResource: videoPair.initial, withExtension: "mp4")
            let basicURL = Bundle.main.url(forResource: videoPair.basic, withExtension: "mp4")
            if let initialURL = initialURL, let basicURL = basicURL {
                player?.pause()
                NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: nil)
                let initialPlayerItem = AVPlayerItem(url: initialURL)
                player = AVPlayer(playerItem: initialPlayerItem)
                player?.actionAtItemEnd = .none
                NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: initialPlayerItem, queue: .main) { _ in
                    if self.selectedButton == buttonLabel {
                        let basicPlayerItem = AVPlayerItem(url: basicURL)
                        self.player?.replaceCurrentItem(with: basicPlayerItem)
                        self.player?.actionAtItemEnd = .none
                        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: basicPlayerItem, queue: .main) { _ in
                            if self.selectedButton == buttonLabel {
                                self.player?.seek(to: .zero)
                                self.player?.play()
                            }
                        }

                        self.player?.play()
                    }
                }
                player?.play()
            }
        }
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
