//
// title.swift
// delegate_escape
//
// Created by 桑原綾人 on 2014/12/02.
// Copyright (c) 2014年 game. All rights reserved.
//

import UIKit
import SpriteKit
import GameKit
import GoogleMobileAds
protocol vProtocol{
    
    
    
}// つくったプロトコルを設定しておく。

class title: UIViewController,GKGameCenterControllerDelegate,vProtocol,GADBannerViewDelegate/*NADViewDelegate,NADInterstitialDelegate */{
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var startbut: UIButton!
    @IBOutlet weak var scorebut: UIButton!
    @IBOutlet weak var helpbut: UIButton!
    @IBOutlet weak var logo: UIImageView!
    
    // TODO: Replace this test id with your personal ad unit id
    
    @IBOutlet weak var setting: NSLayoutConstraint!
    
        
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController){
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    func showWithSpotIdButtonClicked(sender:UIButton)
    {
        // SpotID
        
          }
    
    
    
    func win()->Int{
        let ud = NSUserDefaults.standardUserDefaults()
        var roundwin:Int?
        roundwin=ud.integerForKey("finalwincount")
        
        if (roundwin != nil ){
            
            return roundwin!
            
        }
        else{
            return 0
        }
        
        
    }
    
    func winper()->Int{
        let ud = NSUserDefaults.standardUserDefaults()
        var roundwin:Float?
        roundwin=ud.floatForKey("finalwinrate")
        
        let floatint:Int!=Int(roundwin!)
        // print("round win \(floatint)")
        if (floatint != nil){
            return floatint!
        }
        else{
            return 0
        }
        
        
    }
    func playround()->Int{
        let ud = NSUserDefaults.standardUserDefaults()
        var roundwin:Int?
        roundwin=ud.integerForKey("gamecount")
        if (roundwin != nil ){
            return roundwin!
        }
        else{
            return 0
        }
        
        
    }
    func finalwinrate()->Int{
        let ud = NSUserDefaults.standardUserDefaults()
        var roundwin:Int?
        roundwin=ud.integerForKey("finalwinrate")
        if (roundwin != nil ){
            return roundwin!
        }
        else{
            return 0
        }
        
        
    }
    
    func winrate()->Int{
        let ud = NSUserDefaults.standardUserDefaults()
        var roundwin:Int?
        roundwin=ud.integerForKey("winrate")
        if (roundwin != nil ){
            return roundwin!
        }
        else{
            return 0
        }
        
        
    }
    
    
    func playroundcount()->Int{
        let ud = NSUserDefaults.standardUserDefaults()
        var roundwin:Int?
        roundwin=ud.integerForKey("finalroundcount")
        if (roundwin != nil ){
            return roundwin!
        }
        else{
            return 0
        }
        
        
    }
    
    
    func roundwin()->Int{
        let ud = NSUserDefaults.standardUserDefaults()
        var roundwin:Int?
        roundwin=ud.integerForKey("win")
        if (roundwin != nil ){
            return roundwin!
        }
        else{
            return 0
        }
        
        
    }
    func authenticateLocalPlayer(){
        
        let localPlayer = GKLocalPlayer.localPlayer()
        
        
        
        localPlayer.authenticateHandler = {(viewController, error) -> Void in
            //self.reportScore(self.win(), leaderboardId: "grp.finalwin")//最終勝ち数
            self.reportScore(self.roundwin(), leaderboardId: "grp.roundwin")//ラウンド勝ち数
            self.reportScore(self.playroundcount(), leaderboardId: "grp.roundcount")//プレイ回数
            self.reportScore(self.winrate(), leaderboardId: "grp.winrate")//ラウンド勝率
            self.reportScore(self.playround(), leaderboardId: "grp.playround")//ラウンド数
            self.reportScore(self.finalwinrate(), leaderboardId: "grp.finalwinrate")//勝率
            self.reportScore(self.win(), leaderboardId: "grp.51score")//最終勝ち数
            if (viewController != nil) {
                self.presentViewController(viewController!, animated: true, completion: nil)
            }
                
            else {
                print((GKLocalPlayer.localPlayer().authenticated))
            }
        }
        
    }
    
    func reportScore(value: Int, leaderboardId: String) {
        let score: GKScore = GKScore()
        score.value = Int64(value)
        score.leaderboardIdentifier = leaderboardId
        let scoreArr:[GKScore] = [score]
        GKScore.reportScores(scoreArr, withCompletionHandler:{(error:NSError?) -> Void in
            if((error != nil)) {
                print("Report: Error")
            } else {
                //    print("Report: OK")
            }
        })    }
    
    override func viewDidLoad() {
      //  var nadView: NADView!
        
        
        
        super.viewDidLoad()
        
        //self.view.addSubview(self.adView)
        
        // Loads the ad over the network
        // self.adView.loadAd()
        
        
        
       // authenticateLocalPlayer()
        
        print("round win \(roundwin())")
        // NADInterstitial.sharedInstance().delegate = self
              // 向き固定の場合の処理をここに書く
        let orientationArray =
        [
            UIInterfaceOrientation.Portrait.rawValue,
            UIInterfaceOrientation.PortraitUpsideDown.rawValue,
            UIInterfaceOrientation.LandscapeLeft.rawValue,
            UIInterfaceOrientation.LandscapeRight.rawValue
        ]
       
        
        
        
        //  reportScore(winper(), leaderboardId: "finalwinrate")
        
        
        // self.view.addSubview(nadView)
        
        
        var bannerView: GADBannerView = GADBannerView()
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Phone){
            bannerView = GADBannerView(adSize:kGADAdSizeBanner) //kGADAdSizeBanner 320x50  kGADAdSizeSmartBannerLandscapeスマートバナー
            bannerView.adUnitID = "ca-app-pub-6028182764254531/1758909401"
            bannerView.rootViewController = self
            bannerView.center=CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height-bannerView.bounds.size.height/2)
            self.view.addSubview(bannerView)
            var request:GADRequest = GADRequest()
            
            
           // bannerView.loadRequest(GADRequest())

            
        }
        else{
           
            
            bannerView = GADBannerView(adSize:kGADAdSizeLeaderboard) //kGADAdSizeSmartBannerLandscapeスマートバナー
        bannerView.adUnitID = "ca-app-pub-6028182764254531/8011996601"
        bannerView.rootViewController = self
        bannerView.center=CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height-bannerView.bounds.size.height/2)
        self.view.addSubview(bannerView)
        var request:GADRequest = GADRequest()
        
        
       // bannerView.loadRequest(GADRequest())
            
        }
        
        
        
        var tran:CGAffineTransform=CGAffineTransformMakeTranslation(self.view.frame.width-40, self.view.frame.height-40)
        var scale=CGAffineTransformScale(view.transform, 0.2*displayscale, 0.2*displayscaley)
        var pi=3.14
        var rote:CGFloat=CGFloat(35.0*M_PI/180.0)
        
        var cardarry=[String](count: 4, repeatedValue: "")
        for t in 0...0{
            var rot=CGFloat(60.0*M_PI/180.0)
            
            cardarry.insert(cardarry[t], atIndex: t)
            var uimage=UIImage(named: cardarry[t])
            var uiiimage=UIImageView(image: uimage)
            uiiimage.transform=CGAffineTransformScale(view.transform, 0.2*displayscale, 0.2*displayscaley)
            // self.view.addSubview(uiiimage)
        }
        logo.transform=CGAffineTransformScale(view.transform, 0.6*displayscale, 0.6*displayscaley)
        //uiimage.transform=tran
        
        //   self.loadtemp()
        let myBound: CGSize = UIScreen.mainScreen().bounds.size
        //start.center=CGPointMake(myBound.width/2, myBound.height/2)
        roundcount=0
        // Do any additional setup after loading the view.
        
        let con = UIGraphicsGetCurrentContext()
        print("displayscale \(displayscale)" )
        print("displayscaley \(displayscaley)" )
        let ciContext = CIContext(options: nil)
        let fil=CIFilter(name: "CISmoothLinearGradient")
        var fil2=CIFilter(name: "CISmoothLinearGradient")
        //var fil=CIFilter(name: "CIStripesGenerator")
        
        var vec1=CIVector(x: myBound.width/2, y: 3*myBound.height)
        
        var vec2=CIVector(x: myBound.width/2, y:  300)
        
        var vec3=CIVector(x: myBound.width/2, y: 0.3*myBound.height)
        
        var vec4=CIVector(x: myBound.width/2, y:  800)
        var startcolor=CIColor(red: 0.2, green:1, blue: 0.2, alpha: 1)
        var endcolor=CIColor(red: 0.14, green: 0.44, blue: 0.12)
        var startcolor2=CIColor(red: 0.2, green:1, blue: 0.2, alpha: 1)
        var endcolor2=CIColor(red: 0.14, green: 0.14, blue: 0.12)
        // fil.setValue(60, forKey: "inputRadius0")
        // fil.setValue(250, forKey: "inputRadius1")
        fil!.setValue(vec1, forKey: "inputPoint0")
        fil!.setValue(vec2, forKey: "inputPoint1")
        
        fil2!.setValue(vec3, forKey: "inputPoint0")
        fil2!.setValue(vec4, forKey: "inputPoint1")
        fil!.setValue(startcolor, forKey: "inputColor0")
        fil!.setValue(endcolor, forKey: "inputColor1")
        fil2!.setValue(startcolor2, forKey: "inputColor1")
        fil2!.setValue(endcolor2, forKey: "inputColor0")
        //     fil.setValue(31, forKey: "inputWidth")
        // fil.setValue(center, forKey: "inputCenter")
        //CGContextRotateCTM(con, 30 * CGFloat(M_PI)/180.0)
        var filteredImageData = fil!.valueForKey(kCIOutputImageKey) as! CIImage
        var filteredImageData2 = fil2!.valueForKey(kCIOutputImageKey) as! CIImage
        var filteredImageRef = ciContext.createCGImage(filteredImageData, fromRect: CGRectMake(0, 0, 2*myBound.width, myBound.height*2))
        var filteredImageRef2 = ciContext.createCGImage(filteredImageData2, fromRect: CGRectMake(0, 0, 2*myBound.width, myBound.height*2))
        var img=UIImage(CGImage: filteredImageRef)
        var img2=UIImage(CGImage: filteredImageRef2)
        
        var startscaleiphone6s:CGFloat=33
        var startscaleipad:CGFloat=50
        var scorescaleiphone6s:CGFloat=33
        var helppscaleiphone6s:CGFloat=33
        var scorescaleipad:CGFloat=50
        var helpipscaleipad:CGFloat=50
        
        
        if displayscale>1.8{
            self.startbut.titleLabel?.font=UIFont.systemFontOfSize(startscaleipad)
            self.scorebut.titleLabel?.font=UIFont.systemFontOfSize(scorescaleipad)
            self.helpbut.titleLabel?.font=UIFont.systemFontOfSize(helpipscaleipad)
            //51 ロゴの高さ調整
            var centerxfinalcount=NSLayoutConstraint(item: logo, attribute: NSLayoutAttribute.TopMargin, relatedBy: NSLayoutRelation.Equal, toItem: super.view, attribute: NSLayoutAttribute.TopMargin, multiplier: 1, constant: 40*displayscaley)
            view.addConstraint(centerxfinalcount)
            
        }
        else  if displayscale>1.2{ //iPhone6S PLUS
            self.startbut.titleLabel?.font=UIFont.systemFontOfSize(startscaleiphone6s)
            self.scorebut.titleLabel?.font=UIFont.systemFontOfSize(scorescaleiphone6s)
            self.helpbut.titleLabel?.font=UIFont.systemFontOfSize(helppscaleiphone6s)
            var centerxfinalcount=NSLayoutConstraint(item: logo, attribute: NSLayoutAttribute.TopMargin, relatedBy: NSLayoutRelation.Equal, toItem: super.view, attribute: NSLayoutAttribute.TopMargin, multiplier: 1, constant: 20*displayscaley)
           view.addConstraint(centerxfinalcount)
            
        }
        else  if displayscale>1.1{ //iPhone6S
            self.startbut.titleLabel?.font=UIFont.systemFontOfSize(startscaleiphone6s)
            self.scorebut.titleLabel?.font=UIFont.systemFontOfSize(scorescaleiphone6s)
            self.helpbut.titleLabel?.font=UIFont.systemFontOfSize(helppscaleiphone6s)
            var centerxfinalcount=NSLayoutConstraint(item: logo, attribute: NSLayoutAttribute.TopMargin, relatedBy: NSLayoutRelation.Equal, toItem: super.view, attribute: NSLayoutAttribute.TopMargin, multiplier: 1, constant: 5*displayscaley)
            view.addConstraint(centerxfinalcount)
            
        }

        else  if displayscale>0.9{ //iPhone5S
            self.startbut.titleLabel?.font=UIFont.systemFontOfSize(startscaleiphone6s)
            self.scorebut.titleLabel?.font=UIFont.systemFontOfSize(scorescaleiphone6s)
            self.helpbut.titleLabel?.font=UIFont.systemFontOfSize(helppscaleiphone6s)
            var centerxfinalcount=NSLayoutConstraint(item: logo, attribute: NSLayoutAttribute.TopMargin, relatedBy: NSLayoutRelation.Equal, toItem: super.view, attribute: NSLayoutAttribute.TopMargin, multiplier: 1, constant: -10*displayscaley)
            view.addConstraint(centerxfinalcount)
            
        }
        else  if displayscale>0.8{ //iPhone4S
            self.startbut.titleLabel?.font=UIFont.systemFontOfSize(startscaleiphone6s)
            self.scorebut.titleLabel?.font=UIFont.systemFontOfSize(scorescaleiphone6s)
            self.helpbut.titleLabel?.font=UIFont.systemFontOfSize(helppscaleiphone6s)
            var centerxfinalcount=NSLayoutConstraint(item: logo, attribute: NSLayoutAttribute.TopMargin, relatedBy: NSLayoutRelation.Equal, toItem: super.view, attribute: NSLayoutAttribute.TopMargin, multiplier: 1, constant: -15*displayscaley)
            view.addConstraint(centerxfinalcount)
            
        }

            
            
        else{
            var centerxfinalcount=NSLayoutConstraint(item: logo, attribute: NSLayoutAttribute.TopMargin, relatedBy: NSLayoutRelation.Equal, toItem: super.view, attribute: NSLayoutAttribute.TopMargin, multiplier: 1, constant: 10*displayscaley)
            view.addConstraint(centerxfinalcount)
            /*
            if #available(iOS 9.0, *) {
            NSLayoutConstraint.activateConstraints([startbut.leadingAnchor.constraintEqualToAnchor(scorebut.topAnchor),scorebut.leadingAnchor.constraintEqualToAnchor(scorebut.topAnchor, constant: 44)])
            } else {
            // Fallback on earlier versions
            }
            */
        }
        
        self.view.backgroundColor=UIColor(patternImage: img)
        self.view.backgroundColor=UIColor(patternImage: img2)
    }
    
    func viewControllerForPresentingModalView() -> UIViewController {
        return self
    }
    /*
    func didFinishLoadInterstitialAdWithStatus(status: NADInterstitialStatusCode) {
        switch(status.rawValue){ case SUCCESS.rawValue:
            print("広告のロードに成功しました。")
            break
        case INVALID_RESPONSE_TYPE.rawValue:
            print("不正な広告タイプです。")
            break
        case FAILED_AD_REQUEST.rawValue:
            print("抽選リクエストに失敗しました。")
            break
        case FAILED_AD_DOWNLOAD.rawValue:
            print("広告のロードに失敗しました。")
            break
        default:
            break
        }
    }
*/
    func loadtemp(){
        let view:UIView = UINib(nibName: "View", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! UIView
        self.view.addSubview(view)
    }
    
    @IBAction func but2(sender: AnyObject) {
        var nex : AnyObject!=self.storyboard?.instantiateViewControllerWithIdentifier("game")
        self.presentViewController(nex as! UIViewController, animated: false, completion: nil)
        
    }
    
    /*@IBAction func but(sender: AnyObject) {
    self.view.window?.rootViewController?.performSegueWithIdentifier("main", sender: nil)
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier=="score" {
            
            let next: ViewController=segue.destinationViewController as! ViewController
            // next.delegate=self
            print("score segue")
        }
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    deinit{
        
      //  NADInterstitial.sharedInstance().delegate = nil
    }
    
}