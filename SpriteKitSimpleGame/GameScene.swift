//
//  GameScene.swift
//  SpriteKitSimpleGame
//
//  Created by Jon Bachelor on 7/16/16.
//  Copyright (c) 2016 Jon Bachelor. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // 1
    let player = SKSpriteNode(imageNamed: "SpriteKitSimpleGameResources/sprites.atlas/player")
    
    
    override func didMoveToView(view: SKView) {
        
        // 2
        backgroundColor = SKColor.whiteColor()
        // 3
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        // 4
        addChild(player)
        
        runAction(SKAction.repeatActionForever(SKAction.sequence([
            SKAction.runBlock(addMonster),
            SKAction.waitForDuration(1.0)
            ])))
    }
    
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    
    func addMonster() {
        // create sprite
        let monster = SKSpriteNode(imageNamed: "SpriteKitSimpleGameResources/sprites.atlas/monster")
        
        // determine where to spawn the monster along the y axis
        let actualY = random(min: monster.size.height/2, max: size.height - monster.size.height/2)
        
        // position the monster slightly off-screen along the right edge
        // and along a random position along the y axis as calculated above
        monster.position = CGPoint(x: size.width + monster.size.width/2, y: actualY)
        
        // add monster to the scene
        addChild(monster)
        
        // Determine speed of the monster
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        
        // Create the actions
        let actionMove = SKAction.moveTo(CGPoint(x: -monster.size.width/2, y: actualY), duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        monster.runAction(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
}
