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
    }
    
}
