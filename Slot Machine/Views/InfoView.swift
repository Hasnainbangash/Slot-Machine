//
//  InfoView.swift
//  Slot Machine
//
//  Created by Elexoft on 06/03/2025.
//

import SwiftUI

struct InfoView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LogoView()
            
            Spacer()
            
            Form {
                Section(header: Text("About the application")) {
                    FormRowView(firstItem: "Application", secondItem: "Slot Machine")
                    FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
                    FormRowView(firstItem: "Developer", secondItem: "John / Jane")
                    FormRowView(firstItem: "Designer", secondItem: "Robert Petras")
                    FormRowView(firstItem: "Music", secondItem: "Dan Lebowitz")
                    FormRowView(firstItem: "Webiste", secondItem: "swiftuimasterclass.com")
                    FormRowView(firstItem: "Copyright", secondItem: "© 2020 All rights reserved.")
                    FormRowView(firstItem: "Version", secondItem: "1.0.0")
                } //: SECTION
            } //: FORM
            .font(.system(.body, design: .rounded))
        } //: VSTACK
        .padding(.top, 40)
        .overlay (
            Button(action: {
                // Action
            }) {
                Image(systemName: "xmark.circle")
                    .font(.title)
            }
                .padding(.top, 30)
                .padding(.trailing, 20)
                .accentColor(Color.secondary)
            , alignment: .topTrailing
        )
    }
}

struct FormRowView: View {
    var firstItem: String
    var secondItem: String
    
    var body: some View {
        HStack {
            Text(firstItem).foregroundColor(Color.gray)
            Spacer()
            Text(secondItem)
        } //: HSTACK
    }
}

// MARK: - PREVIEW

#Preview {
    InfoView()
}
