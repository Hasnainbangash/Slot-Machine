//
//  RealView.swift
//  Slot Machine
//
//  Created by Elexoft on 05/03/2025.
//

import SwiftUI

struct ReelView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    
    var body: some View {
        Image("gfx-reel")
            .resizable()
            .modifier(ImageModifier())
    }
}

// MARK: - PREVIEW

#Preview {
    ReelView()
        .previewLayout(.fixed(width: 220, height: 220))
}
