//
//  GameScene.swift
//  delegate_escape
//
//  Created by 桑原綾人 on 2014/11/05.
//  Copyright (c) 2014年 game. All rights reserved.
//

import SpriteKit
import GameplayKit
let myBound: CGSize = UIScreen.mainScreen().bounds.size
var displayscale:CGFloat=myBound.width/568
var displayscaley:CGFloat=myBound.height/320

class GameScene: SKScene {
    var complete:Bool=false
    var complete1:Bool=false
    var complete2:Bool=false
    var complete3:Bool=false
    var complete4:Bool=false
    var complete5:Bool=false
    var complete6:Bool=false
    var complete7:Bool=false
    var complete8:Bool=false
    var complete9:Bool=false
    
    var complete21:Bool=false
    var complete22:Bool=false
    var complete23:Bool=false
    var complete24:Bool=false
    var complete25:Bool=false
    var opencard:[String]!=[]
    var start:Bool=true
    var startcount=0
    var exchange=false
    var exchangeselfflg=false
    var exchangeopenflg=false
    var play2changeflg=false
    var play3changeflg=false
    var play4changeflg=false
    var callflg=false
    var returnbutton:Bool=false
    var changebutton:Bool=false
    
    var turn=0
    var exchangeselfcard:Int?
    var exchangeopencard:Int?
    var openpoint = Array<CGPoint>()
    var playpoint = Array<CGPoint>()
    var cardassemble=Array<String>()
    var t=0
    
    var player:[String]!=[]
    var player2:[String]!=[]
    var play2turnflg:Bool=false
    var play2turncount:Int=0
    var passcount:Int=0
    var playclearflg=false
    var play2clearflg=false
    var play3clearflg=false
    var play4clearflg=false
  
   

    var player1turn:Int=0
    var player2turn:Int=0
    var player3turn:Int=0
    var player4turn:Int=0
    var play2passflg=false
    var play3passflg=false
    var play4passflg=false
    
    
    var player3:[String]!=[]
    var player4:[String]!=[]
    
    var myturn:Bool=false
    var cal=0
    var delegate_escape: SceneEscapeProtocol?
    
    var gamevi:ViewController?
    var play3turn:Bool=false
    var play4turn:Bool=false
    var play2point = Array<CGPoint>()
    var play3point = Array<CGPoint>()
    var play4point = Array<CGPoint>()
    var textures = Array<SKTexture>()
    var textures2 = Array<SKTexture>()
    var textures3 = Array<SKTexture>()
    var returncount=0
    var call:SKSpriteNode!
    var player3score=SKLabelNode(fontNamed: "Gill Sans")
    var myscore=SKLabelNode(fontNamed: "Gill Sans")
    var callen=SKSpriteNode(imageNamed: "call")
    var callja=SKSpriteNode(imageNamed: "コール")
    var returnc:SKSpriteNode!
    var returncen=SKSpriteNode(imageNamed: "Return")
    var returncja=SKSpriteNode(imageNamed: "流す")
    var text=SKLabelNode(fontNamed: "Gill Sans")
    var cardarry=[String](count: 52, repeatedValue: "")
    //var cardarry:[String]=[String]()
    var startonf=SKSpriteNode(imageNamed: "start")
    var starton:SKSpriteNode!
    var startonen=SKSpriteNode(imageNamed: "start")
    var startonja=SKSpriteNode(imageNamed: "スタート")
    
    var ok=SKSpriteNode(imageNamed: "ok")
    var changeturn=0
    
    
    
    var mess=SKLabelNode(fontNamed: "Gill Sans")
    var playermess=SKLabelNode(fontNamed: "Gill Sans")
    var player2mess=SKLabelNode(fontNamed: "Gill Sans")
    var player3mess=SKLabelNode(fontNamed: "Gill Sans")
    var player4mess=SKLabelNode(fontNamed: "Gill Sans")
    var prechangecount=0
    var fukidashi2 = SKSpriteNode(imageNamed: "fuki")
    var fukidashi3 = SKSpriteNode(imageNamed: "fuki")
    var fukidashi4 = SKSpriteNode(imageNamed: "fuki")
    var label1 = SKSpriteNode(imageNamed: "label")
    var label2 = SKSpriteNode(imageNamed: "label2")
    var message2=SKLabelNode(fontNamed: "Gill Sans")
    var message3=SKLabelNode(fontNamed: "Gill Sans")
    var message4=SKLabelNode(fontNamed: "Gill Sans")
    
    var label3 = SKSpriteNode(imageNamed: "label2")
    var label4 = SKSpriteNode(imageNamed: "label2")
    var label2off = SKSpriteNode(imageNamed: "label3")
    var label3off = SKSpriteNode(imageNamed: "label3")
    var label4off = SKSpriteNode(imageNamed: "label3")
    var selflabel = SKSpriteNode(imageNamed: "label2")
    var selflabeloff = SKSpriteNode(imageNamed: "label3")
    var playscore=SKLabelNode(fontNamed: "Gill Sans-Bold")
    var play2core=SKLabelNode(fontNamed: "Gill Sans-Bold")
    var play3core=SKLabelNode(fontNamed: "Gill Sans-Bold")
    var play4core=SKLabelNode(fontNamed: "Gill Sans-Bold")
    
    let callstring = NSLocalizedString("Call",comment: "comment")
    let returnstring = NSLocalizedString("Return",comment: "comment")
    let exchangestring = NSLocalizedString("Exchange",comment: "comment")
    let passstring = NSLocalizedString("Pass",comment: "comment")
    
    var selfclearcount=0
    var waku = SKSpriteNode(imageNamed: "WAKU41")
    var waku2 = SKSpriteNode(imageNamed: "WAKU41")
    var allcardchange:SKSpriteNode!
    var allcardchangen=SKSpriteNode(imageNamed: "exchange")
    var allcardchangeja=SKSpriteNode(imageNamed: "交換")
    var passs:SKSpriteNode!
    var passen=SKSpriteNode(imageNamed: "pass")
    var passja=SKSpriteNode(imageNamed: "passja")
    var player1precut:String?
    var player2precut:String?
    var player3precut:String?
    var player4precut:String?
    var play2ccount:Int=0
    var play2dcount:Int=0
    var play2scount:Int=0
    var play2hcount:Int=0
    var play3ccount:Int=0
    var play3dcount:Int=0
    var play3scount:Int=0
    var play3hcount:Int=0
    var play1ccount:Int=0
    var play1dcount:Int=0
    var play1scount:Int=0
    var play1hcount:Int=0
    //オープンカードとプレイヤカードのx
    var posix:CGFloat=140
    var posix2:CGFloat=50
    var opencardposix:CGFloat=155
    var buttonscale:CGFloat=0.23
    override func didMoveToView(view: SKView) {
        let ff=NSLocale.preferredLanguages().first
        print("言語 \(ff)" )
        if ff=="ja" || ff=="ja-JP"  {
            call=callja
            passs=passja
            allcardchange=allcardchangeja
           
            starton=startonja
        }
        else{
            call=callen
            passs=passen
            allcardchange=allcardchangen
            returnc=returncen
            starton=startonen
        }
        
        let con = UIGraphicsGetCurrentContext()
        print("displayscale \(displayscale)" )
        var ciContext = CIContext(options: nil)
        var fil=CIFilter(name: "CISmoothLinearGradient")
        //var fil=CIFilter(name: "CIStripesGenerator")
        
        var vec1=CIVector(x: myBound.width/2, y: 3*myBound.height)
        
        var vec2=CIVector(x: myBound.width/2, y:  300)
        var startcolor=CIColor(red: 0.2, green:1, blue: 0.2, alpha: 1)
        var endcolor=CIColor(red: 0.14, green: 0.44, blue: 0.12)       // fil.setValue(60, forKey: "inputRadius0")
        // fil.setValue(250, forKey: "inputRadius1")
        passs.setScale(buttonscale*displayscale)
       
        call.setScale(buttonscale*displayscale)
        allcardchange.setScale(buttonscale*displayscale)
        ok.setScale(buttonscale*displayscale)
        
        fil!.setValue(vec1, forKey: "inputPoint0")
        fil!.setValue(vec2, forKey: "inputPoint1")
        fil!.setValue(startcolor, forKey: "inputColor0")
        fil!.setValue(endcolor, forKey: "inputColor1")
        //     fil.setValue(31, forKey: "inputWidth")
        // fil.setValue(center, forKey: "inputCenter")
        //CGContextRotateCTM(con, 30 * CGFloat(M_PI)/180.0)
        var filteredImageData = fil!.valueForKey(kCIOutputImageKey) as! CIImage
        var filteredImageRef = ciContext.createCGImage(filteredImageData, fromRect: CGRectMake(0, 0, 2*myBound.width, myBound.height*2))
        var img=UIImage(CGImage: filteredImageRef)
        
        var vi=UIImageView(image: img)
        
        vi.transform=CGAffineTransformMakeRotation(CGFloat(30*M_PI/180))
        vi.backgroundColor=UIColor(patternImage: UIImage(CGImage: filteredImageRef))
        
        var background=SKTexture(image: img)
        //  var background=SKTexture(imageNamed: "back")
        
        var sknode=SKSpriteNode(texture: background)
        sknode.setScale(1)
        playclearflg=false
        play2clearflg=false
        play3clearflg=false
        play4clearflg=false
        
        
        
        self.addChild(sknode)
        
        let arr:[String] = ["fe","e","gee","gea","aad"]
        // シャッフルして表示
        
        var lent=[0,1,2,3,4,5,6,7,8,9,10,11,12]
        lent.sortInPlace{(_,_) in arc4random()<arc4random()}
        var lent2=["c","d","h","s"]
        lent2.sortInPlace{(_,_) in arc4random()<arc4random()}
        
        repeat{
            for i in 0...3{
                
                for t in 0...12{
                    
                    cardarry[13*i+t]=lent2[i]+String(lent[t])
                    
                    
                    //  cardarry.sortInPlace { _,_ in arc4random() < arc4random() }
                }
            }
            cardarry.insert("x1", atIndex: 52)
            
            //ここをコメントアウトし、下のコメントを外すと、任意のカード手配になる。
            
            cal++
        }while cal>1
        if #available(iOS 9.0, *) {
            let randomarray:[String]=GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(cardarry) as! [String]
            cardarry=randomarray
            
        } else {
            cardarry.sortInPlace { _,_ in arc4random() < arc4random() }
            
            // Fallback on earlier versions
        }
        /*
        
        cardarry[0]="c2"
        cardarry[1]="c3"
        cardarry[2]="c4"
        cardarry[3]="c5"
        cardarry[4]="c6"
        
        cardarry[5]="d4"
        cardarry[6]="d12"
        cardarry[7]="d3"
        cardarry[8]="d1"
        cardarry[9]="c5"
        
        cardarry[10]="s5"
        cardarry[11]="s12"
        cardarry[12]="s10"
        cardarry[13]="s9"
        cardarry[14]="s11"
        
        cardarry[15]="d9"
        cardarry[16]="h12"
        cardarry[17]="h3"
        cardarry[18]="h1"
        cardarry[19]="h0"
        
        cardarry[20]="s4"
        cardarry[21]="s6"
        cardarry[22]="s7"
        cardarry[23]="c8"
        cardarry[24]="c7"
        */
        /*
        for i in 0...26{
        cardarry[25+i]="c2"
        }
        */
        
        /*
        for i in 0...4{
        cardarry.insert(<#newElement: T#>, atIndex: i)
        }
        */
        for i in 0...4{
            player.insert(cardarry[i], atIndex: i)
            player2.insert(cardarry[5+i], atIndex: i)
            player3.insert(cardarry[10+i], atIndex: i)
            player4.insert(cardarry[15+i], atIndex: i)
            opencard.insert(cardarry[20+i], atIndex: i)
        }
        
        for i in 0...27{
            cardassemble.insert(cardarry[25+i], atIndex: i)
        }
          let openpointposition:CGFloat=155
        for t in 0...52{
            var l:CGFloat=CGFloat(t)
            
            var imgname=cardarry[t]
            var front=SKTexture(imageNamed: imgname)
            
            var back = SKTexture(imageNamed: "z01")
            textures.append(front)
            textures.append(back)
            
            var kin=SKSpriteNode(texture: back)
            
            kin.name=imgname
           
            kin.position = CGPointMake((((3)*posix2)+posix)*displayscale ,openpointposition*displayscaley)
            kin.zPosition=100
            kin.setScale(0.25*displayscale)
            
            self.addChild(kin)
            
            
        }
        // ラベル高さ
        waku.setScale(0.25*displayscale)
        waku2.setScale(0.25*displayscale)
        waku.hidden=true
        waku2.hidden=true
        var labelscale:CGFloat=0.8
        var labelheight2:CGFloat=202
        var fukidashiposition:CGFloat=305
        var fukidashimessage:CGFloat=303
        var fukidashiscale:CGFloat=0.38
        var playerscore:CGFloat=200
        var labelheight:CGFloat=208
        var playermessfontsize:CGFloat=15
        fukidashi2.position=CGPointMake(92*displayscale, fukidashiposition*displayscaley)
        
        fukidashi2.setScale(fukidashiscale*displayscaley)
        fukidashi2.position=CGPointMake(92*displayscale, fukidashiposition*displayscaley)
        fukidashi2.zPosition=10
        fukidashi2.hidden=true
        message2.zPosition=21
        message2.fontColor=UIColor.blackColor()
        message2.fontSize=11*displayscaley
        message2.position=CGPointMake(92*displayscale, fukidashimessage*displayscaley)
        message2.hidden=true
        fukidashi3.setScale(fukidashiscale*displayscaley)
        fukidashi3.position=CGPointMake(275*displayscale, fukidashiposition*displayscaley)
        fukidashi3.zPosition=10
        fukidashi3.hidden=true
        message3.zPosition=21
        message3.fontColor=UIColor.blackColor()
        message3.fontSize=11*displayscaley
        message3.position=CGPointMake(275*displayscale, fukidashimessage*displayscaley)
        message3.hidden=true
        fukidashi4.position=CGPointMake(459*displayscale, fukidashiposition*displayscaley)
        fukidashi4.setScale(fukidashiscale*displayscaley)
        fukidashi4.zPosition=10
        fukidashi4.hidden=true
        message4.zPosition=21
        message4.fontColor=UIColor.blackColor()
        message4.fontSize=11*displayscaley
        message4.position=CGPointMake(459*displayscale, fukidashimessage*displayscaley)
        message4.hidden=true
        /*
        play2core.hidden=true
        play3core.hidden=true
        play4core.hidden=true
        */
        var buttonposi:CGFloat=485
        play2core.position=CGPointMake(145*displayscale, playerscore*displayscaley)
        
        play2core.fontSize=18*displayscaley
        play2core.fontColor=UIColor.blackColor()
        play2core.zPosition=6
        
        play3core.position=CGPointMake(330*displayscale, playerscore*displayscaley)
        play3core.fontColor=UIColor.blackColor()
        play3core.fontSize=18*displayscaley
        play3core.zPosition=6
        
        play4core.fontColor=UIColor.blackColor()
        play4core.position=CGPointMake(520*displayscale, playerscore*displayscaley)
        play4core.fontSize=18*displayscaley
        play4core.zPosition=6
        
        
        
        selflabel.position=CGPointMake(289*displayscale, 18*displayscaley)
        selflabel.setScale(labelscale*displayscaley)
        selflabel.hidden=true
        selflabeloff.position=CGPointMake(289*displayscale, 18*displayscaley)
        selflabeloff.setScale(labelscale*displayscaley)
        selflabeloff.hidden=false
        playermess.position=CGPointMake(289*displayscale, 13*displayscaley)
        playermess.fontSize=playermessfontsize*displayscaley
        playermess.text="player1"
        playermess.fontColor=UIColor.blackColor()
        player2mess.position=CGPointMake(97*displayscale, labelheight2*displayscaley)
        player2mess.fontSize=playermessfontsize*displayscaley
        player2mess.text="player2"
        player2mess.zPosition=1
        player2mess.fontColor=UIColor.blackColor()
        
        label2.position=CGPointMake(97*displayscale, labelheight*displayscaley)
        label2.setScale(labelscale*displayscaley)
        label2.hidden=true
        label2off.position=CGPointMake(97*displayscale, labelheight*displayscaley)
        label2off.setScale(labelscale*displayscaley)
        label2off.hidden=false
        
        
        label3.position=CGPointMake(284*displayscale, labelheight*displayscaley)
        label3.hidden=true
        label3off.position=CGPointMake(284*displayscale, labelheight*displayscaley)
        label3off.setScale(labelscale*displayscaley)
        label3off.hidden=false
        player3mess.position=CGPointMake(279*displayscale, labelheight2*displayscaley)
        player3mess.fontSize=playermessfontsize*displayscaley
        player3mess.text="player3"
        player3mess.zPosition=3
        player3mess.fontColor=UIColor.blackColor()
        
        
        label3.setScale(labelscale*displayscaley)
        label4.position=CGPointMake(470*displayscale, labelheight*displayscaley)
        label4.setScale(labelscale*displayscaley)
        label4.hidden=true
        label4off.position=CGPointMake(470*displayscale, labelheight*displayscaley)
        label4off.setScale(labelscale*displayscaley)
        label4off.hidden=false
        player4mess.position=CGPointMake(470*displayscale, labelheight2*displayscaley)
        player4mess.fontSize=playermessfontsize*displayscaley
        player4mess.text="player4"
        player4mess.zPosition=1
        player4mess.fontColor=UIColor.blackColor()
        label1.position=CGPointMake(95*displayscale, 18*displayscaley)
        label1.setScale(0.48*displayscaley)
        
        mess.position=CGPointMake(95*displayscale, 14*displayscaley)
        mess.fontSize=10*displayscaley
        let fmt = NSLocalizedString("スタートを押してください",comment: "comment")
        self.mess.text = String(fmt)
        
        
        player3score.hidden=true
        
        
        myscore.position=CGPointMake(337*displayscale, 11*displayscaley)
        //自分のスコア
        myscore.fontColor=UIColor.blackColor()
        myscore.fontSize=20*displayscaley
        myscore.horizontalAlignmentMode=SKLabelHorizontalAlignmentMode.Center
        myscore.name="myscore"
        
        
        
        call.name="call"
        
        ok.position=CGPointMake(buttonposi*displayscale, 60*displayscaley)
        
        ok.hidden=true
        starton.position=CGPointMake(buttonposi*displayscale, 30*displayscaley)
        starton.setScale(buttonscale*displayscale)
        
        startonf.position=CGPointMake(buttonposi*displayscale, 436*displayscaley)
        startonf.setScale(0.2*displayscale)
        startonf.hidden=true
        
        starton.name="text"
        startonf.name="text"
        
        /*
        text.position=CGPointMake(113, 52)
        text.text = "start"
        text.fontColor=UIColor(red: 0.8, green: 0.8, blue: 0.1, alpha: 1)
        text.fontSize=20
        text.horizontalAlignmentMode=SKLabelHorizontalAlignmentMode.Center
        text.name="text"
        text.zPosition=1
        */
        call.position=CGPointMake(buttonposi*displayscale, 180*displayscaley)
        
       
        
        allcardchange.position=CGPointMake(buttonposi*displayscale, 120*displayscaley)
        passs.position=CGPointMake(buttonposi*displayscale, 90*displayscaley)
        
        
        passs.name="pass"
        
        
        allcardchange.name="change"
        var reset=SKLabelNode(fontNamed: "Gill Sans")
        reset.position=CGPointMake(32*displayscale, 22*displayscaley)
        reset.text = "reset"
        reset.fontColor=UIColor(red: 0.8, green: 0.8, blue: 0.1, alpha: 1)
        reset.fontSize=20*displayscaley
        reset.horizontalAlignmentMode=SKLabelHorizontalAlignmentMode.Center
        reset.name="reset"
        ok.name="ok"
        call.hidden=true
        self.passs.hidden=true
        self.allcardchange.hidden=true
        
        //  self.ok.hidden=false
        //  self.call.hidden=false
        
        
        self.addChild((play2core))
        self.addChild((play3core))
        self.addChild((play4core))
        self.addChild(ok)
        self.addChild(waku)
        self.addChild(waku2)
        self.addChild(fukidashi2)
        self.addChild(message2)
        self.addChild(fukidashi3)
        self.addChild(message3)
        self.addChild(fukidashi4)
        self.addChild(message4)
        
        self.addChild(selflabel)
        self.addChild(selflabeloff)
        self.addChild(playermess)
        self.addChild(player2mess)
        self.addChild(player3mess)
        self.addChild(player4mess)
        self.addChild(label1)
        self.addChild(label2)
        self.addChild(label3)
        self.addChild(label4)
        self.addChild(label2off)
        self.addChild(label3off)
        self.addChild(label4off)
        
        self.addChild(mess)
        self.addChild(starton)
        
        self.addChild(myscore)
        self.addChild(text)
        
        self.addChild(passs)
        self.addChild(allcardchange)
        //self.addChild(reset)
        self.addChild(player3score)
        self.addChild(call)
    }
    
    func faceup(head: [String],t: Int){
        let img=self.childNodeWithName(head[t])
        let back=SKTexture(imageNamed: head[t])
        
        img?.runAction(SKAction.setTexture(back))
        
    }
    
    func facedown(head: [String],t: Int){
        let img=self.childNodeWithName(head[t])
        let back=SKTexture(imageNamed: "z01")
        
        img?.runAction(SKAction.setTexture(back))
        
    }
    
    func selfchange(excard3:Int,cardnum2:Int) {
        
        /*  ここから自分*/
       
        
        passs.hidden=true
        passs.userInteractionEnabled=true
        waku.hidden=true
        waku2.hidden=true
        ok.userInteractionEnabled=true
        var dummyplayer=[String]()
        var dummyopencard=[String]()
        let imcard2=self.childNodeWithName(opencard[cardnum2])
        let actcard3=SKAction.moveTo(playpoint[excard3], duration: 0.5)
        play4turn=false
        //print("clear フラグ　\(clear(player))")
        myturn=true
        imcard2?.runAction(actcard3)
        print("excard3 \(excard3)")
        print("cardnum2 \(cardnum2)")
        let excard4=self.childNodeWithName(player[excard3])
        let actcard4=SKAction.moveTo(openpoint[cardnum2], duration: 0.5)
        dummyopencard.append(opencard[cardnum2])
        dummyplayer.append(player[excard3])
        player[excard3]=dummyopencard[0]
        opencard[cardnum2]=dummyplayer[0]
        myscore.text=String(point(player))
      
        player1precut=Preplayercharcut(player[excard3])
        excard4?.runAction(actcard4,completion: {
            
            
            if selfclear(self.player){
                self.call.hidden=false
                self.call.userInteractionEnabled=false
                
                //self.mess.text="CallまたはPassしてください"
                
                let fmt = NSLocalizedString("CallまたはPassしてください",comment: "comment")
                self.mess.text = String(fmt)
                
                
                self.allcardchange.hidden=true
                
                self.allcardchange.userInteractionEnabled=true
                self.playclearflg=true
                self.passs.hidden=false
                self.ok.hidden=true
                self.ok.userInteractionEnabled=true
                self.passs.userInteractionEnabled=false
                //  self.clearscore()
            }
            else if selfclear(self.player)==false {
                self.change2()}     })
        player1turn=player1turn+1
    }
    /* 自分以外のプレイヤーのreturncard  */
   
    
    /*
    img5?.runAction(act5, completion:{ self.complete=true
    
    if self.complete==true{
    img4?.runAction(act4, completion: {self.complete1=true
    if self.complete1==true{
    img3?.runAction(act3, completion:{self.complete2=true
    if self.complete2==true{
    img2?.runAction(act2, completion:{self.complete3=true
    
    if self.complete3==true{
    img1?.runAction(act1,completion:{self.complete4=true
    if self.complete4==true{
    /*img?.runAction(SKAction.animateWithTextures(self.textures2, timePerFrame: 0.1))*/
    
    self.faceup(self.player,t: 0)
    self.faceup(self.player,t: 1)
    self.faceup(self.player,t: 2)
    self.faceup(self.player,t: 3)
    self.faceup(self.player,t: 4)
    }}
    )}})}})}})}})
    
    */
    
    func pass(){
        // 自分セルフ
        if(myturn && passcount>1) {
           
            self.allcardchange.userInteractionEnabled=false
            self.change2()
            
        }
            //else if play2changeflg{  self.change3() }
        else if (passcount==1) && selfclear(player){
            self.change2()
            
        }
        
        
    }
    
    func cardchange(){
        
        var dummyplayer=[String]()
        var dummyopencard=[String]()
        var dummyplayer2=[String]()
        var dummyopencard2=[String]()
        var dummyplayer3=[String]()
        var dummyopencard3=[String]()
        var dummyplayer4=[String]()
        var dummyopencard4=[String]()
        player4mess.text="player4"
        if myturn{
            if changeturn==0{
                for var i=0;i<5;i++ {
                    let sound=SKAction.playSoundFileNamed("ext.wav", waitForCompletion: false)
                    self.runAction(sound)
                    dummyplayer.insert(player[i], atIndex: i)
                    dummyopencard.append(opencard[i])
                    let opencardpoint=self.childNodeWithName(opencard[i])
                    let selfpoint=SKAction.moveTo(playpoint[i], duration: 0.3)
                    opencardpoint?.runAction(selfpoint)
                    let selfcardpoint2=self.childNodeWithName(player[i])
                    let selfpoint2=SKAction.moveTo(openpoint[i], duration: 0.3)
                    selfcardpoint2?.runAction(selfpoint2)
                    player[i]=dummyopencard[i]
                    opencard[i]=dummyplayer[i]
                    print("player\(player)")
                    print("opencard\(opencard)")
                    myscore.text=String(point(player))
                    changeturn=changeturn+1
                    
                }
                var timer2 = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("waitchange22"), userInfo: nil, repeats: false)
            }
        }
        else if play2changeflg{
            let sound=SKAction.playSoundFileNamed("ext.wav", waitForCompletion: false)
            self.runAction(sound)
            
            let play2wait=SKAction.waitForDuration(1)
            var completetra:Bool=false
            
            for var i=0;i<5;i++ {
                dummyplayer2.insert(player2[i], atIndex: i)
                dummyopencard2.append(opencard[i])
                let opencardpoint=self.childNodeWithName(opencard[i])
                let selfpoint=SKAction.moveTo(play2point[i], duration: 0.5)
                opencardpoint?.runAction(selfpoint)
                
                let selfcardpoint2=self.childNodeWithName(player2[i])
                let selfpoint2=SKAction.moveTo(openpoint[i], duration: 0.5)
                let waitplay=SKAction.sequence([selfpoint2,play2wait])
                
                player2[i]=dummyopencard2[i]
                opencard[i]=dummyplayer2[i]
                self.faceup(opencard, t: i)
                self.facedown(player2, t: i)
                let img16=self.childNodeWithName(player2[0])
                let img17=self.childNodeWithName(player2[1])
                let img18=self.childNodeWithName(player2[2])
                let img19=self.childNodeWithName(player2[3])
                let img20=self.childNodeWithName(player2[4])
                
                img16?.zPosition=1
                img17?.zPosition=2
                img18?.zPosition=3
                img19?.zPosition=4
                img20?.zPosition=5
                prechangecount=i
                selfcardpoint2?.runAction(waitplay)
            }
            
            var timer2 = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("waitchange3"), userInfo: nil, repeats: false)
        }
        else if play3changeflg{
            let sound=SKAction.playSoundFileNamed("ext.wav", waitForCompletion: false)
            self.runAction(sound)
            let play3wait=SKAction.waitForDuration(1)
            var completetra:Bool=false
            
            for var i=0;i<5;i++ {
                dummyplayer3.insert(player3[i], atIndex: i)
                dummyopencard3.append(opencard[i])
                let opencardpoint=self.childNodeWithName(opencard[i])
                let selfpoint=SKAction.moveTo(play3point[i], duration: 0.5)
                opencardpoint?.runAction(selfpoint)
                
                let selfcardpoint2=self.childNodeWithName(player3[i])
                let selfpoint2=SKAction.moveTo(openpoint[i], duration: 0.5)
                let waitplay=SKAction.sequence([selfpoint2,play3wait])
                
                player3[i]=dummyopencard3[i]
                opencard[i]=dummyplayer3[i]
                self.faceup(opencard, t: i)
                self.facedown(player3, t: i)
                let img16=self.childNodeWithName(player3[0])
                let img17=self.childNodeWithName(player3[1])
                let img18=self.childNodeWithName(player3[2])
                let img19=self.childNodeWithName(player3[3])
                let img20=self.childNodeWithName(player3[4])
                
                img16?.zPosition=1
                img17?.zPosition=2
                img18?.zPosition=3
                img19?.zPosition=4
                img20?.zPosition=5
                prechangecount=i
                selfcardpoint2?.runAction(waitplay)
            }
            print("player2 array\(player2)")
            print("player3 array\(player3)")
            print("opencard array\(opencard)")
            print("afterchange")
            var timer2 = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("waitchange3"), userInfo: nil, repeats: false)
        }
        else if play4changeflg{
            let sound=SKAction.playSoundFileNamed("ext.wav", waitForCompletion: false)
            self.runAction(sound)
            
            
            let play3wait=SKAction.waitForDuration(1)
            var completetra:Bool=false
            for var i=0;i<5;i++ {
                dummyplayer4.insert(player4[i], atIndex: i)
                dummyopencard4.append(opencard[i])
                let opencardpoint=self.childNodeWithName(opencard[i])
                let selfpoint=SKAction.moveTo(play4point[i], duration: 0.5)
                opencardpoint?.runAction(selfpoint)
                
                let selfcardpoint2=self.childNodeWithName(player4[i])
                let selfpoint2=SKAction.moveTo(openpoint[i], duration: 0.5)
                let waitplay=SKAction.sequence([selfpoint2,play3wait])
                
                player4[i]=dummyopencard4[i]
                opencard[i]=dummyplayer4[i]
                self.faceup(opencard, t: i)
                self.facedown(player4, t: i)
                let img16=self.childNodeWithName(player4[0])
                let img17=self.childNodeWithName(player4[1])
                let img18=self.childNodeWithName(player4[2])
                let img19=self.childNodeWithName(player4[3])
                let img20=self.childNodeWithName(player4[4])
                
                img16?.zPosition=1
                img17?.zPosition=2
                img18?.zPosition=3
                img19?.zPosition=4
                img20?.zPosition=5
                prechangecount=i
                selfcardpoint2?.runAction(waitplay)
            }
            print("player2 array\(player2)")
            print("player3 array\(player3)")
            print("opencard array\(opencard)")
            print("afterchange")
            var timer2 = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("waitchange3"), userInfo: nil, repeats: false)
            
        }
        if changeturn==1{
            
        }
    }
    func clearscore(){
        myscore.hidden=false
        
        play2core.hidden=false
        play3core.hidden=false
        play4core.hidden=false
        myscore.text=String(point(player))
        play2core.text=String(point(player2))
        play3core.text=String(point(player3))
        play4core.text=String(point(player4))
        var clearscore2 = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("clearscore2"), userInfo: nil, repeats: false)    }
    
    
    
    func clearscore2(){
        var viewcon:ViewController?
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var po=Array<Int>()
        po.insert(point(player), atIndex: 0)
        po.insert(point(player2), atIndex: 1)
        po.insert(point(player3), atIndex: 2)
        po.insert(point(player4), atIndex: 3)
        var playe1rrank:String?
        var playe2rrank:String?
        var playe3rrank:String?
        var playe4rrank:String?
        
        
        var maxt=max(point(player),point(player2),point(player3),point(player4))
        var maxa=po.filter{$0==maxt}
        var jokerflg=jokerinclude(player, player2: player2, player3: player3, player4: player4).0
        var jokerindex=jokerinclude(player, player2: player2, player3: player3, player4: player4).1
        var jokerindex2=jokerinclude(player, player2: player2, player3: player3, player4: player4).2
        
        //print("jokerflg \(jokerflg)")
        //   print("jokerindex \(jokerindex)")
        // print("jokerindex2 \(jokerindex2)")
        var twice51count=po.filter{$0==51}
        var maxindex52=po.indexOf(52)
        if (maxindex52==0){
            appDelegate.play1score=51
            //  print(" maxindex52 \(maxindex52)")
        }
        else if maxindex52==1{
            appDelegate.play2score=51
            print(" maxindex52 \(maxindex52)")
            
        }
        else if maxindex52==2{
            appDelegate.play3score=51
            print(" maxindex52 \(maxindex52)")
            
        }
        else if maxindex52==3{
            appDelegate.play4score=51
            print(" maxindex52 \(maxindex52)")
            
        }
        
        
        
        if (maxindex52 != nil){
            
            
        }
        
        if  playclearflg && callflg==true{
            // プレイヤーが51の場合
            
            if maxindex52==0{
                myscore.text=String(51)
                play2core.text=String(point(player2))
                play3core.text=String(point(player3))
                play4core.text=String(point(player4))
                appDelegate.play1score=51
                appDelegate.play2score=point(player2)
                appDelegate.play3score=point(player3)
                appDelegate.play4score=point(player4)
                var p1rank=rank(51, b: point(player2), c: point(player3), d: point(player4)).0
                var p2rank=rank(51, b: point(player2), c: point(player3), d: point(player4)).1
                var p3rank=rank(51, b: point(player2), c: point(player3), d: point(player4)).2
                var p4rank=rank(51, b: point(player2), c: point(player3), d: point(player4)).3
                rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank)
                
                
                playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).0
                player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).1
                player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).2
                player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).3
                
            }
                
            else if (point(player)==maxt && maxa.count==1) && jokerflg==false{
                myscore.text=String(point(player))
                play2core.text=String(point(player2))
                play3core.text=String(point(player3))
                play4core.text=String(point(player4))
                appDelegate.play1score=point(player)
                appDelegate.play2score=point(player2)
                appDelegate.play3score=point(player3)
                appDelegate.play4score=point(player4)
                var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank)
                playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).0
                player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).1
                player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).2
                player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).3
            }
                
            else if ((point(player)==maxt && maxa.count>1) || (point(player)<maxt )) && (jokerflg==false){
                myscore.text=String(0)
                play2core.text=String(point(player2))
                play3core.text=String(point(player3))
                play4core.text=String(point(player4))
                appDelegate.play1score=0
                appDelegate.play2score=point(player2)
                appDelegate.play3score=point(player3)
                appDelegate.play4score=point(player4)
                var p1rank=rank(0, b: point(player2), c: point(player3), d: point(player4)).0
                var p2rank=rank(0, b: point(player2), c: point(player3), d: point(player4)).1
                var p3rank=rank(0, b: point(player2), c: point(player3), d: point(player4)).2
                var p4rank=rank(0, b: point(player2), c: point(player3), d: point(player4)).3
                rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank)
                playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).0
                player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).1
                player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).2
                player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).3
            }
            else if jokerflg && point(player)>=maxt  {
                
                switch  jokerindex{
                case 0:
                    myscore.text=String(0)
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    
                    appDelegate.play1score=0
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(0, b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(0, b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(0, b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(0, b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).3
                case 1:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).3
                case 2:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank ,b: p2rank, c: p3rank+jokerindex2, d: p4rank)
                    playermess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).0
                    player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).1
                    player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).2
                    player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).3
                case 3:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2)
                    playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).0
                    player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).1
                    player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).2
                    player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).3
                default:
                    break
                }
                
                
                
            }
                //プレイヤーがコールしたが、ジョーカーを持っている他の2プレイヤーよりも点数が低い場合 プレイヤーは0点になる
                
            else if jokerflg && point(player)<maxt  {
                
                switch  jokerindex{
                case 0:
                    
                    myscore.text=String(0)
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    appDelegate.play1score=0
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(0, b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(0, b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(0, b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(0, b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).3
                    
                    
                case 1:
                    
                    myscore.text=String(0)
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    appDelegate.play1score=0
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).3
                case 2:
                    myscore.text=String(0)
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    appDelegate.play1score=0
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                    
                    rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank)
                    playermess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).0
                    player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).1
                    player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).2
                    player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).3
                case 3:
                    myscore.text=String(0)
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    appDelegate.play1score=0
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).3
                    
                    rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2)
                    playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).0
                    player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).1
                    player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).2
                    player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).3
                    
                default:
                    break
                }
                
                
                
            }
            
        }
        else if play2clearflg && callflg==false{
            
            
            if maxindex52==1{
                myscore.text=String(point(player))
                play2core.text=String(51)
                play3core.text=String(point(player3))
                play4core.text=String(point(player4))
                
                appDelegate.play1score=point(player)
                appDelegate.play2score=51
                appDelegate.play3score=point(player3)
                appDelegate.play4score=point(player4)
                var p1rank=rank(point(player), b: 51, c: point(player3), d: point(player4)).0
                var p2rank=rank(point(player), b: 51, c: point(player3), d: point(player4)).1
                var p3rank=rank(point(player), b: 51, c: point(player3), d: point(player4)).2
                var p4rank=rank(point(player), b: 51, c: point(player3), d: point(player4)).3
                rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank)
                playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).0
                player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).1
                player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).2
                player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).3
                
            }
                
            else if (point(player2)==maxt && maxa.count==1) && jokerflg==false{
                myscore.text=String(point(player))
                play2core.text=String(point(player2))
                play3core.text=String(point(player3))
                play4core.text=String(point(player4))
                appDelegate.play1score=point(player)
                appDelegate.play2score=point(player2)
                appDelegate.play3score=point(player3)
                appDelegate.play4score=point(player4)
                var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank)
                playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).0
                player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).1
                player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).2
                player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).3
            }
                
            else if ((point(player2)==maxt && maxa.count>1) || (point(player2)<maxt )) && (jokerflg==false){
                myscore.text=String(point(player))
                play2core.text=String(0)
                play3core.text=String(point(player3))
                play4core.text=String(point(player4))
                appDelegate.play1score=point(player)
                appDelegate.play2score=0
                appDelegate.play3score=point(player3)
                appDelegate.play4score=point(player4)
                var p1rank=rank(point(player), b: 0, c: point(player3), d: point(player4)).0
                var p2rank=rank(point(player), b: 0, c: point(player3), d: point(player4)).1
                var p3rank=rank(point(player), b: 0, c: point(player3), d: point(player4)).2
                var p4rank=rank(point(player), b: 0, c: point(player3), d: point(player4)).3
                rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank)
                playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).0
                player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).1
                player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).2
                player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).3
                
            }
            else if jokerflg && point(player2)>=maxt  {
                
                switch  jokerindex{
                case 0:
                    
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).3
                case 1:
                    myscore.text=String(point(player))
                    play2core.text=String(0)
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=0
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: 0, c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: 0, c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: 0, c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: 0, c: point(player3), d: point(player4)).3
                    rankstring(p1rank ,b: p2rank, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank ,b: p2rank, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank ,b: p2rank, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank ,b: p2rank, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank ,b: p2rank, c: p3rank, d: p4rank).3
                case 2:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank ,b: p2rank, c: p3rank+jokerindex2, d: p4rank)
                    playermess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).0
                    player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).1
                    player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).2
                    player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).3
                case 3:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2)
                    playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).0
                    player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).1
                    player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).2
                    player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).3
                default:
                    break
                }
                
                
                
            }
            else if jokerflg && point(player2)<maxt  {
                
                switch  jokerindex{
                case 0:
                    myscore.text=String(point(player))
                    play2core.text=String(0)
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=0
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player)+jokerindex2, b: 0, c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player)+jokerindex2, b: 0, c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player)+jokerindex2, b: 0, c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player)+jokerindex2, b: 0, c: point(player3), d: point(player4)).3
                    rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).3
                case 1:
                    myscore.text=String(point(player))
                    play2core.text=String(0)
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=0
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: 0, c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: 0, c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: 0, c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: 0, c: point(player3), d: point(player4)).3
                    rankstring(p1rank ,b: p2rank, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).3
                case 2:
                    myscore.text=String(point(player))
                    play2core.text=String(0)
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=0
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank ,b: p2rank, c: p3rank+jokerindex2, d: p4rank)
                    playermess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).0
                    player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).1
                    player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).2
                    player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).3
                case 3:
                    myscore.text=String(point(player))
                    play2core.text=String(0)
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=0
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2)
                    playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).0
                    player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).1
                    player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).2
                    player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).3
                default:
                    break
                }
                
                
                
            }
            
            
        }
        else if play3clearflg && callflg==false{
            
            if maxindex52==2{
                myscore.text=String(point(player))
                play2core.text=String(point(player2))
                play3core.text=String(51)
                play4core.text=String(point(player4))
                
                appDelegate.play1score=point(player)
                appDelegate.play2score=point(player2)
                appDelegate.play3score=51
                appDelegate.play4score=point(player4)
                var p1rank=rank(point(player), b: point(player2), c: 51, d: point(player4)).0
                var p2rank=rank(point(player), b: point(player2), c: 51, d: point(player4)).1
                var p3rank=rank(point(player), b: point(player2), c: 51, d: point(player4)).2
                var p4rank=rank(point(player), b: point(player2), c: 51, d: point(player4)).3
                rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank)
                playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).0
                player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).1
                player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).2
                player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).3
                
            }
                
            else if (point(player3)==maxt && maxa.count==1) && (jokerflg==false){
                myscore.text=String(point(player))
                play2core.text=String(point(player2))
                play3core.text=String(point(player3))
                play4core.text=String(point(player4))
                appDelegate.play1score=point(player)
                appDelegate.play2score=point(player2)
                appDelegate.play3score=point(player3)
                appDelegate.play4score=point(player4)
                var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank)
                playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).0
                player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).1
                player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).2
                player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).3
            }
                
            else if ((point(player3)==maxt && maxa.count>1) || (point(player3)<maxt )) && (jokerflg==false){
                myscore.text=String(point(player))
                play2core.text=String(point(player2))
                play3core.text=String(0)
                play4core.text=String(point(player4))
                
                appDelegate.play1score=point(player)
                appDelegate.play2score=point(player2)
                appDelegate.play3score=0
                appDelegate.play4score=point(player4)
                var p1rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).0
                var p2rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).1
                var p3rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).2
                var p4rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).3
                rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank)
                playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).0
                player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).1
                player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).2
                player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).3
            }
            else if jokerflg && point(player3)>=maxt  {
                
                switch  jokerindex{
                case 0:
                    
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).3
                case 1:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).3
                case 2:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(0)
                    play4core.text=String(point(player4))
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=0
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank ,b: p2rank, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank ,b: p2rank, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank ,b: p2rank, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank ,b: p2rank, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank ,b: p2rank, c: p3rank, d: p4rank).3
                case 3:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2)
                    playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).0
                    player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).1
                    player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).2
                    player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).3
                default:
                    break
                }
                
                
                
            }
                //プレイヤー3がコールしたが、ジョーカーを持っている他の2プレイヤーよりも点数が低い場合 プレイヤー3は0点になる
            else if jokerflg && point(player3)<maxt  {
                
                switch  jokerindex{
                case 0:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(0)
                    play4core.text=String(point(player4))
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=0
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).3
                    rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).3
                    
                    
                case 1:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(0)
                    play4core.text=String(point(player4))
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=0
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).3
                    rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).3
                case 2:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(0)
                    play4core.text=String(point(player4))
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=0
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).3
                    rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).3
                case 3:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(0)
                    play4core.text=String(point(player4))
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=0
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: 0, d: point(player4)).3
                    
                    rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2)
                    playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).0
                    player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).1
                    player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).2
                    player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank+jokerindex2).3
                    
                default:
                    break
                }
                
                
                
            }
            
        }
        else if play4clearflg && callflg==false{
            
            if maxindex52==3{
                myscore.text=String(point(player))
                play2core.text=String(point(player2))
                play3core.text=String(point(player3))
                play4core.text=String(51)
                appDelegate.play1score=point(player)
                appDelegate.play2score=point(player2)
                appDelegate.play3score=point(player3)
                appDelegate.play4score=51
                var p1rank=rank(point(player), b: point(player2), c: point(player3), d: 51).0
                var p2rank=rank(point(player), b: point(player2), c: point(player3), d: 51).1
                var p3rank=rank(point(player), b: point(player2), c: point(player3), d: 51).2
                var p4rank=rank(point(player), b: point(player2), c: point(player3), d: 51).3
                rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank)
                playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).0
                player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).1
                player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).2
                player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).3
                
            }
                
            else if (point(player4)==maxt && maxa.count==1) && (jokerflg==false){
                myscore.text=String(point(player))
                play2core.text=String(point(player2))
                play3core.text=String(point(player3))
                play4core.text=String(point(player4))
                appDelegate.play1score=point(player)
                appDelegate.play2score=point(player2)
                appDelegate.play3score=point(player3)
                appDelegate.play4score=point(player4)
                var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank)
                playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).0
                player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).1
                player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).2
                player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).3
                
            }
                
            else if ((point(player4)==maxt && maxa.count>1) || (point(player4)<maxt )) && (jokerflg==false){
                myscore.text=String(point(player))
                play2core.text=String(point(player2))
                play3core.text=String(point(player3))
                play4core.text=String(0)
                appDelegate.play1score=point(player)
                appDelegate.play2score=point(player2)
                appDelegate.play3score=point(player3)
                appDelegate.play4score=0
                var p1rank=rank(point(player), b: point(player2), c: point(player3), d: 0).0
                var p2rank=rank(point(player), b: point(player2), c: point(player3), d: 0).1
                var p3rank=rank(point(player), b: point(player2), c: point(player3), d: 0).2
                var p4rank=rank(point(player), b: point(player2), c: point(player3), d: 0).3
                rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank)
                playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).0
                player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).1
                player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).2
                player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).3
                
                
            }
                //プレイヤー4がコールしたが、プレイヤー4は最大値であり、ジョーカーを持っているjokerindexのプレイヤーと同じ場合順位が変動する
                
            else if jokerflg && point(player4)>=maxt  {
                
                switch  jokerindex{
                case 0:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).3
                case 1:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank ,b: p2rank+jokerindex2, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).3
                case 2:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(point(player4))
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=point(player4)
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank ,b: p2rank, c: p3rank+jokerindex2, d: p4rank)
                    playermess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).0
                    player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).1
                    player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).2
                    player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).3
                case 3:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(0)
                    
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=0
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: point(player4)).3
                    rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).3
                default:
                    break
                }
                
                
                
            }
                //プレイヤー4がコールしたが、ジョーカーを持っている他の2プレイヤーよりも点数が低い場合 プレイヤー4は0点になる
            else if jokerflg && point(player4)<maxt  {
                
                switch  jokerindex{
                case 0:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(0)
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=0
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: 0).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: 0).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: 0).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: 0).3
                    rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank+jokerindex2, b: p2rank, c: p3rank, d: p4rank).3
                    
                    
                case 1:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(0)
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=0
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: 0).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: 0).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: 0).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: 0).3
                    rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank, b: p2rank+jokerindex2, c: p3rank, d: p4rank).3
                case 2:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(0)
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=0
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: 0).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: 0).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: 0).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: 0).3
                    rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank)
                    playermess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).0
                    player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).1
                    player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).2
                    player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank+jokerindex2, d: p4rank).3
                case 3:
                    myscore.text=String(point(player))
                    play2core.text=String(point(player2))
                    play3core.text=String(point(player3))
                    play4core.text=String(0)
                    appDelegate.play1score=point(player)
                    appDelegate.play2score=point(player2)
                    appDelegate.play3score=point(player3)
                    appDelegate.play4score=0
                    var p1rank=rank(point(player), b: point(player2), c: point(player3), d: 0).0
                    var p2rank=rank(point(player), b: point(player2), c: point(player3), d: 0).1
                    var p3rank=rank(point(player), b: point(player2), c: point(player3), d: 0).2
                    var p4rank=rank(point(player), b: point(player2), c: point(player3), d: 0).3
                    rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank)
                    playermess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).0
                    player2mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).1
                    player3mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).2
                    player4mess.text=rankstring(p1rank, b: p2rank, c: p3rank, d: p4rank).3
                    
                default:
                    break
                }
                
                
                
            }
            
            
        }
        
        //self.view?.window?.rootViewController?.performSegueWithIdentifier("score", sender: self)
        //  self.view?.window?.rootViewController?.performSegueWithIdentifier("score", sender: self)
        var clearcall = NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: Selector("clearcall"), userInfo: nil, repeats: false)
    }
    func clearcall(){
        //クリア後のスコアボード表示遷移時間コントロール
        self.view?.window?.rootViewController?.performSegueWithIdentifier("score", sender: self)
        
    }
    
   
    
    
    
    func turncount(p2:Int,p3:Int,p4:Int)->Int{
        let turnarray=[p2,p3,p4]
        if p2==p3 && p3==p4{
            return p2
        }
        return turnarray.minElement()!
    }
    
    func change2(){
        selflabel.hidden=true
        selflabeloff.hidden=false
        label2off.hidden=true
        label2.hidden=false
        label3off.hidden=false
        label3.hidden=true
        label4off.hidden=false
        label4.hidden=true
      
        ok.hidden=true
     
        
        
        myturn=false
       
        var dummyplayer2=[String]()
        let  excard=headretune(player2)
        let  cardnum=cardfind(opencard)
        var  clearflg:Bool?
        mess.text=""
        var dummyopencard2=[String]()
        let currentturnnumber=turncount(player2turn,p3: player3turn,p4: player4turn)
        var disposecard=samesuitflg(player2, opencard: opencard).1
        
        changeturn=0
        //  print("play2  :\(player2)")
        /* クリア判定*/
       
        self.play4turn=false
        exchangeselfcard=nil
        exchangeopencard=nil
        myturn=false
        waku2.hidden=true
        play2changeflg=samesuitflg(player2, opencard: opencard).0

        play2passflg=passflg(player2, opencard: opencard)
              //  print("play2  パス flg \( play2passflg)")
        // print("play2  リターンflg \( play2returnflg)")
        //  ok.hidden=true
        // ok.userInteractionEnabled=true
        // self.view?.window?.rootViewController?.performSegueWithIdentifier("score", sender: self)
        
        
       if (play2passflg ){
            let sound=SKAction.playSoundFileNamed("click.wav", waitForCompletion: false)
            self.runAction(sound)
            
            fukidashi2.hidden=false
            message2.hidden=false
            message2.text=passstring
            var pass = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("passcontrol"), userInfo: nil, repeats: false)
            
            
        }
            
        else if  (play2changeflg==true){
        
        let sound=SKAction.playSoundFileNamed("card2.wav", waitForCompletion: false)
        
        
        let actcard3=SKAction.moveTo(play4point[disposecard], duration: 0.5)
        
        
                self.runAction(sound)

            self.runAction(actcard3, completion: { self.change3()})
            play2turnflg=true
            point(player2)
            //    scorevalue=sum
            //appDelegate.flg=play2turnflg
            play2turncount++
        }
       
    }
    func change3wait(){
        var timer2 = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("change3"), userInfo: nil, repeats: false)
    }
    func change2wait(){
        var timer2 = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("change2"), userInfo: nil, repeats: false)
    }
    func waitchange22(){
        change2()
    }
    
    func passcontrol(){
        if (play2passflg ){
            print("play2  pass \(player2)")
            fukidashi2.hidden=false
            message2.hidden=false
            message2.text=passstring
            self.change3()
            
        }
        else if  (play3passflg ){
            fukidashi3.hidden=false
            message3.hidden=false
            message3.text=passstring
            self.change4wait()
            
            
            
        }
        else if (play4passflg ){
            
            
            
            selfchangeflg()
            
        }
        
        
        
    }
    func waitchange3(){
        print("prechangecount  \(prechangecount)")
        if play2changeflg{
            change3()
        }
        else if play3changeflg{change4()
        }
        else if play4changeflg{
            selfchangeflg()
        }
        
        
    }
    
    func change3(){
        fukidashi2.hidden=true
        message2.hidden=true
        
        play2changeflg=false
        play2passflg=false
        
        label2off.hidden=false
        label2.hidden=true
        label3off.hidden=true
        label3.hidden=false
        label4off.hidden=false
        label4.hidden=true
       
         var disposecard=samesuitflg(player3, opencard: opencard).1
        
        let currentturnnumber=turncount(player2turn,p3: player3turn,p4: player4turn)
        var dummyplayer3=[String]()
        var dummyopencard3=[String]()
        var  clearflg:Bool?
       
        play3passflg=passflg(player3, opencard: opencard)
      
         play3changeflg=samesuitflg(player3, opencard: opencard).0
        mess.text=""
        play2turnflg=false
        player2mess.text="player2"
        /*  ここから２枚目 */
        // print("play3changeflg  \(play3changeflg)")
        // print("play3passflg  \(play3passflg)")
        //   print("play3  return \(play3returnflg)")
        //  print("play4  \(player4)")
        
        let excard3=headretune(player3)
        
        if (play3passflg ){
            let sound=SKAction.playSoundFileNamed("click.wav", waitForCompletion: false)
            self.runAction(sound)
            fukidashi3.hidden=false
            message3.hidden=false
            message3.text=passstring
            
            var pass = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("passcontrol"), userInfo: nil, repeats: false)
        }
            
        else if (play3changeflg==true) {
            
            let sound=SKAction.playSoundFileNamed("card2.wav", waitForCompletion: false)
            
            
            let actcard3=SKAction.moveTo(play4point[disposecard], duration: 0.5)
            
            
          
                       self.runAction(sound)
             self.runAction(actcard3, completion:  { self.change4wait()})
            
            self.facedown(player3, t: excard3)
            turn++
            //self.facedown(20+cardnum)
        }
        
    }
    func change4wait(){
        var waitchange = NSTimer.scheduledTimerWithTimeInterval(0.6, target: self, selector: Selector("change4"), userInfo: nil, repeats: false)
        
    }
    func change4(){
        fukidashi3.hidden=true
        message3.hidden=true
        label2off.hidden=false
        label2.hidden=true
        label3off.hidden=false
        label3.hidden=true
        label4off.hidden=true
        label4.hidden=false
        
       
       
        
        
       
        play3changeflg=false
        play3passflg=false
        let currentturnnumber=turncount(player2turn,p3: player3turn,p4: player4turn)
        let play3wait=SKAction.waitForDuration(1.3)
        play4changeflg=samesuitflg(player4, opencard: opencard).0
        var disposecard=samesuitflg(player4, opencard: opencard).1
        play4passflg=passflg(player4, opencard: opencard)
     
        
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var dummyplayer4=[String]()
        var dummyopencard4=[String]()
        
        player3mess.text="player3"
        mess.text=""
        
         if (play4passflg ){
            
            fukidashi4.hidden=false
            message4.hidden=false
            message4.text=passstring
            let sound=SKAction.playSoundFileNamed("click.wav", waitForCompletion: false)
            self.runAction(sound)
            
            var pass = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("passcontrol"), userInfo: nil, repeats: false)
            
        }
            
        else if (play4changeflg==true) || (play4passflg==false) {
            /*  ここから２枚目 */
            let sound=SKAction.playSoundFileNamed("card2.wav", waitForCompletion: false)
            
           
            let actcard3=SKAction.moveTo(play4point[disposecard], duration: 0.5)
          
           
            
           
           
            let img16=self.childNodeWithName(player4[0])
            let img17=self.childNodeWithName(player4[1])
            let img18=self.childNodeWithName(player4[2])
            let img19=self.childNodeWithName(player4[3])
            let img20=self.childNodeWithName(player4[4])
            img16?.zPosition=1
            img17?.zPosition=2
            img18?.zPosition=3
            img19?.zPosition=4
            img20?.zPosition=5
            self.runAction(sound)
        
            self.runAction(actcard3, completion: { self.selfchangeflg()})
          
            // excard4?.runAction(actcard4, completion: {
            //      self.selfchangeflg()})
            
            play3turn=true
            turn++
            //self.facedown(20+cardnum)
        }
       
    }
    // 自分のターン
    func selfchangeflg(){
        fukidashi4.hidden=true
        message4.hidden=true
        myturn=true
        selflabel.hidden=false
        selflabeloff.hidden=true
        label2off.hidden=false
        label2.hidden=true
        label3off.hidden=false
        label3.hidden=true
        label4off.hidden=false
        label4.hidden=true
        passcount=passcount+1
        self.play4turn=true
        exchangeselfflg=false
        exchangeopenflg=false
        exchangeopencard=nil
        exchangeselfcard=nil
        
        changebutton=false
               exchangeselfcard=nil
        exchangeopencard=nil
        
       
        callflg==false
        let currentturnnumber=turncount(player2turn,p3: player3turn,p4: player4turn)
        // ok.hidden=false
        //   ok.userInteractionEnabled=false
        print("カレントナンバー　\(currentturnnumber)")
        playermess.text="player1"
        if(myturn && passcount<2) {
            passs.hidden=true
            passs.userInteractionEnabled=true
            
            
        }
        else if (myturn && passcount>=2){
            passs.hidden=false
            passs.userInteractionEnabled=false
        }
        
        if self.play4turn{
            
            let fmt = NSLocalizedString("あなたの番です",comment: "comment")
            mess.text = String(fmt)
            
        }
        else {
            mess.text=""
        }
        
        
    }
    
    // タップしたら、sceneEscapeを呼ぶようにする。
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location: CGPoint! = touch.locationInNode(self)
            let node = self.nodeAtPoint(location)
           let openpointposition:CGFloat=155
            let mypointposition:CGFloat=70
            
            
            let front=SKTexture(imageNamed: "z01")
            let back=SKTexture(imageNamed: cardarry[0])
            textures2.append(front)
            textures2.append(back)
            
            if node.name=="reset"{
            }
            
            if (node.name==nil){}
            else {
                if node.name=="text"{
                    /* player */
                    starton.hidden=true
                    starton.userInteractionEnabled=true
                    mess.text=""
                    
                    text.hidden=true
                    
                    starton.hidden=true
                    let interval:CGFloat=20
                    let playheight:CGFloat=260
                    
                    if startcount==0{
                        let img1=self.childNodeWithName(cardarry[0])
                        let img2=self.childNodeWithName(cardarry[1])
                        let img3=self.childNodeWithName(cardarry[2])
                        let img4=self.childNodeWithName(cardarry[3])
                        let img5=self.childNodeWithName(cardarry[4])
                        let sound=SKAction.playSoundFileNamed("cze.caf", waitForCompletion: false)
                        
                        
                        /* player2 */
                        let img6=self.childNodeWithName(cardarry[5])
                        let img7=self.childNodeWithName(cardarry[6])
                        let img8=self.childNodeWithName(cardarry[7])
                        let img9=self.childNodeWithName(cardarry[8])
                        let img10=self.childNodeWithName(cardarry[9])
                        /* player3 */
                        let img11=self.childNodeWithName(cardarry[10])
                        let img12=self.childNodeWithName(cardarry[11])
                        let img13=self.childNodeWithName(cardarry[12])
                        let img14=self.childNodeWithName(cardarry[13])
                        let img15=self.childNodeWithName(cardarry[14])
                        /* player4 */
                        let img16=self.childNodeWithName(cardarry[15])
                        let img17=self.childNodeWithName(cardarry[16])
                        let img18=self.childNodeWithName(cardarry[17])
                        let img19=self.childNodeWithName(cardarry[18])
                        let img20=self.childNodeWithName(cardarry[19])
                        /* open card */
                        let img21=self.childNodeWithName(cardarry[20])
                        let img22=self.childNodeWithName(cardarry[21])
                        
                        
                        //  print("first opencard \(opencard)")
                        /*  self player*/
                        playpoint.insert(CGPointMake((((1)*posix2)+posix)*displayscale, mypointposition*displayscaley), atIndex: 0)
                        playpoint.insert(CGPointMake((((2)*posix2)+posix)*displayscale, mypointposition*displayscaley), atIndex: 1)
                        playpoint.insert(CGPointMake((((3)*posix2)+posix)*displayscale, mypointposition*displayscaley), atIndex: 2)
                        playpoint.insert(CGPointMake((((4)*posix2)+posix)*displayscale, mypointposition*displayscaley), atIndex: 3)
                        playpoint.insert(CGPointMake((((5)*posix2)+posix)*displayscale, mypointposition*displayscaley), atIndex: 4)
                        
                        let act1=SKAction.moveTo(playpoint[0], duration: 0.1)
                        let act2=SKAction.moveTo(playpoint[1], duration: 0.1)
                        let act3=SKAction.moveTo(playpoint[2], duration: 0.1)
                        let act4=SKAction.moveTo(playpoint[3], duration: 0.1)
                        let act5=SKAction.moveTo(playpoint[4], duration: 0.1)
                        
                        
                        /* player2 */
                        play2point.insert(CGPointMake((((1)*interval)+40)*displayscale, playheight*displayscaley), atIndex: 0)
                        play2point.insert(CGPointMake((((2)*interval)+40)*displayscale, playheight*displayscaley), atIndex: 1)
                        play2point.insert(CGPointMake((((3)*interval)+40)*displayscale, playheight*displayscaley), atIndex: 2)
                        play2point.insert(CGPointMake((((4)*interval)+40)*displayscale, playheight*displayscaley), atIndex: 3)
                        play2point.insert(CGPointMake((((5)*interval)+40)*displayscale, playheight*displayscaley), atIndex: 4)
                        
                        let act6=SKAction.moveTo(play2point[0], duration: 0.2)
                        let act7=SKAction.moveTo(play2point[1], duration: 0.2)
                        let act8=SKAction.moveTo(play2point[2], duration: 0.2)
                        let act9=SKAction.moveTo(play2point[3], duration: 0.2)
                        let act10=SKAction.moveTo(play2point[4], duration: 0.2)
                        /* player3 */
                        play3point.insert(CGPointMake((((1)*interval)+225)*displayscale, playheight*displayscaley), atIndex: 0)
                        play3point.insert(CGPointMake((((2)*interval)+225)*displayscale, playheight*displayscaley), atIndex: 1)
                        play3point.insert(CGPointMake((((3)*interval)+225)*displayscale, playheight*displayscaley), atIndex: 2)
                        play3point.insert(CGPointMake((((4)*interval)+225)*displayscale, playheight*displayscaley), atIndex: 3)
                        play3point.insert(CGPointMake((((5)*interval)+225)*displayscale, playheight*displayscaley), atIndex: 4)
                        
                        
                        let act11=SKAction.moveTo(play3point[0], duration: 0.1)
                        let act12=SKAction.moveTo(play3point[1], duration: 0.1)
                        let act13=SKAction.moveTo(play3point[2], duration: 0.1)
                        let act14=SKAction.moveTo(play3point[3], duration: 0.1)
                        let act15=SKAction.moveTo(play3point[4], duration: 0.1)
                        
                        /*  player4 */
                        play4point.insert(CGPointMake((((1)*interval)+410)*displayscale, playheight*displayscaley), atIndex: 0)
                        play4point.insert(CGPointMake((((2)*interval)+410)*displayscale, playheight*displayscaley), atIndex: 1)
                        play4point.insert(CGPointMake((((3)*interval)+410)*displayscale, playheight*displayscaley), atIndex: 2)
                        play4point.insert(CGPointMake((((4)*interval)+410)*displayscale, playheight*displayscaley), atIndex: 3)
                        play4point.insert(CGPointMake((((5)*interval)+410)*displayscale, playheight*displayscaley), atIndex: 4)
                        
                        let act16=SKAction.moveTo(play4point[0], duration: 0.1)
                        let act17=SKAction.moveTo(play4point[1], duration: 0.1)
                        let act18=SKAction.moveTo(play4point[2], duration: 0.1)
                        let act19=SKAction.moveTo(play4point[3], duration: 0.1)
                        let act20=SKAction.moveTo(play4point[4], duration: 0.1)
                        
                        openpoint.insert(CGPointMake((((1)*posix2)+posix)*displayscale, openpointposition*displayscaley), atIndex: 0)
                        openpoint.insert(CGPointMake((((2)*posix2)+posix)*displayscale, openpointposition*displayscaley), atIndex: 1)
                        
                        
                        /* open card */
                        let act21=SKAction.moveTo(openpoint[0], duration: 0.1)
                        let act22=SKAction.moveTo(openpoint[1], duration: 0.1)
                                              /*var img:SKNode?=self.childNodeWithName(cardarry[i])
                        var act=SKAction.moveToX(350+(CGFloat(i)*80), duration: 0.6)
                        */
                        
                        img6?.runAction(act6)
                        img7?.runAction(act7)
                        img8?.runAction(act8)
                        img9?.runAction(act9)
                        img10?.runAction(act10)
                        img11?.runAction(act11)
                        img12?.runAction(act12)
                        img13?.runAction(act13)
                        img14?.runAction(act14)
                        img15?.runAction(act15)
                        img16?.runAction(act16)
                        img17?.runAction(act17)
                        img18?.runAction(act18)
                        img19?.runAction(act19)
                        img20?.runAction(act20)
                        
                        img6?.zPosition=1
                        img7?.zPosition=2
                        img8?.zPosition=3
                        img9?.zPosition=4
                        img10?.zPosition=5
                        img11?.zPosition=1
                        img12?.zPosition=2
                        img13?.zPosition=3
                        img14?.zPosition=4
                        img15?.zPosition=5
                        img16?.zPosition=1
                        img17?.zPosition=2
                        img18?.zPosition=3
                        img19?.zPosition=4
                        img20?.zPosition=5
                        
                        img5?.runAction(act5, completion:{ self.complete=true
                            
                            if self.complete==true{
                                img4?.runAction(act4, completion: {self.complete1=true
                                    if self.complete1==true{
                                        img3?.runAction(act3, completion:{self.complete2=true
                                            if self.complete2==true{
                                                img2?.runAction(act2, completion:{self.complete3=true
                                                    
                                                    if self.complete3==true{
                                                        img1?.runAction(act1,completion:{self.complete4=true
                                                            if self.complete4==true{
                                                                /*img?.runAction(SKAction.animateWithTextures(self.textures2, timePerFrame: 0.1))*/
                                                                
                                                                self.faceup(self.player,t: 0)
                                                                self.faceup(self.player,t: 1)
                                                                self.faceup(self.player,t: 2)
                                                                self.faceup(self.player,t: 3)
                                                                self.faceup(self.player,t: 4)
                                                            }}
                                                        )}})}})}})}})
                        
                                                img22?.runAction(act22, completion:{self.complete8=true
                                                    if self.complete8==true{
                                                        self.runAction(sound)
                                                        img21?.runAction(act21,completion:{self.complete9=true
                                                            if self.complete9==true{
                                                                self.runAction(sound)                                     /*img?.runAction(SKAction.animateWithTextures(self.textures2, timePerFrame: 0.1))*/
                                                                
                                                                self.faceup(self.opencard,t: 4)
                                                                self.faceup(self.opencard,t: 3)
                                                                self.faceup(self.opencard,t: 2)
                                                                self.faceup(self.opencard,t: 1)
                                                                self.faceup(self.opencard,t: 0)
                                                                //self.selfchangeflg()
                                                                
                                                                
                                                                let probability=Int(arc4random()%100)
                                                                if probability>=75{
                                                                    
                                                                    self.selfchangeflg()
                                                                }
                                                                else if(50<=probability && probability<=74){
                                                                    
                                                                    self.change2wait()
                                                                }
                                                                else if(25<=probability && probability<=49){
                                                                    
                                                                    self.change3wait()
                                                                    
                                                                }
                                                                else if(0<=probability && probability<=24){
                                                                    
                                                                    self.change4wait()
                                                                    
                                                                }
                                                                
                                                            }}
                                                        )}})
                        /*
                        selfchange({ println(" play4turn \(self.play4turn)")})
                        println("turn \(turn)")
                        println(" play4turn \(self.play4turn)")*/
                        
                        startcount++
                    }
                    
                }
                               else if (node.name=="pass"){
                    call.userInteractionEnabled=true
                    pass()
                    
                    
                }
                else if node.name=="reset"{
                    delegate_escape!.sceneEscape(self)
                }
                    
                else if    node.name=="ok"{
                    if play4turn{
                        for (index,value) in player.enumerate(){
                            
                            
                            if node.name==(value){
                                print(" node.name \(node.name)")
                                exchangeselfcard=index
                                print(" exchangeselfcard \(exchangeselfcard)")
                                exchangeselfflg=true
                                let sound=SKAction.playSoundFileNamed("select.caf", waitForCompletion: false)
                                self.runAction(sound)
                                /*
                                var selectnode=self.childNodeWithName(value)
                                var scalenode=SKAction.scaleTo(0.26, duration: 0.1)
                                selectnode?.runAction(scalenode)
                                */
                            }
                            if exchangeselfcard==0{
                                waku.hidden=false
                                
                                waku.position=CGPointMake((((1)*self.posix2)+self.posix)*displayscale, mypointposition*displayscaley)
                                
                            }
                            else if exchangeselfcard==1{
                                waku.hidden=false
                                waku.position=CGPointMake((((2)*self.posix2)+self.posix)*displayscale, mypointposition*displayscaley)
                                
                            }
                            else if exchangeselfcard==2{
                                waku.hidden=false
                                waku.position=CGPointMake((((3)*self.posix2)+self.posix)*displayscale, mypointposition*displayscaley)
                                
                            }
                            else if exchangeselfcard==3{
                                waku.hidden=false
                                waku.position=CGPointMake((((4)*self.posix2)+self.posix)*displayscale, mypointposition*displayscaley)
                                
                            }
                            else if exchangeselfcard==4{
                                waku.hidden=false
                                waku.position=CGPointMake((((5)*self.posix2)+self.posix)*displayscale, mypointposition*displayscaley)
                                
                            }
                        }
                        
                        for (index,value) in opencard.enumerate(){
                            if node.name==(value){
                                
                                print(" node.name \(node.name)")
                                exchangeopencard=index
                                print(" exchangeselfcard \(exchangeopencard)")
                                exchangeopenflg=true
                                let sound=SKAction.playSoundFileNamed("select.caf", waitForCompletion: false)
                                self.runAction(sound)
                                
                            }
                            if exchangeopencard==0{
                                waku2.hidden=false
                                
                                waku2.position=CGPointMake((((1)*self.posix2)+self.posix)*displayscale, opencardposix*displayscaley)
                                
                            }
                            else if exchangeopencard==1{
                                waku2.hidden=false
                                waku2.position=CGPointMake((((2)*self.posix2)+self.posix)*displayscale, opencardposix*displayscaley)
                                
                            }
                            else if exchangeopencard==2{
                                waku2.hidden=false
                                waku2.position=CGPointMake((((3)*self.posix2)+self.posix)*displayscale, opencardposix*displayscaley)
                                
                            }
                            else if exchangeopencard==3{
                                waku2.hidden=false
                                waku2.position=CGPointMake((((4)*self.posix2)+self.posix)*displayscale, opencardposix*displayscaley)
                                
                            }
                            else if exchangeopencard==4{
                                waku2.hidden=false
                                waku2.position=CGPointMake((((5)*self.posix2)+self.posix)*displayscale, opencardposix*displayscaley)
                                
                            }
                            
                            // selfchange(exchangeopencard!, cardnum2: exchangeselfcard!)
                        }
                        //    }while (((exchangeselfflg)==false)&&((exchangeopenflg)==false))
                        
                        
                        if ((exchangeselfflg)&&(exchangeopenflg)){
                            ok.hidden=false
                            if(node.name=="ok"){
                                
                                
                                
                                self.selfchange(exchangeselfcard!, cardnum2: exchangeopencard!)
                                
                            }
                            
                            
                            
                            //
                            
                        }
                    }
                }
                    
                
                else if play4turn{
                    
                    //    do{
                    for (index,value) in player.enumerate(){
                        
                        
                        if node.name==(value){
                            print(" node.name \(node.name)")
                            exchangeselfcard=index
                            print(" exchangeselfcard \(exchangeselfcard)")
                            exchangeselfflg=true
                            let sound=SKAction.playSoundFileNamed("select.caf", waitForCompletion: false)
                            self.runAction(sound)
                            /*
                            var selectnode=self.childNodeWithName(value)
                            var scalenode=SKAction.scaleTo(0.26, duration: 0.1)
                            selectnode?.runAction(scalenode)
                            */
                        }
                        if exchangeselfcard==0{
                            waku.hidden=false
                            
                            waku.position=CGPointMake((((1)*self.posix2)+self.posix)*displayscale, mypointposition*displayscaley)
                            
                        }
                        else if exchangeselfcard==1{
                            waku.hidden=false
                            waku.position=CGPointMake((((2)*self.posix2)+self.posix)*displayscale, mypointposition*displayscaley)
                            
                        }
                        else if exchangeselfcard==2{
                            waku.hidden=false
                            waku.position=CGPointMake((((3)*self.posix2)+self.posix)*displayscale, mypointposition*displayscaley)
                            
                        }
                        else if exchangeselfcard==3{
                            waku.hidden=false
                            waku.position=CGPointMake((((4)*self.posix2)+self.posix)*displayscale, mypointposition*displayscaley)
                            
                        }
                        else if exchangeselfcard==4{
                            waku.hidden=false
                            waku.position=CGPointMake((((5)*self.posix2)+self.posix)*displayscale, mypointposition*displayscaley)
                            
                        }
                    }
                    
                
                    //    }while (((exchangeselfflg)==false)&&((exchangeopenflg)==false))
                    
                    
                    if ((exchangeselfflg)){
                        ok.hidden=false
                        ok.userInteractionEnabled=false
                        print("excahnge \(exchangeopencard!)")
                        if(node.name=="ok"){
                            
                            
                            self.selfchange(exchangeselfcard!, cardnum2: exchangeopencard!)
                            
                        }
                        
                        
                        //
                        
                    }
                    
                }
            }
        }
    }
    
   }