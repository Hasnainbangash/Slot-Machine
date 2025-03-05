//
//  ContentView.swift
//  Slot Machine
//
//  Created by Elexoft on 05/03/2025.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
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
                // MARK: - FOOTER
                
                Spacer()
            } //: VSTACK
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
                    print("Info View")
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
    }
}

// MARK: - PREVIEW

#Preview {
    ContentView()
}
