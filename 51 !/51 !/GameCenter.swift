//
//  GameCenter.swift
//  51 !
//
//  Created by 桑原綾人 on 2015/11/15.
//  Copyright © 2015年 game. All rights reserved.
//

import Foundation
import Foundation
import UIKit
import GameKit
class MyPage: UIViewController,GKGameCenterControllerDelegate {
    
    @IBOutlet weak var Score: UILabel!
    
    @IBOutlet weak var Rating: UILabel!
    override  func viewDidLoad() {
        super.viewDidLoad()
       
        authenticateLocalPlayer()
    }
    //score variable--depends on game
    var score1:Int = 0
    
    //send high score to leaderboard
    func saveHighscore(score:Int) {
        
        //check if user is signed in
        if GKLocalPlayer.localPlayer().authenticated {
            
            let scoreReporter = GKScore(leaderboardIdentifier: "grp.51score") //leaderboard id here
            
            scoreReporter.value = Int64(score) //score variable here (same as above)
            
            let scoreArray: [GKScore] = [scoreReporter]
            
            GKScore.reportScores(scoreArray, withCompletionHandler: {(error : NSError?) -> Void in
                if error != nil {
                    print("error")
                }
            })
            
        }
        
    }
    
    
    @IBAction func Addpoint(sender: AnyObject) {
        score1++
        Score.text="\(score1)"
    }
    @IBAction func Done(sender: AnyObject) {
        saveHighscore(score1)
        showLeader()
    }
    //shows leaderboard screen
    func showLeader() {
        let vc = self.view?.window?.rootViewController
        let gc = GKGameCenterViewController()
        gc.gameCenterDelegate = self
        vc?.presentViewController(gc, animated: true, completion: nil)
    }
    
    //hides leaderboard screen
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController)
    {
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }
    func win()->Int{
        let ud = NSUserDefaults.standardUserDefaults()
        var myrating:Int?
        myrating=ud.integerForKey("win")
        if (myrating != nil ){
            myrating=0
            return 0
        }
        else{
            return myrating!
        }
        
        
    }
    //initiate gamecenter
    func authenticateLocalPlayer(){
        
        var localPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {(viewController, error) -> Void in
            
            if (viewController != nil) {
                self.presentViewController(viewController!, animated: true, completion: nil)
            }
                
            else {
                print((GKLocalPlayer.localPlayer().authenticated))
            }
        }
        
    }
    
    
    
    
}