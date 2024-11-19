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
    
    private var score : Double = -0.0
    {
        didSet
        {
            scoreNode.text = "Score: \(Int((score)))"
        }
    }
    
    private let scoreNode : SKLabelNode = SKLabelNode(fontNamed: "Copperplate-Bold")
    
    //MARK: -- Required (Overriden) Methods
    
    
    /// This method fires when the GameScene is loaded. We use this similar to an init/constructor since it is called when the screen is moved to (initialized)
    ///
    /// - Parameter view: The current SKScene AKA the GameScene
    /// - Returns: Nothing, this is a void method.
    override func didMove(to view : SKView) -> Void
    {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        
        //MARK: Add ScoreLabel
        scoreNode.zPosition = 2
        scoreNode.position.x = 150
        scoreNode.position.y = 385
        addChild(scoreNode)
        score = 0
        
        //MARK: Load background audio
        let backgroundMusic = SKAudioNode(fileNamed: "Go")
        addChild(backgroundMusic)
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
    
    /// Assigns a random color to the blocks
    /// - Returns: This returns a UIColor
    private func assignColorAndBitmask() -> UIColor
    {
        let colors : [UIColor] = [.black, .darkGray, .red, .systemPink, .blue, .systemIndigo, .purple]
        let randomIndex = Int(arc4random()) % colors.count
        
        colorMask = randomIndex + 1
        
        return colors[randomIndex]
    }
    
    //MARK: -- Collision Handling Methods
    
    /// This func adds 0.5 to the score every time it is run and it also removes a node
    /// - Parameter deadNode: A node of type SKNode that gets removed when this func is called
    /// - Returns: Nothing, this func returns void
    private func annihilate(deadNode: SKNode) -> Void
    {
        score += 0.5
        explosionEffect(at: deadNode.position)
        deadNode.removeFromParent()
    }
    
    private func collisionBetween(_ nodeOne : SKNode, and nodeTwo : SKNode)
    {
        if(nodeOne.physicsBody?.contactTestBitMask == nodeTwo.physicsBody?.contactTestBitMask)
        {
            annihilate(deadNode: nodeOne)
            annihilate(deadNode: nodeOne)
        }
    }
    
    func didBegin(_ contact : SKPhysicsContact) -> Void
    {
        guard let first = contact.bodyA.node else { return }
        guard let second = contact.bodyB.node else { return }
        
        collisionBetween(first, and: second)
    }
    
    //MARK: - Special Effects
    
    private func explosionEffect (at location : CGPoint) -> Void
    {
        if let explosion = SKEmitterNode(fileNamed: "SparkParticle")
        {
            explosion.position = location
            addChild(explosion)
            
            let waitTime = SKAction.wait(forDuration: 5)
            let removeExplosion = SKAction.removeFromParent()
            let explosiveSequence = SKAction.sequence([waitTime, removeExplosion])
            
            explosion.run(explosiveSequence)
        }
    }
}
