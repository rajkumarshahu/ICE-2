//
//  GameScene.swift
//  ICE-2
//
//  Created by Raj Kumar Shahu on 2021-02-04.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String: GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var sprite: SKSpriteNode?
    private var spriteSpeed:CGFloat = 5.0
    
    override func sceneDidLoad() {
        self.lastUpdateTime = 0
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        self.sprite = SKSpriteNode(color: UIColor.red, size:CGSize(width: 100.0, height: 100.0))
        self.addChild(self.sprite!)
        
        reset()
    }

    
    
    func touchDown(atPoint pos : CGPoint) {
       
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    func reset() {
        self.sprite?.position.y = -700
    }
    
    func checkBounds() {
        // check if sprite leaves the top boundary
        if (self.sprite?.position.y)! > 700 {
            reset()
        }
    }
    
    func moveSprite() {
        self.sprite?.position.y += self.spriteSpeed
        self.sprite?.zRotation -= self.spriteSpeed * 0.025
        
        self.sprite?.zPosition = 1
        self.sprite?.color = UIColor.init(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.5)
        self.sprite?.setScale(1.5)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdatetime if it has not already been
        if(self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        moveSprite()
        checkBounds()
        
        self.lastUpdateTime = currentTime
    }
}
