//
//  Player.swift
//  Jack The Giant
//
//  Created by Ovidiu Bortas on 7/3/17.
//  Copyright © 2017 Ovidiu Bortas. All rights reserved.
//

import SpriteKit

private enum Constants {
    static let playerAnimationKey = "Animate"
    static let playerSpeed: CGFloat = 7
}

class Player: SKSpriteNode {
    
    private var textureAtlas = SKTextureAtlas()
    private var playerAnimation = [SKTexture]()
    private var animatePlayerAction = SKAction()
    
    
    func initializePlayerAnimations() {
        textureAtlas = SKTextureAtlas(named: "Player")
        
        for i in 2...textureAtlas.textureNames.count {
            let name = "Player \(i)"
            playerAnimation.append(textureAtlas.textureNamed(name))

        }
        
        animatePlayerAction = SKAction.animate(with: playerAnimation, timePerFrame: 0.08, resize: true, restore: false)
    }
    
    func animatePlayer(moveLeft: Bool) {
        xScale = moveLeft ? -fabs(xScale) : fabs(xScale)
    
        run(SKAction.repeatForever(animatePlayerAction), withKey: Constants.playerAnimationKey)
    }
    
    func stopPlayerAnimation() {
        removeAction(forKey: Constants.playerAnimationKey)
        resetPlayerTexture()
        
    }
    
    func movePlayer(_ moveLeft: Bool) {
        if moveLeft {
            position.x -= Constants.playerSpeed
        } else {
            position.x += Constants.playerSpeed
            
        }
    }
    
    func resetPlayerTexture() {
        texture = SKTexture(imageNamed: "Player 1")
        
        guard let textureSize = texture?.size() else {
            print("Texture is nil")
            return
        }
        
        size = textureSize
    }
    
}



