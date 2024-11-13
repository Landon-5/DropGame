//
//  GameScene.swift
//  DropGame
//
//  Created by Howard, Landon on 11/11/24.
//

import Foundation
import SpriteKit

class GameScene : SKScene
{
    //MARK: -- Required (Overriden) Methods
    
    override func didMove(to view : SKView) -> Void
    {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
}
