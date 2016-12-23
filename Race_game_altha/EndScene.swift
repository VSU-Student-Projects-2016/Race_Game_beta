//
//  EndScene.swift
//  Race_Game_altha
//
//  Created by xcode on 29.10.16.
//  Copyright © 2016 VSU. All rights reserved.
//

import Foundation
import SpriteKit

class EndScene : SKScene{
    
    var RestartBtn : UIButton!
    var MainMenuBtn: UIButton!
    
    var HighSE = 0
    
    var Scorelbl : UILabel!
    var HighScorelbl : UILabel!
    
    
    override func didMove(to view: SKView) {
        
        scene?.backgroundColor = UIColor(patternImage: UIImage(named: "end.png")!)
        
        RestartBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width / 3, height: 30))
        RestartBtn.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.width / 7)
        
        MainMenuBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width / 3, height: 30))
        MainMenuBtn.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.width / 7 - 50)
        
        
        RestartBtn.setTitle("Restart", for: UIControlState.normal)
        RestartBtn.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        
        MainMenuBtn.setTitle("Menu", for: UIControlState.normal)
        MainMenuBtn.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        
        RestartBtn.addTarget(self, action: #selector(EndScene.Restart), for: UIControlEvents.touchUpInside)
        self.view?.addSubview(RestartBtn)
        
        MainMenuBtn.addTarget(self, action: #selector(EndScene.Menu), for: UIControlEvents.touchUpInside)
        self.view?.addSubview(MainMenuBtn)
        
        var ScoreDefault = UserDefaults.standard
        
        //warning!!!
        var Score = ScoreDefault.value(forKey: "Score") as! NSInteger
        NSLog("\(Score)")
        
        
        Scorelbl = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width / 3, height: 30))
        Scorelbl.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.width / 4)
        Scorelbl.text = "\(Score)"
        self.view?.addSubview(Scorelbl)
        
        HighScorelbl = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width / 3, height: 30))
        HighScorelbl.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.width / 5)
        HighScorelbl.text = "\("HighScore")"
        self.view?.addSubview(HighScorelbl)
        
        //NSLog("\(Highscore)")
    }
    
    func Restart(){
        
        if let Gscene = SKScene(fileNamed: "GameScene") as? GameScene {
            // Set the scale mode to scale to fit the window
            Gscene.scaleMode = .aspectFill
            Gscene.HighScore = HighSE
            // Present the scene
            view!.presentScene(Gscene)
        }
        
        RestartBtn.removeFromSuperview()
        MainMenuBtn.removeFromSuperview()
        HighScorelbl.removeFromSuperview()
    }
    
    func Menu(){
        
        if let Sscene = SKScene(fileNamed: "StartScene") as? StartScene {
            // Set the scale mode to scale to fit the window
            Sscene.scaleMode = .aspectFill
            Sscene.HighSS = HighSE
            // Present the scene
            view!.presentScene(Sscene)
        }
        
        MainMenuBtn.removeFromSuperview()
        RestartBtn.removeFromSuperview()
        HighScorelbl.removeFromSuperview()
    }
    
}
