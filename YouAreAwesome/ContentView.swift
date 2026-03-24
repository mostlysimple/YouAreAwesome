//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Johnny Hubbard on 3/15/26.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var soundName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    
    let numberOfImages = 10
    let numberOfSounds = 6

    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 120)
                .animation(.easeInOut(duration: 0.15), value: message)

            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Show Message") {
                let messages = ["You are Awesome!",
                                "You are Great!",
                                "You are Amazing!",
                                "You are Fantastic!",
                                "You are Incredible!",
                                "You Make Me Smile!",
                                "When the Genius Bar Needs Help, They Call You!"]

                var messageNumber: Int
                repeat {
                    messageNumber = Int.random(in: 0...(messages.count-1))
                } while messageNumber == lastMessageNumber
                message = messages[messageNumber]
                lastMessageNumber = messageNumber
                

                var imageNumber: Int
                repeat {
                    imageNumber = Int.random(in: 0...(numberOfImages-1))
                } while imageNumber == lastImageNumber
                
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
                var soundNumber: Int
                repeat {
                    soundNumber = Int.random(in: 0...(numberOfSounds-1))
                } while soundNumber == lastSoundNumber
                
                soundName = "sound\(soundNumber)"
                lastSoundNumber = soundNumber
                
//                let soundName = "sound0"
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("😡 Could not read file named \(soundName).")
                    return
                }
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch {
                    
                    print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
                }
                
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
