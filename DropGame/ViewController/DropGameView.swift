//
//  DropGameView.swift
//  DropGame
//
//  Created by Howard, Landon on 11/11/24.
//

import SwiftUI
import SpriteKit

struct DropGameView: View 
{
    private let width : CGFloat = 300
    private let height : CGFloat = 500
    
    var body: some View
    {
        VStack 
        {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview ("View of Drop Game")
{
    DropGameView()
}
