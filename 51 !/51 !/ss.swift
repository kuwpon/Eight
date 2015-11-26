//
//  ss.swift
//  delegate_escape
//
//  Created by 桑原綾人 on 2014/12/03.
//  Copyright (c) 2014年 game. All rights reserved.
//

import UIKit
import GameKit

class ss: UIViewController {
    var udHoge: Int!
    var roundwincount2:Int!
    var udflg: Int!
    var sss:ss?
   var gamevi:ViewController?
    var roundwinrate2:Float!
 var finalroundcount2:Int!
     var finalwincount2:Int!
    var finalwinrate2:Float!
    //プレイ回数
    @IBOutlet weak var playcount: UILabel!
    // 勝率
    @IBOutlet weak var finalwinrate: UILabel!
    
    @IBOutlet weak var finalwincount: UILabel!
    //ラウンド勝利数
    @IBOutlet weak var roundwincount: UILabel!
    //ラウンド数
    @IBOutlet weak var finalcount: UILabel!
    //ラウンド勝利率
    @IBOutlet weak var roundwinrate: UILabel!
    
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var playkaisuu: UILabel!
    @IBOutlet weak var syoritu: UILabel!
    @IBOutlet weak var syorisuu: UILabel!
    @IBOutlet weak var raundsyori: UILabel!
    @IBOutlet weak var roundsuu: UILabel!
    
    @IBOutlet weak var roundsyoriritu: UILabel!
    
    @IBOutlet weak var closebut: UIButton!
    
    @IBOutlet weak var scorebut: UIButton!
    @IBOutlet weak var score: UILabel!
    /*
    @IBOutlet weak var playcount: UILabel!
    @IBOutlet weak var roundwincount: UILabel!
    
  
    @IBOutlet weak var finalwinrate: UILabel!
    
    @IBOutlet weak var finalcount: UILabel!
    @IBOutlet weak var roundwinrate: UILabel!
*/
    @IBOutlet var constrain: UIView!
    @IBAction func closescore(sender: UIStoryboardSegue){
       self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func close2(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let settingController: UIViewController = storyboard.instantiateViewControllerWithIdentifier("board") as UIViewController
        let vc = self.view?.window?.rootViewController
        vc?.presentViewController(settingController, animated: true, completion: nil)
        
                 }
    
   
    @IBAction func alert(sender: AnyObject) {
              let alert:UIAlertController = UIAlertController(title: "タイトル", message: "メッセージ", preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancel:UIAlertAction = UIAlertAction(title: "Cancel",
            style: UIAlertActionStyle.Cancel,
            handler:{
                (action:UIAlertAction) -> Void in
                self.refresh()
               
        })
        alert.addAction(cancel)
        
        presentViewController(alert, animated: true, completion: {
            
})
        
    }
    func refresh(){
         print("Cancel")
        
        roundwincount.text=roundwincount.text
        
    }
    @IBAction func remove(sender: AnyObject) {
        
        let recordclear = NSLocalizedString("成績クリア",comment: "comment")
       let clear = NSLocalizedString("成績をクリアしますか？",comment: "comment")
         let notifi = NSLocalizedString("通知",comment: "comment")
        let notify = NSLocalizedString("成績をクリアしました。",comment: "comment")

       
        let alertController = UIAlertController(title: String(recordclear), message: String(clear), preferredStyle: .Alert)
    let alert:UIAlertController = UIAlertController(title: String(notifi), message: String(notify), preferredStyle: UIAlertControllerStyle.Alert)
        let otherAction = UIAlertAction(title: "Ok", style: .Default) {
            action in print("pushed OK!")
            let cancel:UIAlertAction = UIAlertAction(title: "Ok",
                style: UIAlertActionStyle.Cancel,
                handler:{
                    (action:UIAlertAction) -> Void in
                    print("Cancel")
                    var timer2 = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("refresh"), userInfo: nil, repeats: false)

                    let appDomain: NSString = NSBundle.mainBundle().bundleIdentifier!
                    NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain as String)
                    self.playcount.text="0"
                    self.finalwinrate.text="0.0"
                    self.roundwincount.text="0"
                    self.roundwinrate.text="0.0"
                    self.finalcount.text="0"
                    self.count.text="0"
            })
            alert.addAction(cancel)
            
            self.presentViewController(alert, animated: true, completion: nil)
            self.view.setNeedsDisplay()

            
            

            // var gameview:UIViewController=GameViewController() as UIViewController
            // self.dismissViewControllerAnimated(false, completion: nil)
            
            // self.view?.window?.rootViewController?.performSegueWithIdentifier("title", sender: self)
            
                      //      self.view?.window?.rootViewController?.performSegueWithIdentifier("title", sender: self)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) {
            action in print("Pushed CANCEL!")
        }
        
        alertController.addAction(otherAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)

        
        
           }
    override func viewDidAppear(animated: Bool) {
    UIApplication.sharedApplication().keyWindow?.rootViewController=self

    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
                

        var yspan:CGFloat=10
        //プレイ回数とラベルの間隔
        var yscale:CGFloat?
         var scoreframey:CGFloat?
         var scoreframeposiy:CGFloat?
        var  displaylabelscale:CGFloat?
        print("mybound.width \(myBound.width)")
        if displayscaley>1.8{
            yscale=200
            scoreframey=180
        scoreframeposiy=110
         displaylabelscale=1.5
           
        }
        else if displayscaley>1.2{
            yscale=2
            scoreframey=230
            scoreframeposiy=130
            displaylabelscale=1.3
        }
        else if displayscaley>1.15{
            yscale=2
            scoreframey=220
            scoreframeposiy=130
            displaylabelscale=1

        }
        else{
            yscale=33
            scoreframey=240
            scoreframeposiy=140
            displaylabelscale=1


                }
        //ボタンイメージを貼付ける
        let clearimage:UIImage?
        let ff=NSLocale.preferredLanguages().first
        print("言語 \(ff)" )
        if ff=="ja" || ff=="ja-JP"   {
            
            clearimage=UIImage(named: "リセット")
                   }
        else{
           clearimage=UIImage(named: "reset")
        }

        scorebut.transform=CGAffineTransformMakeScale(0.8*displaylabelscale!, 0.8*displaylabelscale!)
        
        scorebut.setImage(clearimage, forState: UIControlState.Normal)

        
        let closeimage:UIImage?
        print("言語 \(ff)" )
        if ff=="ja" || ff=="ja-JP"   {
            
            closeimage=UIImage(named: "close")
        }
        else{
            closeimage=UIImage(named: "close")
        }

        closebut.transform=CGAffineTransformMakeScale(0.8*displaylabelscale!, 0.8*displaylabelscale!)
       
      closebut.setImage(closeimage, forState: UIControlState.Normal)
      closebut.layer.zPosition=4
        //rself.view.translatesAutoresizingMaskIntoConstraints()
       var centerxfinalcount=NSLayoutConstraint(item: playcount, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: finalcount, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: -170*displayscale)
       view.addConstraint(centerxfinalcount)
        //プレイ回数と勝率のYの間隔
        var finalwinratefinalcount=NSLayoutConstraint(item: finalwinrate, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: finalcount, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: yspan*displayscaley*displayscaley)
        view.addConstraint(finalwinratefinalcount)
        
        
        var syorituplaykaisuu=NSLayoutConstraint(item: syoritu, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: playkaisuu, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: yspan*displayscaley*displayscaley)
        view.addConstraint(syorituplaykaisuu)
        

        
        var countfinalwinrate=NSLayoutConstraint(item: count, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: finalwinrate, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: yspan*displayscaley*displayscaley)
        view.addConstraint(countfinalwinrate)
       
       
        var syorisuusyoritu=NSLayoutConstraint(item: syorisuu, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: syoritu, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: yspan*displayscaley*displayscaley)
        view.addConstraint(syorisuusyoritu)
        
        var roundwincountcount=NSLayoutConstraint(item: roundwincount, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: count, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: yspan*displayscaley*displayscaley)
        view.addConstraint(roundwincountcount)
        
        
        var  raundsyorisyorisuu=NSLayoutConstraint(item: raundsyori, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: syorisuu, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: yspan*displayscaley*displayscaley)
        view.addConstraint(raundsyorisyorisuu)
        
        var playcountroundwincount=NSLayoutConstraint(item: playcount, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: roundwincount, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: yspan*displayscaley*displayscaley)
        view.addConstraint(playcountroundwincount)
        
        
        var  roundsuuraundsyori=NSLayoutConstraint(item: roundsuu, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: raundsyori, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: yspan*displayscaley*displayscaley)
        view.addConstraint(roundsuuraundsyori)

        var roundwinrateplaycount=NSLayoutConstraint(item: roundwinrate, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: playcount, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: yspan*displayscaley*displayscaley)
        view.addConstraint(roundwinrateplaycount)
        
        
        let  roundsyoririturoundsuu=NSLayoutConstraint(item: roundsyoriritu, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: roundsuu, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: yspan*displayscaley*displayscaley)
        view.addConstraint(roundsyoririturoundsuu)
        
        //スコアボードの枠を描画
        let cont=UIView(frame: CGRectMake(0, 100, 410*displayscale, scoreframey!*displayscaley))
        cont.center=CGPointMake(self.view.frame.size.width/2, scoreframeposiy!*displayscaley)
        //cont.center=self.view.center
        
        cont.layer.borderWidth=5
        cont.layer.borderColor=UIColor(red: 0.43, green: 0.456, blue: 0.42, alpha: 1).CGColor
        cont.layer.cornerRadius=11
        self.view.addSubview(cont)
        
        
let ud = NSUserDefaults.standardUserDefaults()
        
         udHoge = ud.integerForKey("gamecount")
   roundwincount2=ud.integerForKey("win")
   roundwinrate2=ud.floatForKey("winrate")
   finalroundcount2=ud.integerForKey("finalroundcount")
   finalwinrate2=ud.floatForKey("finalwinrate")
        finalwincount2=ud.integerForKey("finalwincount")
         count.text=String(finalwincount2)
        print("確認用finalwincount　\(finalwinrate2)")
        if finalwinrate2==nil{
            finalwinrate2=0.0
            finalwincount2=0
            finalwinrate.text=NSString(format: "%3.1f", finalwinrate2) as String
          //  finalwincount.text=NSString(format: "%df", finalwincount2)

        }
        else{
                    }
        //finalwincount.text=String(ud.integerForKey("finalroundcount")
        

        finalwinrate2=ud.floatForKey("finalwinrate")
             finalwinrate.text=NSString(format: "%3.1f", finalwinrate2) as String
        finalcount.text=String(finalroundcount2)
        //finalwincount.text=String(finalwincount2)
        playcount.text=String(udHoge)
        roundwincount.text=String(roundwincount2)
        roundwinrate.text=NSString(format: "%3.1f", roundwinrate2) as String
        // Do any additional setup after loading the view.
        let fontsize:CGFloat=14
        self.playcount.font=UIFont.systemFontOfSize(displayscale*fontsize)
        self.finalwinrate.font=UIFont.systemFontOfSize(displayscale*fontsize)
        self.roundwincount.font=UIFont.systemFontOfSize(displayscale*fontsize)
        self.finalcount.font=UIFont.systemFontOfSize(displayscale*fontsize)
        self.roundwinrate.font=UIFont.systemFontOfSize(displayscale*fontsize)
        self.count.font=UIFont.systemFontOfSize(displayscale*fontsize)
        self.playkaisuu.font=UIFont.systemFontOfSize(displayscale*fontsize)
        self.syoritu.font=UIFont.systemFontOfSize(displayscale*fontsize)
        self.syorisuu.font=UIFont.systemFontOfSize(displayscale*fontsize)
        self.roundsuu.font=UIFont.systemFontOfSize(displayscale*fontsize)
        self.raundsyori.font=UIFont.systemFontOfSize(displayscale*fontsize)
        self.roundsyoriritu.font=UIFont.systemFontOfSize(displayscale*fontsize)
        self.score.font=UIFont.systemFontOfSize(displayscale*fontsize)
        // 勝率
       

    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
