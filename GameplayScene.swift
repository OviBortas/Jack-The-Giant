//
//  GameplayScene.swift
//  Jack The Giant
//
//  Created by Ovidiu Bortas on 7/3/17.
//  Copyright © 2017 Ovidiu Bortas. All rights reserved.
//

import SpriteKit

class GameplayScene: SKScene {
    
    var mainCamera: SKCameraNode?
    var bg1: BGClass?
    var bg2: BGClass?
    var bg3: BGClass?
    
    
    var player: Player?
    
    var canMove = false
    var moveLeft = false
    
    var center: CGFloat?
    
    override func didMove(to view: SKView) {
        setupScene()
    }
    
    override func update(_ currentTime: TimeInterval) {
        moveCamera()
        managePlayer()
        manageBackgrounds()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if let center = center {
                moveLeft = location.x <= center
                player?.animatePlayer(moveLeft: moveLeft)
            }
        }
        
        canMove = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        canMove = false
        player?.stopPlayerAnimation()
    }
    
    private func setupScene() {
        guard let width = scene?.size.width, let height = scene?.size.height else {
            fatalError("scene is nill")
        }
        guard let loadedPlayer = childNode(withName: "Player") as? Player else {
            fatalError("Player is Nil")
        }
        
        guard let loadedMainCamera = childNode(withName: "MainCamera") as? SKCameraNode else {
            fatalError("camera is nil")
        }
        
        player = loadedPlayer
        player?.initializePlayerAnimations()
        
        mainCamera = loadedMainCamera
        
        center = width / height
        
        loadBackgrounds()
    }
    
    func loadBackgrounds() {
        guard let bg1 = childNode(withName: "BG 1") as? BGClass, let bg2 = childNode(withName: "BG 2") as? BGClass,
            let bg3 = childNode(withName: "BG 3") as? BGClass else {
                fatalError("A Background is Nil")
        }
        
        self.bg1 = bg1
        self.bg2 = bg2
        self.bg3 = bg3
    }
    
    func moveCamera() {
        mainCamera?.position.y -= 3
    }
    
    func managePlayer() {
        if canMove {
            player?.movePlayer(moveLeft)
        }
    }
    
    func manageBackgrounds() {
        if let mainCamera = mainCamera {
            bg1?.moveBG(camera: mainCamera)
            bg2?.moveBG(camera: mainCamera)
            bg3?.moveBG(camera: mainCamera)
        }
    }
    
}




