//
//  ContentView.swift
//  Slot Machine
//
//  Created by Elexoft on 05/03/2025.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]
    
    @State private var reels: Array = [0, 1, 2]
    @State private var showingInfoView: Bool = false
    
    // MARK: - FUNCTIONS
    
    // SPIN THE REELS
    func spinReels() {
        // Manual way to generate random numbers for each index
        // reels[0] = Int.random(in: 0...symbols.count - 1)
        // reels[1] = Int.random(in: 0...symbols.count - 1)
        // reels[2] = Int.random(in: 0...symbols.count - 1)
        
        // Simple way to generate random numbers for each index
        reels = reels.map { _ in
            Int.random(in: 0..<symbols.count)
        }
    }
    
    // CHECK THE WINNING
    // PLAYER WINS
    // NEW HIGHSCORE
    // PLAYER LOSES
    // GAME IS OVER
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            // MARK: - BACKGROUND
            LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            // MARK: - INTERFACE
            VStack(alignment: .center, spacing: 5) {
                // MARK: - HEADER
                
                LogoView()
                
                Spacer()
                
                // MARK: - SCORE
                HStack {
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        
                        Text("100")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    } //: HSTACK
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("200")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        
                        Text("High\nScore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                    } //: HSTACK
                    .modifier(ScoreContainerModifier())
                } //: HSTACK
                
                // MARK: - SLOT MACHINE
                
                VStack(alignment: .center, spacing: 0) {
                    
                    // MARK: - REEL #1
                    ZStack {
                        ReelView()
                        Image(symbols[reels[0]])
                            .resizable()
                            .modifier(ImageModifier())
                    } //: ZSATCK
                    
                    HStack(alignment: .center, spacing: 0) {
                        // MARK: - REEL #2
                        ZStack {
                            ReelView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .modifier(ImageModifier())
                        } //: ZSATCK
                        
                        Spacer()
                        
                        // MARK: - REEL #3
                        ZStack {
                            ReelView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .modifier(ImageModifier())
                        } //: ZSATCK
                    } //: HSTACK
                    
                    // MARK: - SPIN BUTTON
                    Button(action: {
                        // SPIN THE REELS
                        self.spinReels()
                    }) {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                } // Slot Machine
                .layoutPriority(2)
                
                // MARK: - FOOTER
                
                Spacer()
                
                HStack {
                    // MARK: - BET 20
                    HStack(alignment: .center, spacing: 10) {
                        Button(action: {
                            print("Bet 20 coins")
                        }) {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                                .modifier(BetNumberModifier())
                        } //: BUTTON
                        .modifier(BetCapsuleModifier())
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(0)
                            .modifier(CasinoChipsModifier())
                    } //: HSTACK
                    
                    // MARK: - BET 10
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(1)
                            .modifier(CasinoChipsModifier())
                        
                        Button(action: {
                            print("Bet 10 coins")
                        }) {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(Color.yellow)
                                .modifier(BetNumberModifier())
                        } //: BUTTON
                        .modifier(BetCapsuleModifier())
                    } //: HSTACK
                } //: HSTACK
            } //: VSTACK
            // MARK: - BUTTONS
            .overlay(
                // RESET
                Button(action: {
                    print("Reset the game")
                }) {
                    Image(systemName: "arrow.2.circlepath.circle")
                } //: BUTTON
                    .modifier(ButtonModifier())
                , alignment: .topLeading
            )
            .overlay(
                // INFO
                Button(action: {
                    self.showingInfoView = true
                }) {
                    Image(systemName: "info.circle")
                } //: BUTTON
                    .modifier(ButtonModifier())
                , alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 720)
            
            // MARK: - POPUP
        } //: ZSTACK
        .sheet(isPresented: $showingInfoView) {
            InfoView()
        }
    }
}

// MARK: - PREVIEW

#Preview {
    ContentView()
}
