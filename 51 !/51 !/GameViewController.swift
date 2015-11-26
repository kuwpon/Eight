//
// GameViewController.swift
// delegate_escape
//
// Created by 桑原綾人 on 2014/11/05.
// Copyright (c) 2014年 game. All rights reserved.
//

import UIKit
import SpriteKit
import GameKit

var playscore=Array<String>()
var playscore2=Array<String>()
var playscore3=Array<String>()
var playscore4=Array<String>()
protocol SceneEscapeProtocol {
    
    func sceneEscape(scene: SKScene)
    
}
  var roundcount:Int=0
class GameViewController: UIViewController, SceneEscapeProtocol{
    var eView: UIVisualEffectView?
    var vscene:SKScene?
    var skView: SKView?
    var clearflg:Bool?
    var player1:String!
    var player2:String!
    var player3:String!
    var player4:String!
  
    
    @IBAction func unwind(sender: UIStoryboardSegue){
               if roundcount<4{
        
        goGame()
        roundcount++
        print("round \(roundcount)")
        }
               
            
    }
    
    @IBAction func butt(sender: AnyObject) {
        var nex : AnyObject!=self.storyboard?.instantiateViewControllerWithIdentifier("board")
        self.presentViewController(nex as! UIViewController, animated: false, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
               super.viewDidLoad()
                UIApplication.sharedApplication().keyWindow?.rootViewController=self
        
        
        
        
        //rootviewcontrollerをgameviewcontrollerに切り替える
        // skViewを設定します。
        
        self.skView = self.view as? SKView
        /*
        skView!.showsNodeCount = true
        skView!.ignoresSiblingOrder = true
        */
                 goGame()
    }
        
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
      
        let play1s:Int=appDelegate.play1score!
        let play2s:Int=appDelegate.play2score!
        
        let play3s:Int=appDelegate.play3score!
        let play4s:Int=appDelegate.play4score!

        /*
        var play1s:Int=0
        var play2s:Int=0
        var play3s:Int=0
        var play4s:Int=0
        */
        
        if segue.identifier=="score" {
            
            let next: ViewController=segue.destinationViewController as! ViewController
          
            next.player1=String(play1s)
            next.player2=String(play2s)
            next.player3=String(play3s)
            next.player4=String(play4s)
            next.round=roundcount
            print("next string \(player1)")
            playscore.append(next.player1)
            playscore2.append(next.player2)
            playscore3.append(next.player3)
            playscore4.append(next.player4)
            
        }
    }
    
    
    /*
    @IBAction func unwind(sender: UIStoryboardSegue){
    
    
    }
    */
    /*
    override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    if clearflg==true
    {
    self.presentingViewController
    goGame()
    }
    
    }
    */
    
    func goGame() {
        let myBound: CGSize = UIScreen.mainScreen().bounds.size
        print("myBound.width\(myBound.width)" )
        print("bound.height\(myBound.height)" )
        
        let gameScene = GameScene(size: CGSizeMake(myBound.width, myBound.height))
      
        gameScene.delegate_escape = self
                //gameclearflg=false
       //gameScene.scaleMode = SKSceneScaleMode.ResizeFill
       

        self.skView!.presentScene(gameScene)
        
    }
    
      // デリゲートメソッドの記述。
    func sceneEscape(scene: SKScene) {
        /*
        if scene.isKindOfClass(GameScene) {
        goSecond()
        } else if scene.isKindOfClass(SecondScene) {
        goGame()
        }
        */
        goGame()
    }
    // この下はデフォルトのままなので、省略。
}