import SwiftUI
import AVKit

struct ContentView: View {
    @State var player: AVPlayer!
    @State var isPlaying = false
    @State var icon = "play.circle"

    // https://fmstream.org/index.php?c=CAN
    // https://github.com/junguler/m3u-audiobooks
    
    var body: some View {
            VStack {
                Text("92.7 Rock Sudbury")
                    .font(.title2)
                    .bold()
                Button(action: {
                        playOrPause()
                      }) {
                        Image(systemName: icon)
                          .resizable()
                          .frame(width: 128, height: 128)
                      }
            }
        .onAppear {
            let url = "https://rogers-hls.leanstream.co/rogers/sud927.stream/playlist.m3u8"
            let playerItem = AVPlayerItem(url:URL(string:url)!)
                player = AVPlayer(playerItem:playerItem)
                player.rate = 1.0;
                player.play()
        }
    }
    
    func playOrPause() {
        guard let player = player else { return }
        if ((player.rate != 0) && (player.error == nil)) {
          player.pause()
          isPlaying = false
          icon = "pause.circle"
        } else {
          player.play()
          isPlaying = true
          icon = "play.circle"
        }
      }
}

#Preview {
    ContentView()
}
