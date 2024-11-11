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
    
    private var simpleGameScene : GameScene
    {
        let scene = GameScene()
        scene.size = CGSize(width: width, height: height)
        scene.scaleMode = .fill
        return scene
    }
    
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
