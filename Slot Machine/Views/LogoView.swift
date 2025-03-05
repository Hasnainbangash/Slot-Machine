//
//  LogoView.swift
//  Slot Machine
//
//  Created by Elexoft on 05/03/2025.
//

import SwiftUI

struct LogoView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    
    var body: some View {
        Image("gfx-slot-machine")
            .resizable()
            .scaledToFit()
            .frame(minWidth: 256, idealWidth: 300, maxWidth: 320, minHeight: 112, idealHeight: 130, maxHeight: 140, alignment: .center)
            .padding(.horizontal)
            .layoutPriority(1)
            .shadow(color: Color("ColorTransparentBlack"), radius: 0, x: 0, y: 6)
    }
}

// MARK: - PREVIEW

#Preview {
    LogoView()
}
