//
//  StartScene.swift
//  Race_Game_altha
//
//  Created by xcode on 10.12.16.
//  Copyright © 2016 VSU. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class StartScene: SKScene {
    
    var SoundOn: Bool = true
    var HighSS = 0
    var difficulty = 1
    
    var playButton : UIButton!
    var musicButton = SKSpriteNode(imageNamed: "SoundOff.png")
    var diffButton = SKSpriteNode(imageNamed: "DiffMedium.png")
    
    
    override func didMove(to view: SKView) {
        scene?.backgroundColor = UIColor(patternImage: UIImage(named: "start.png")!)
        
        playButton = UIButton(frame: CGRect(x: 0, y: 30, width: view.frame.size.width / 3, height: 30))
        
        self.playButton.center = CGPoint(x: self.frame.midX, y: self.frame.midY)
        playButton.setTitle("Play", for: UIControlState.normal)
        playButton.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        playButton.addTarget(self, action: #selector(EndScene.Restart), for: UIControlEvents.touchUpInside)
        self.view?.addSubview(playButton)
        //self.addChild(self.playButton)
        
        self.musicButton.position = CGPoint(x: self.frame.midX - 160, y: self.frame.midY - 80)
        self.addChild(self.musicButton)
        self.diffButton.position = CGPoint(x: self.frame.midX + 80, y: self.frame.midY - 80)
        self.addChild(self.diffButton)
        
        //self.backgroundColor = UIColor.black
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
           
            if self.atPoint(location) == self.musicButton {
                SoundOn = !SoundOn
                musicButton.removeFromParent()
                if (SoundOn){
                    musicButton = SKSpriteNode(imageNamed: "SoundOn.png")}
                else{
                    musicButton = SKSpriteNode(imageNamed: "SoundOff.png")}
                
                
                self.musicButton.position = CGPoint(x: self.frame.midX - 160, y: self.frame.midY - 80)
                addChild(musicButton)
                
                //NSLog("\(SoundOn)")
            }
            
            if self.atPoint(location) == self.diffButton {
                if (difficulty < 2){
                    difficulty = (difficulty + 1)
                }
                else{
                    difficulty = 0
                }
                diffButton.removeFromParent()
                if (difficulty == 0){
                    diffButton = SKSpriteNode(imageNamed: "DiffEasy.png")}
                if (difficulty == 1){
                    diffButton = SKSpriteNode(imageNamed: "DiffMedium.png")}
                if (difficulty == 2){
                    diffButton = SKSpriteNode(imageNamed: "DiffHard.png")}
                
                
                self.diffButton.position = CGPoint(x: self.frame.midX + 80, y: self.frame.midY - 80)
                addChild(diffButton)
                
                //NSLog("\(SoundOn)")
            }
            
        }
    }
    
    
    func Play(){
        
        if let Gscene = SKScene(fileNamed: "GameScene") as? GameScene {
            // Set the scale mode to scale to fit the window
            Gscene.scaleMode = .aspectFill
            Gscene.HighScore = HighSS
            Gscene.isSound = SoundOn
            Gscene.difficulty = difficulty
            // Present the scene
            view!.presentScene(Gscene)
        }
        
        playButton.removeFromSuperview()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
