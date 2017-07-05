//
//  BGClass.swift
//  Jack The Giant
//
//  Created by Ovidiu Bortas on 7/3/17.
//  Copyright © 2017 Ovidiu Bortas. All rights reserved.
//

import SpriteKit

class BGClass: SKSpriteNode{
    
    
    
    func moveBG(camera: SKCameraNode) {
        if position.y - size.height - 10 > camera.position.y {
            position.y -= size.height * 3
        }
        
    }
}



















