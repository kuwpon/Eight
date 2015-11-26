//
//  Viewcon.swift
//  delegate_escape
//
//  Created by 桑原綾人 on 2014/11/08.
//  Copyright (c) 2014年 game. All rights reserved.
//


import UIKit
import SpriteKit
import Foundation


   class ViewController: UIViewController{
    
    var skView: SKView?
    var scorearray:AnyObject!
    var player1:String!
    var player2:String!
    var player3:String!
    var player4:String!
    var round:Int?
    var playerpoint=Array<String>()
    var finalscore=Array<Int>()
    var playtotal:[Int]?
    var playtotal2:[Int]?
    var playtotal3:[Int]?
    var playtotal4:[Int]?
    var gamecount:Int=0
    var win:Int=0
    var winrate:Float=0
    var finalwin:Int=0
    var finalroundcount:Int=0
    var finalwincount:Int=0
    var finalwinrate:Float=0
    @IBOutlet  var r1play1: UILabel!
    @IBOutlet  var r1play2: UILabel!
    @IBOutlet  var r1play3: UILabel!
    @IBOutlet  var r1play4: UILabel!
    @IBOutlet weak var r2play1: UILabel!
    @IBOutlet weak var r2play2: UILabel!
    @IBOutlet weak var r2play3: UILabel!
    @IBOutlet weak var r2play4: UILabel!
    @IBOutlet weak var r3play1: UILabel!
    @IBOutlet weak var r3play2: UILabel!
    @IBOutlet weak var r3play3: UILabel!
    @IBOutlet weak var r3play4: UILabel!
    @IBOutlet weak var r4play1: UILabel!
    @IBOutlet weak var r4play2: UILabel!
    @IBOutlet weak var r4play3: UILabel!
    @IBOutlet weak var r4play4: UILabel!
    @IBOutlet weak var r5play1: UILabel!
    @IBOutlet weak var r5play2: UILabel!
    @IBOutlet weak var r5play3: UILabel!
    @IBOutlet weak var r5play4: UILabel!
    @IBOutlet weak var total1: UILabel!
    @IBOutlet weak var total2: UILabel!
    @IBOutlet weak var total3: UILabel!
    @IBOutlet weak var total4: UILabel!
    @IBOutlet weak var datalabel: UILabel!
    
        @IBOutlet weak var end: UIButton!
    @IBOutlet weak var nextgame: UIButton!
   
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var gametime: UILabel!
    var playerspoint=[String]()
    
    @IBAction func alert2(sender: AnyObject) {
        var display=false
        var gameviewcon=GameViewController()
         let gamefinish = NSLocalizedString("ゲーム終了",comment: "comment")
        let gametitle = NSLocalizedString("タイトル画面",comment: "comment")
        
        let alertController = UIAlertController(title: String(gamefinish), message: String(gametitle), preferredStyle: .Alert)
        let otherAction = UIAlertAction(title: "Ok", style: .Default) {
            action in print("pushed OK!")
            playscore.removeAll(keepCapacity: false)
            playscore2.removeAll(keepCapacity: false)
            playscore3.removeAll(keepCapacity: false)
            playscore4.removeAll(keepCapacity: false)
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let vc = storyboard.instantiateViewControllerWithIdentifier("board") as UIViewController;
            //vc.modalTransitionStyle=UIModalTransitionStyle.CrossDissolve
            self.presentViewController(vc, animated: true, completion:nil)
            
            // var gameview:UIViewController=GameViewController() as UIViewController
            // self.dismissViewControllerAnimated(false, completion: nil)
            
            // self.view?.window?.rootViewController?.performSegueWithIdentifier("title", sender: self)
            /*
            let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
            dispatch_async(dispatch_get_global_queue(priority, 0)) {
            // do some task
            dispatch_async(dispatch_get_main_queue()) {
            //  alertController.dismissViewControllerAnimated(false, completion: nil)
            //  self.dismissViewControllerAnimated(false, completion: nil)
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let vc = storyboard.instantiateViewControllerWithIdentifier("board") as UIViewController;
            
            self.presentViewController(vc, animated: true, completion:nil)
            }
            }
            */
            
            //      self.view?.window?.rootViewController?.performSegueWithIdentifier("title", sender: self)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) {
            action in print("Pushed CANCEL!")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(otherAction)
       
        
        self.presentViewController(alertController, animated: true, completion: nil)

    }
        @IBAction func alert(sender: AnyObject) {
        
    }
           @IBAction func close(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
   
   override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    let ud = NSUserDefaults.standardUserDefaults()

    /*
    var totalpoint:Int=0
    var totalpoint2:Int=0
    var totalpoint3:Int=0
    var totalpoint4:Int=0
  //  */
 //   let purple = UIColor.purpleColor() // 1.0 alpha
  //  let semi = purple.colorWithAlphaComponent(0.4) // 0.5 alpha

   // self.view.backgroundColor=semi

    for i in 0...4 {
        playtotal?.insert(Int(playscore[i])!, atIndex: i)
        playtotal2?.insert(Int(playscore2[i])!, atIndex: i)
        playtotal3?.insert(Int(playscore3[i])!, atIndex: i)
        playtotal4?.insert(Int(playscore4[i])!, atIndex: i)

    }
   
  
      repeat{
           
        
        if round==0{
             message.hidden=true
            nextgame.hidden=false
            end.hidden=true
            nextgame.enabled=true
            end.enabled=false
/*
            
            nextgame.hidden=true
            end.hidden=false
            nextgame.enabled=false
            end.enabled=true

*/
        player1=playscore[0]
        player2=playscore2[0]
        player3=playscore3[0]
        player4=playscore4[0]
        
        r1play1.text=player1
        r1play2.text=player2
        r1play3.text=player3
        r1play4.text=player4
        r2play1.hidden=true
        r2play2.hidden=true
        r2play3.hidden=true
        r2play4.hidden=true
        r3play1.hidden=true
        r3play2.hidden=true
        r3play3.hidden=true
        r3play4.hidden=true
        r4play1.hidden=true
        r4play2.hidden=true
        r4play3.hidden=true
        r4play4.hidden=true
        r5play1.hidden=true
        r5play2.hidden=true
        r5play3.hidden=true
        r5play4.hidden=true
        total1.text=playscore[0]
        total2.text=playscore2[0]
        total3.text=playscore3[0]
        total4.text=playscore4[0]
        playerspoint.insert(player1, atIndex: 0)
        playerspoint.insert(player2, atIndex: 1)
        playerspoint.insert(player3, atIndex: 2)
        playerspoint.insert(player4, atIndex: 3)
           
            
        let maxindex=playerspoint.maxElement()!
       // print("maxinde is \(maxindex)")
        
           scoreboard(playerspoint)
       }
    else if round==1{
             message.hidden=true
            nextgame.hidden=false
            end.hidden=true
            nextgame.enabled=true
            end.enabled=false


            /*
            nextgame.hidden=true
            end.hidden=false
            nextgame.enabled=false
            end.enabled=true
            */

        r2play1.hidden=false
        r2play2.hidden=false
        r2play3.hidden=false
        r2play4.hidden=false
        r3play1.hidden=true
        r3play2.hidden=true
        r3play3.hidden=true
        r3play4.hidden=true
        r4play1.hidden=true
        r4play2.hidden=true
        r4play3.hidden=true
        r4play4.hidden=true
        r5play1.hidden=true
        r5play2.hidden=true
        r5play3.hidden=true
        r5play4.hidden=true

        r1play1.text=playscore[0]
        r1play2.text=playscore2[0]
        r1play3.text=playscore3[0]
        r1play4.text=playscore4[0]
        
        player1=playscore[1]
        player2=playscore2[1]
        player3=playscore3[1]
        player4=playscore4[1]
        playerspoint.insert(playscore[1], atIndex: 0)
        playerspoint.insert(playscore2[1], atIndex: 1)
        playerspoint.insert(playscore3[1], atIndex: 2)
        playerspoint.insert(playscore4[1], atIndex: 3)

        
       
        r2play1.text=player1
        r2play2.text=player2
        r2play3.text=player3
        r2play4.text=player4
            
        total1.text=String(Int(playscore[0])!+Int(playscore[1])!)
        total2.text=String(Int(playscore2[0])!+Int(playscore2[1])!)
        total3.text=String(Int(playscore3[0])!+Int(playscore3[1])!)
        total4.text=String(Int(playscore4[0])!+Int(playscore4[1])!)
        scoreboard(playerspoint)
    }
    else if round==2{
             message.hidden=true
            nextgame.hidden=false
            end.hidden=true
            nextgame.enabled=true
            end.enabled=false

        r3play1.hidden=false
        r3play2.hidden=false
        r3play3.hidden=false
        r3play4.hidden=false
        r4play1.hidden=true
        r4play2.hidden=true
        r4play3.hidden=true
        r4play4.hidden=true
        r5play1.hidden=true
        r5play2.hidden=true
        r5play3.hidden=true
        r5play4.hidden=true
        r1play1.text=playscore[0]
        r1play2.text=playscore2[0]
        r1play3.text=playscore3[0]
        r1play4.text=playscore4[0]
        r2play1.text=playscore[1]
        r2play2.text=playscore2[1]
        r2play3.text=playscore3[1]
        r2play4.text=playscore4[1]
        
        player1=playscore[2]
        player2=playscore2[2]
        player3=playscore3[2]
        player4=playscore4[2]
        playerspoint.insert(playscore[2], atIndex: 0)
        playerspoint.insert(playscore2[2], atIndex: 1)
        playerspoint.insert(playscore3[2], atIndex: 2)
        playerspoint.insert(playscore4[2], atIndex: 3)
         scoreboard(playerspoint)
        
       
        r3play1.text=player1
        r3play2.text=player2
        r3play3.text=player3
        r3play4.text=player4
        total1.text=String(Int(playscore[0])!+Int(playscore[1])!+Int(playscore[2])!)
        total2.text=String(Int(playscore2[0])!+Int(playscore2[1])!+Int(playscore2[2])!)
        total3.text=String(Int(playscore3[0])!+Int(playscore3[1])!+Int(playscore3[2])!)
        total4.text=String(Int(playscore4[0])!+Int(playscore4[1])!+Int(playscore4[2])!)
       
    }
    else if round==3{
             message.hidden=true
            nextgame.hidden=false
            end.hidden=true
            nextgame.enabled=true
            end.enabled=false

        r4play1.hidden=false
        r4play2.hidden=false
        r4play3.hidden=false
        r4play4.hidden=false
        r5play1.hidden=true
        r5play2.hidden=true
        r5play3.hidden=true
        r5play4.hidden=true
        
        r1play1.text=playscore[0]
        r1play2.text=playscore2[0]
        r1play3.text=playscore3[0]
        r1play4.text=playscore4[0]
        r2play1.text=playscore[1]
        r2play2.text=playscore2[1]
        r2play3.text=playscore3[1]
        r2play4.text=playscore4[1]
        r3play1.text=playscore[2]
        r3play2.text=playscore2[2]
        r3play3.text=playscore3[2]
        r3play4.text=playscore4[2]


        player1=playscore[3]
        player2=playscore2[3]
        player3=playscore3[3]
        player4=playscore4[3]
        
        r4play1.text=player1
        r4play2.text=player2
        r4play3.text=player3
        r4play4.text=player4
        total1.text=String(Int(playscore[0])!+Int(playscore[1])!+Int(playscore[2])!+Int(playscore[3])!)
        total2.text=String(Int(playscore2[0])!+Int(playscore2[1])!+Int(playscore2[2])!+Int(playscore2[3])!)
        total3.text=String(Int(playscore3[0])!+Int(playscore3[1])!+Int(playscore3[2])!+Int(playscore3[3])!)
        total4.text=String(Int(playscore4[0])!+Int(playscore4[1])!+Int(playscore4[2])!+Int(playscore4[3])!)
            playerspoint.insert(playscore[3], atIndex: 0)
            playerspoint.insert(playscore2[3], atIndex: 1)
            playerspoint.insert(playscore3[3], atIndex: 2)
            playerspoint.insert(playscore4[3], atIndex: 3)
            scoreboard(playerspoint)
    
            
                }
    else if round==4{
            nextgame.hidden=true
            end.hidden=false
            nextgame.enabled=false
            end.enabled=true

        let finalplayscore=Int(playscore[0])!+Int(playscore[1])!+Int(playscore[2])!+Int(playscore[3])!+Int(playscore[4])!
        let finalplayscore2=Int(playscore2[0])!+Int(playscore2[1])!+Int(playscore2[2])!+Int(playscore2[3])!+Int(playscore2[4])!
        let finalplayscore3=Int(playscore3[0])!+Int(playscore3[1])!+Int(playscore3[2])!+Int(playscore3[3])!+Int(playscore3[4])!
        let finalplayscore4=Int(playscore4[0])!+Int(playscore4[1])!+Int(playscore4[2])!+Int(playscore4[3])!+Int(playscore4[4])!
        finalroundcount=finalroundcount+1
        r5play1.hidden=false
        r5play2.hidden=false
        r5play3.hidden=false
        r5play4.hidden=false
        
        r1play1.text=playscore[0]
        r1play2.text=playscore2[0]
        r1play3.text=playscore3[0]
        r1play4.text=playscore4[0]
        r2play1.text=playscore[1]
        r2play2.text=playscore2[1]
        r2play3.text=playscore3[1]
        r2play4.text=playscore4[1]
        r3play1.text=playscore[2]
        r3play2.text=playscore2[2]
        r3play3.text=playscore3[2]
        r3play4.text=playscore4[2]
        r4play1.text=playscore[3]
        r4play2.text=playscore2[3]
        r4play3.text=playscore3[3]
        r4play4.text=playscore4[3]
        
        player1=playscore[4]
        player2=playscore2[4]
        player3=playscore3[4]
        player4=playscore4[4]
        
        r5play1.text=player1
        r5play2.text=player2
        r5play3.text=player3
        r5play4.text=player4
        total1.text=String(finalplayscore)
        total2.text=String(finalplayscore2)
        total3.text=String(finalplayscore3)
        total4.text=String(finalplayscore4)
        playerspoint.insert(playscore[4], atIndex: 0)
        playerspoint.insert(playscore2[4], atIndex: 1)
        playerspoint.insert(playscore3[4], atIndex: 2)
        playerspoint.insert(playscore4[4], atIndex: 3)
        
    
        finalscore.insert(finalplayscore, atIndex: 0)
        finalscore.insert(finalplayscore2, atIndex: 1)
        finalscore.insert(finalplayscore3, atIndex: 2)
        finalscore.insert(finalplayscore4, atIndex: 3)
     
        let winplayer=finalscore.indexOf(finalscore.maxElement()!)
            message.hidden=false
        let p1win=NSLocalizedString("Player1の勝ちです",comment: "comment")
         let p2win=NSLocalizedString("Player2の勝ちです",comment: "comment")
         let p3win=NSLocalizedString("Player3の勝ちです",comment: "comment")
         let p4win=NSLocalizedString("Player4の勝ちです",comment: "comment")
         let p12win=NSLocalizedString("Player1とPlayer2の勝ちです",comment: "comment")
        let p13win=NSLocalizedString("Player1とPlayer3の勝ちです",comment: "comment")
         let p14win=NSLocalizedString("Player1とPlayer4の勝ちです",comment: "comment")
         let p23win=NSLocalizedString("Player2とPlayer3の勝ちです",comment: "comment")
        let p24win=NSLocalizedString("Player2とPlayer4の勝ちです",comment: "comment")
            let p34win=NSLocalizedString("Player3とPlayer4の勝ちです",comment: "comment")


            
    if winplayer==0{
        message.text=String(p1win)
        
            }
    else if winplayer==1{
         message.text=String(p2win)
            }
    else if winplayer==2{
         message.text=String(p3win)
            }
    else if winplayer==3{
         message.text=String(p4win)
            }
    else if (winplayer==0) && (winplayer==1){
        message.text=String(p12win)
            }
    else if (winplayer==0) && (winplayer==2){
        message.text=String(p13win)
            }
    else if (winplayer==0) && (winplayer==3){
        message.text=String(p14win)
            }
    else if (winplayer==1) && (winplayer==2){
        message.text=String(p23win)
            }
    else if (winplayer==1) && (winplayer==3){
        message.text=String(p24win)
    }

    else if (winplayer==2) && (winplayer==3){
        message.text=String(p34win)
            }




    
        ud.synchronize()
         scoreboard(playerspoint)
   
    
      
           
        
        }
        /*
     total1.text=String(totalpoint)
     total2.text=String(totalpoint2)
     total3.text=String(totalpoint3)
     total4.text=String(totalpoint4)
        */
         }while round>4
   
    

    var names: [String] = []
    
    //前回の保存内容があるかどうかを判定
  
    playerpoint.insert(r1play1.text!, atIndex: 0)
    playerpoint.insert(r1play2.text!, atIndex: 1)
    playerpoint.insert(r1play3.text!, atIndex: 2)
    playerpoint.insert(r1play4.text!, atIndex: 3)
    
    }
     override func viewDidLoad() {
        super.viewDidLoad()
        print("playscore[0] \(playscore[0])")

           }
   
    @IBAction func dataread(sender: AnyObject) {
        let ud = NSUserDefaults.standardUserDefaults()
        
        var udHoge: Int!
        
        // (´・ω・｀)をhogeに設定
        // Stringのhogeの値を取得
      
        // 今登録したものが表示されるはず
        if((ud.objectForKey("gamecount")) != nil) {
            //println(udHoge)
        }
        
    }
    func scoreboard(playerspoint2: [String]){
          let ud = NSUserDefaults.standardUserDefaults()
        
        var countup:Int?
        var udHoge: Int!    // self.modalPresentationStyle=UIModalPresentationStyle.self
        var udflg: Int!
        var wincount:Int!
        var winrate:Float!
        udHoge = ud.integerForKey("gamecount")
        
        winrate=ud.floatForKey("winrate")
  let maxindex=playerspoint2.maxElement()!
        let maxfindindex=playerspoint2.indexOf(maxindex)
        
       
        if gamecountflg{
            if maxfindindex==0 {
                print("win ")
                win=ud.integerForKey("win")
                win=win+1
                ud.setInteger(win, forKey: "win")
            }
            
            
            if  round==4 {
                
                 var finalwinner=finalscore.maxElement()!
                var finalwinnerfind=finalscore.indexOf(finalwinner)
                if finalwinnerfind==0{
                   
                    finalwincount=ud.integerForKey("finalwincount")
                    finalwincount=finalwincount+1
                    ud.setInteger(finalwincount, forKey: "finalwincount")
                     ud.synchronize()
                    print("確認用finalwincount　\(finalwincount)")
                }
                
                if(ud.integerForKey("finalroundcount")==0) {
                    
                    finalroundcount=1
                   finalwincount=ud.integerForKey("finalwincount")
                 finalwinrate=100*(Float)(finalwincount)
                  ud.setFloat(finalwinrate, forKey: "finalwinrate")
                    ud.setInteger(finalroundcount, forKey: "finalroundcount")
                    ud.synchronize()
                }
                else {
                    print("finalroundcount is \(finalroundcount)")
                   
                    finalwinrate=ud.floatForKey("finalwinrate")
                    finalroundcount = ud.integerForKey("finalroundcount")
                    finalroundcount=finalroundcount+1
                    finalwincount=ud.integerForKey("finalwincount")
                    finalwinrate=100*(Float)(finalwincount)/(Float)(finalroundcount)
                    
                    ud.setFloat(finalwinrate, forKey: "finalwinrate")
                    
                    print("finalwinrate is \(finalwinrate)")
                    ud.setInteger(finalwincount, forKey: "finalwincount")
                   // datalabel.text=NSString(format: "%3.1f", finalwinrate)
                    
                    // countup=udHoge!+1
                    ud.setInteger(finalroundcount, forKey: "finalroundcount")
                    
                    ud.synchronize()
                    
                }

                            }


            
            if(ud.integerForKey("gamecount")==0) {
                
                countup=1
                
                gametime.text=String(1)
                
                ud.setInteger(countup!, forKey: "gamecount")
                 ud.synchronize()
            }
            else {
                print("count is \(udHoge)")
                // gamecount=gamecount+4
                winrate=ud.floatForKey("winrate")
                countup = ud.integerForKey("gamecount")
                countup=countup!+1
                wincount=ud.integerForKey("win")
                winrate=100*(Float)(wincount)/(Float)(countup!)
                
                ud.setFloat(winrate, forKey: "winrate")
                
                print("winrate is \(winrate)")
                datalabel.text=NSString(format: "%3.1f", winrate) as String
                
                // countup=udHoge!+1
                ud.setInteger(countup!, forKey: "gamecount")
                
                ud.synchronize()
                
            }
        }

        
    }
    
}