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
                Text("Hello, World!")
                
                // MARK: - HEADER
                // MARK: - SCORE
                // MARK: - SLOT MACHINE
                // MARK: - FOOTER
            } //: VSTACK
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
