//
//  ContentView.swift
//  memoryApp
//
//  Created by Alejandro Urzola on 31/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["❤️", "👀", "👍🏼", "🙈", "🎾", "😂", "🔥", "💦"]
    
    var body: some View {
        VStack {
            Text("Memorize App")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(emojis[0..<emojis.count], id: \.self) {emoji in
                        CardView(isFaceUp: false, icon: emoji)
                    }
                }
            }
            Spacer(minLength: 10)
            HStack(spacing: 60) {
                levelSelector(level: "low", emojis: emojis).onTapGesture {
                    emojis = ["❤️", "👀", "👍🏼", "🙈", "🎾", "😂", "🔥", "💦"].shuffled().suffix(Int.random(in: 4...8))
                }
                levelSelector(level: "medium",emojis: emojis).onTapGesture {
                    emojis = ["🐗", "🦐", "🦩", "🐁", "🐤", "🦃", "🦜", "🦔", "🦦", "🦇"].shuffled().suffix(Int.random(in: 4...10))
                }
                levelSelector(level: "high", emojis: emojis).onTapGesture {
                    emojis = ["🕐", "🕧", "🕛", "🕓", "🕢", "🕚", "🕞", "🕘", "🕜", "🕖", "🕑", "🕥"].shuffled().suffix(Int.random(in: 4...12))
                }
            }
            .foregroundColor(.blue)
        }
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp: Bool
    var icon: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 15)
            if (isFaceUp) {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 1)
                Text(icon).font(.largeTitle).padding()
            } else {
                ZStack {
                    shape.fill(.teal.opacity(0.5))
                    Image(systemName: "questionmark.diamond")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()
                }
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        .foregroundStyle(Gradient(colors: [.red, .blue]))
        .aspectRatio(2/3, contentMode: .fit)
    }
}

struct levelSelector: View {
    let level: String
    @State var emojis: [String]
    var body: some View {
        VStack {
            Image(systemName: "dial.\(level)")
            Text(level)
                .font(.callout)
        }.font(.largeTitle)
    }
	

}















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
        .preferredColorScheme(.light)
    }
}

