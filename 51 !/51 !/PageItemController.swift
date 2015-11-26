//
//  PageItemController.swift
//  Paging_Swift
//
//  Created by Olga Dalton on 26/10/14.
//  Copyright (c) 2014 swiftiostutorials.com. All rights reserved.
//


import UIKit

class PageItemController: UIViewController {
    @IBOutlet weak var tutorial: UILabel!
    let pageData:NSArray = ["『遊", "That's one small step for man, one giant leap for mankind - Neil Armstrong","An ant on the move does more than a dozing ox - Lao Tzu","I mean, it's impossible But that's exactly what we've tried to do - Jonathan Ive"]
   
    @IBOutlet weak var datalabel: UILabel!

    @IBOutlet weak var capint: UIImageView!
     var dataObject: AnyObject?
    // MARK: - Variables
    var itemIndex: Int = 0
    var imageName: String = "" {
        
        didSet {
            
            if let imageView = datalabel {
                imageView.text=String(self.pageData[itemIndex] as! NSString)
            }
            
        }
    }
    override func viewDidLoad() {
     super.viewDidLoad()
        var yscale:CGFloat?
        var scoreframey:CGFloat?
        var scoreframeposiy:CGFloat?
        var  displaylabelscale:CGFloat?
        var captureheight:CGFloat?
        var capturewidth:CGFloat?
        var captureposiy:CGFloat?

                 datalabel.numberOfLines=0 // 表示する行　0 は無限
        let cap:UIImage?
        let  ff=NSLocale.preferredLanguages().first
        if ff=="ja" || ff=="ja-JP"    {
            cap=UIImage(named: "capjp")
            
                   }
        else{
            cap=UIImage(named: "capen")
            
                  }

        let closeimage=UIImage(named: "close on.png")
        if displayscaley>1.8{
            capturewidth=510
            displaylabelscale=1.5
            captureheight=200
            captureposiy=60

            
        }
        else if displayscaley>1.2{
           capturewidth=500
            displaylabelscale=1.3
            captureheight=256
              captureposiy=26

        }
        else if displayscaley>1.15{
           capturewidth=500
            displaylabelscale=1
            captureheight=256
              captureposiy=26

        }
        else{
           capturewidth=500
            displaylabelscale=1
            captureheight=256
              captureposiy=26
            
        }

        dismiss.transform=CGAffineTransformMakeScale(0.8*displaylabelscale!, 0.8*displaylabelscale!)
        
        dismiss.setImage(closeimage, forState: UIControlState.Normal)

        if let obj: AnyObject = dataObject {
            self.datalabel!.text = obj.description
        } else {
            self.datalabel!.text = ""
        }


            self.tutorial.font=UIFont.systemFontOfSize(displayscale*11)
        
        
        if itemIndex==2{
            dismiss.hidden=false
            dismiss.enabled=true
            capint.hidden=false
            let rect=CGRectMake(35*displayscale, captureposiy!*displayscaley, capturewidth!*displayscale, captureheight!*displayscaley)
            let cc=UIImageView(frame: rect)
            cc.image=cap
            self.view.addSubview(cc)
            dismiss.layer.zPosition=1
        }
        else{
            dismiss.hidden=true
            dismiss.enabled=false
            
            capint.hidden=true
        }
       
      
        
    }
    @IBOutlet weak var dismiss: UIButton!
   
    @IBAction func dismis(sender: AnyObject) {
        let nex : AnyObject!=self.storyboard?.instantiateViewControllerWithIdentifier("board")
        self.presentViewController(nex as! UIViewController, animated: false, completion: nil)
    }
    @IBOutlet var contentImageView: UIImageView?
    
    // MARK: - View Lifecycle
    
    }
