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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event : UIEvent?) -> Void
    {
        guard let touch = touches.first
        else { return }
        
        let currentColor = UIColor.cyan
        let width = Int(arc4random() % 50)
        let height = Int(arc4random() % 50)
        let location = touch.location(in: self)
    }
}
