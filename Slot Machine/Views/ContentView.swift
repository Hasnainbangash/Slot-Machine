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
    
    @State private var highscore: Int = 0
    @State private var coins: Int = 100
    @State private var betAmount: Int = 10
    @State private var reels: Array = [0, 1, 2]
    @State private var showingInfoView: Bool = false
    @State private var isActiveBet10: Bool = true
    @State private var isActiveBet20: Bool = false
    @State private var showingModel: Bool = false
    
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
    func checkWinning() {
        if reels[0] == reels[1] && reels[1] == reels[2] && reels[0] == reels[2] {
            // PLAYER WINS
            playerWins()
            
            // NEW HIGHSCORE
            if coins > highscore {
                newHighScore()
            }
        } else {
            // PLAYER LOSES
            playerloses()
        }
    }
    
    // PLAYER WINS
    func playerWins() {
        coins += betAmount * 10
    }
    
    // NEW HIGHSCORE
    func newHighScore() {
        highscore = coins
        // Saving the high score value in the user defaults
        UserDefaults.standard.set(highscore, forKey: "HighScore")
    }
    
    // PLAYER LOSES
    func playerloses() {
        coins -= betAmount
    }
    
    func activateBet20() {
        betAmount = 20
        isActiveBet20 = true
        isActiveBet10 = false
    }
    
    func activateBet10() {
        betAmount = 10
        isActiveBet10 = true
        isActiveBet20 = false
    }
    
    // GAME IS OVER
    func isGameOver() {
        if coins <= 0 {
            // SHOW MODAL WINDOW
            showingModel = true
        }
    }
    
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
                        
                        Text("\(coins)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    } //: HSTACK
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("\(highscore)")
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
                        
                        // CHECK WINNING
                        self.checkWinning()
                        
                        // GAME IS OVER
                        self.isGameOver()
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
                            self.activateBet20()
                        }) {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet20 ? Color("ColorYellow") : Color.white)
                                .modifier(BetNumberModifier())
                        } //: BUTTON
                        .modifier(BetCapsuleModifier())
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(isActiveBet20 ? 1 : 0)
                            .modifier(CasinoChipsModifier())
                    } //: HSTACK
                    
                    // MARK: - BET 10
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(isActiveBet10 ? 1 : 0)
                            .modifier(CasinoChipsModifier())
                        
                        Button(action: {
                            self.activateBet10()
                        }) {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet10 ? Color("ColorYellow") : Color.white)
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
            .blur(radius: $showingModel.wrappedValue ? 5 : 0, opaque: false)
            
            // MARK: - POPUP
            if $showingModel.wrappedValue {
                ZStack {
                    Color("ColorTransparentBlack").edgesIgnoringSafeArea(.all)
                    
                    // MODAL
                    VStack(spacing: 0) {
                        // TITLE
                        Text("GAME OVER")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color("ColorPink"))
                            .foregroundColor(Color.white)
                        
                        Spacer()
                        
                        // MESSAGE
                        VStack(alignment: .center, spacing: 16) {
                            Image("gfx-seven-reel")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 72)
                            
                            Text("Bad Luck! You lost all of the coins. \nLet's play again!")
                                .font(.system(.body, design: .rounded))
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.gray)
                                .layoutPriority(1)
                            
                            Button(action: {
                                self.showingModel = false
                                self.coins = 100
                            }) {
                                Text("New Game".uppercased())
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.semibold)
                                    .accentColor(Color("ColorPink"))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 128)
                                    .background(
                                        Capsule()
                                            .strokeBorder(lineWidth: 1.75)
                                            .foregroundColor(Color("ColorPink"))
                                    )
                            }
                        } //: VSTACK
                        
                        Spacer()
                    } //: VSTACK
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: Color("ColorTransparentBlack"), radius: 6, x: 0, y: 8)
                } //: ZSTACK
            }
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
