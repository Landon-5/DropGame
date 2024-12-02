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
    @State private var canShowDocuments : Bool = false
    
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
                SpriteView(scene: simpleGameScene)
                    .frame(width: width, height: height)
                    .edgesIgnoringSafeArea(.all)
    }
}

#Preview ("View of Drop Game")
{
    DropGameView()
}
