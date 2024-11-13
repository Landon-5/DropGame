//
//  GameScene.swift
//  DropGame
//
//  Created by Howard, Landon on 11/11/24.
//

import Foundation
import SpriteKit

class GameScene : SKScene, SKPhysicsContactDelegate
{
    //MARK: -- Data Members
    
    private var colorMask : Int = 0b0000
    
    //MARK: -- Required (Overriden) Methods
    
    override func didMove(to view : SKView) -> Void
    {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event : UIEvent?) -> Void
    {
        guard let touch = touches.first
        else { return }
        
        let currentColor = assignColorAndBitmask()
        let width = Int(arc4random() % 50)
        let height = Int(arc4random() % 50)
        let location = touch.location(in: self)
        
        let node : SKSpriteNode
        node = SKSpriteNode(color: currentColor, size: CGSize(width: width, height: height))
        node.position = location
        
        node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: width, height: height))
        node.physicsBody?.contactTestBitMask = UInt32(colorMask)
        
        addChild(node)
    }
    
    //MARK: -- Other methods
    
    private func assignColorAndBitmask() -> UIColor
    {
        let colors : [UIColor] = [.black, .darkGray, .red, .systemPink, .blue, .systemIndigo, .purple]
        let randomIndex = Int(arc4random()) % colors.count
        
        colorMask = randomIndex + 1
        
        return colors[randomIndex]
    }
    
    //MARK: -- Collision Handling Methods
    
    private func annihilate(deadNode: SKNode) -> Void
    {
        
    }
}
