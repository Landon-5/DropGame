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
        
        let node : SKSpriteNode
        node = SKSpriteNode(color: currentColor, size: CGSize(width: width, height: height))
        node.position = location
        
        node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: width, height: height))
        
        addChild(node)
    }
    
    //MARK: -- Other methods
    
    private func assignColorAndBitmask() -> UIColor
    {
        let colors : [UIColor] = [.black, .cyan, .green, .yellow, .red, .orange, .magenta, .brown]
        let randomIndex = Int(arc4random()) % colors.count
        
        return colors[randomIndex]
    }
}
