import SwiftUI
import AVKit

struct CookView: View {
    @State private var sequence: [Int] = []
    @State private var currentIndex: Int = 0
    @State private var score : Int = 0
    @State private var stepNum : Int = 0
    
    private var steps : [String] = [
        "Sear the beef",
        "Cook the \nmushrooms",
        "Assembly the \nBeef Wellington",
        "Bake the \nBeef Wellington"
    ]
    
    private var stepVideo : [String] = [
        "BeefVid",
        "MushroomVid",
        "397.0-443.0",
        "747.0-769.0"
    ]
    
    @State private var isFinished = false
    @State private var player = AVPlayer()
    
    var body: some View {
        if isFinished {
            finishView
                .applyBrandBackground()
        } else {
            gameView
                .applyBrandBackground()
        }
    }

    private var displaySequenceView: some View {
        GeometryReader { geometry in
            ZStack {
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(sequence.indices, id: \.self) { idx in
                                Image(systemName: imageName(for: sequence[idx]))
                                    .bold()
                                    .frame(width: 100, height: 100)
                                    .background(imageColor(for: sequence[idx]))
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                                    .font(.system(size: 30))
                                    .frame(width: 60, height: 60)
                                    .id(idx)
                                    .foregroundStyle(imageColor(for: sequence[idx]))
                                    .opacity(
                                        idx == currentIndex ? 1.0 : (idx < currentIndex ? 0.4 : 1.0)
                                    )
                                    .clipShape(Circle())
                            }
                        }
                        // Dynamic math using actual screen midpoint minus half of your 75x75 target box width
                        .padding(.horizontal, (geometry.size.width / 2))
                    }
                    .onChange(of: currentIndex) { _, newValue in
                        withAnimation(.easeInOut) {
                            proxy.scrollTo(newValue, anchor: .center)
                        }
                    }
                    .onAppear {
                        DispatchQueue.main.async {
                            proxy.scrollTo(currentIndex, anchor: .center)
                        }
                    }
                }
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(.black, lineWidth: 4)
                    .frame(width: 75, height: 75)
            }
        }
    }

    private var finishView : some View {
        VStack(spacing: 25) {
            Spacer()

            Image(systemName: "trophy.fill")
                .font(.system(size: 100))
                .foregroundColor(.yellow)

            Text("Dish Complete!")
                .font(.largeTitle)
                .bold()

            Text("You successfully cooked the Beef Wellington.")
                .font(.title3)
                .multilineTextAlignment(.center)

            Text("Final Score: \(score)")
                .font(.title)

            Button("Next") {
                isFinished = false
            }
            .font(.title2)
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            Spacer()
        }
        .padding()
    }
    
    private var gameView: some View {
        VStack(spacing: 3) {
            Spacer()
            if !sequence.isEmpty {
                displaySequenceView
                    .frame(height: 80)
                    .offset(y: 150)
            } else {
                Text("Loading sequence...")
                    .font(.headline)
            }
            Text("Current step: \(steps[stepNum])")
                .font(.title)
                .offset(y: 150)
                .fixedSize(horizontal: false, vertical: true)
                .bold()
                .multilineTextAlignment(.center)
            Text("Current score: \(score)")
                .font(.title)
                .offset(y: 150)
            
            VideoPlayer(player: player)
                .frame(height: 180)
                .padding(.horizontal)
                .offset(y: 180)
            ZStack {
                Image("CookPan")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 750, height: 750)
                    .offset(x: 30, y: 110)
                ZStack {
                    HStack(spacing: 125) {
                        Button {
                            checkInput(4)
                        } label: {
                            Image(systemName: imageName(for: 4))
                                .font(.system(size: 50))
                                .bold()
                                .frame(width: 100, height: 100)
                                .background(imageColor(for: 4))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                        Button {
                            checkInput(2)
                        } label: {
                            Image(systemName: imageName(for: 2))
                                .font(.system(size: 50))
                                .bold()
                                .frame(width: 100, height: 100)
                                .background(imageColor(for: 2))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    }
                    VStack(spacing: 125) {
                        Button {
                            checkInput(1)
                        } label: {
                            Image(systemName: imageName(for: 1))
                                .font(.system(size: 50))
                                .bold()
                                .frame(width: 100, height: 100)
                                .background(imageColor(for: 1))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                        Button {
                            checkInput(3)
                        } label: {
                            Image(systemName: imageName(for: 3))
                                .font(.system(size: 50))
                                .bold()
                                .frame(width: 100, height: 100)
                                .background(imageColor(for: 3))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    }
                }
                .offset(y: 30)
            }
            .padding()
            .onAppear {
                initializePlayer()
                if sequence.isEmpty {
                    startNewGame()
                }
            }
        }
    }
    
    private func initializePlayer() {
        guard stepNum < stepVideo.count else { return }
        let currentVideoName = stepVideo[stepNum]
        
        if let videoURL = Bundle.main.url(forResource: currentVideoName, withExtension: "mp4") {
            player = AVPlayer(url: videoURL)
            player.play()
        } else {
            print("Video file '\(currentVideoName).mp4' not found in bundle.")
        }
    }
    
    private func imageName(for value: Int) -> String {
        switch value {
        case 1: return "arrow.up"
        case 2: return "arrow.right"
        case 3: return "arrow.down"
        case 4: return "arrow.left"
        default: return "questionmark"
        }
    }

    private func imageColor(for value: Int) -> Color {
        switch value {
        case 1: return .red
        case 2: return .blue
        case 3: return .yellow
        case 4: return .green
        default: return .gray
        }
    }
    
    private func checkInput(_ pressedNumber: Int) {
        guard currentIndex < sequence.count else { return }

        if pressedNumber == sequence[currentIndex] {
            currentIndex += 1
            score += 10
            
            if currentIndex == sequence.count {
                print("Sequence complete! Great job!")

                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    if stepNum >= steps.count - 1 {
                        isFinished = true
                    } else {
                        stepNum += 1
                        initializePlayer()
                        startNewGame()
                    }
                }
            }
        } else {
            score -= 5
        }
    }

    private func startNewGame() {
        sequence = randomSequence(amt: 10)
        currentIndex = 0
        if stepNum == 0 { score = 0 }
    }

    private func randomSequence(amt: Int) -> [Int] {
        var sequence: [Int] = []
        for _ in 0..<amt {
            sequence.append(Int.random(in: 1...4))
        }
        return sequence
    }
}

#Preview {
    CookView()
}
