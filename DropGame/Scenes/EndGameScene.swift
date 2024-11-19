//
//  EndGameScene.swift
//  DropGame
//
//  Created by Howard, Landon on 11/19/24.
//

import Foundation
import SpriteKit

class EndGameScene : SKScene
{
    var score : Double = 0.0
    
    //MARK: - Overriden Method
    
    override func didMove(to view : SKView) -> Void
    {
        backgroundColor = .orange
        
        let scoreNode = SKLabelNode(fontNamed: "Copperplate-Bold")
        scoreNode.fontSize = 20
        scoreNode.fontColor = .black
        scoreNode.zPosition = 2
        scoreNode.position.x = frame.midX
        scoreNode.position.y = frame.midY + 30
        scoreNode.text = "Score: \(score)"
        
        let endNode = SKLabelNode(fontNamed: "Copperplate-Bold")
        endNode.fontSize = 25
        endNode.fontColor = .black
        endNode.zPosition = 2
        endNode.position.x = frame.midX
        endNode.position.y = frame.midX + 10
        endNode.text = "Game over"
        
        let restartNode = SKLabelNode(fontNamed: "Copperplate-Bold")
        restartNode.fontSize = 20
        restartNode.fontColor = .black
        restartNode.zPosition = 2
        restartNode.position.x = frame.midX
        restartNode.position.y = frame.midY - 10
        restartNode.text = "Pinch to restart"
        
        addChild(scoreNode)
        addChild(endNode)
        addChild(restartNode)
        
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        self.view?.addGestureRecognizer(pinchRecognizer)
    }
    
    private func restart () -> Void
    {
        let transition = SKTransition.fade(with: .purple, duration: 15)
        let restartScene = GameScene()
        restartScene.size = CGSize(width: 300, height: 500)
        restartScene.scaleMode = .fill
        
        self.view?.presentScene(restartScene, transition: transition)
    }
    
    //MARK: - Pinch Gesture Recognizer
    
    @objc
    private func handlePinch(recognizer : UIPinchGestureRecognizer) -> Void
    {
        if (recognizer.state == .ended)
        {
            restart()
        }
    }
}
