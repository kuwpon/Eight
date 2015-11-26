//
//  CoverVerticalTopSegue.swift
//  51renew
//
//  Created by 桑原綾人 on 2014/10/27.
//  Copyright (c) 2014年 game. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
var gamecountflg:Bool=false
@objc(CoverVerticalTopSegue)

class CoverVerticalTopSegue: UIStoryboardSegue,UIViewControllerTransitioningDelegate {
    override func perform() {
        
        var myButton: UIButton!
        
        let effect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let effectView = UIVisualEffectView(effect: effect)
        let rect = UIScreen.mainScreen().applicationFrame
        effectView.frame = CGRectMake(0, 0, rect.width, 2*rect.height )
        
        let svc = self.sourceViewController as UIViewController
        let dvc: UIViewController = self.destinationViewController as UIViewController
        svc.view.addSubview(effectView)
        dvc.view.backgroundColor=UIColor.clearColor()
        var dpv: UIView=svc.view.snapshotViewAfterScreenUpdates(false)

       // dvc.view.addSubview(effectView)
        /*
        var context=UIGraphicsGetCurrentContext()
        var dpv: UIView=svc.view.snapshotViewAfterScreenUpdates(false)
        UIGraphicsBeginImageContextWithOptions(dpv.bounds.size, false, 0.0)
        
        svc.view.drawViewHierarchyInRect(dpv.bounds, afterScreenUpdates: false)
        svc.view.layer.renderInContext(context)
*/
      //  var imgaa :UIImage = UIGraphicsGetImageFromCurrentImageContext()
        //var ciiimage :CIImage = CIImage(image: imgaa)
        
       // UIApplication.sharedApplication().keyWindow?.backgroundColor=UIColor(patternImage: UIImage(named: "dpv")!)
        //UIGraphicsEndImageContext()
       //var uii=UIImageView(image: imgaa)
      
       // var crect=CGRectMake(0, 0, svc.view.bounds.width, svc.view.bounds.height)
      //  dpv.frame=crect
       
        //svc.view.drawViewHierarchyInRect(dpv.bounds, afterScreenUpdates: false)
        svc.view.window?.addSubview(dvc.view)
        gamecountflg=true
        //dvc.modalPresentationStyle=UIModalPresentationStyle.OverFullScreen
       // dvc.view.layer.borderColor=UIColor(red: 1, green: 0, blue: 0, alpha: 0.1).CGColor
        //dvc.view.frame = CGRectInset(svc.view.layer.frame, 30, 30);
        dvc.view.transform = CGAffineTransformMakeTranslation(0, -svc.view.window!.frame.size.height)
        dvc.view.layer.borderColor=UIColor.clearColor().CGColor
        dvc.view.layer.borderWidth=1
        dvc.view.layer.shadowOpacity=0.5
        // dvc.view.layer.shadowRadius=22
        dvc.view.layer.shadowColor=UIColor.clearColor().CGColor
        dvc.view.layer.masksToBounds=true
        
       
        //dvc.view.layer.cornerRadius=30
        
        UIView.animateWithDuration(1.75,
            delay: 0.0,
            options: UIViewAnimationOptions.TransitionFlipFromTop,
            animations: { () -> Void in
                dvc.view.transform = CGAffineTransformMakeTranslation(0, 0)
               
                
                
                
               
            }) { (finished: Bool) -> Void in
               gamecountflg=false
                
                                var root=UIApplication.sharedApplication()
                /*
                UIApplication.sharedApplication().delegate?.window??.rootViewController=self.destinationViewController as UIViewController
                */
                //svc.view.removeFromSuperview()
                //dvc.view.removeFromSuperview()
                
                var context: Void=UIGraphicsBeginImageContextWithOptions(svc.view.bounds.size, false, 0)
                
                svc.view.drawViewHierarchyInRect(svc.view.bounds, afterScreenUpdates: false)
                let snap=UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()

                //svc.view.frame = CGRectInset(dvc.view.layer.frame, 30, 30)
                svc.view.transform = CGAffineTransformMakeTranslation(0, -dvc.view.window!.frame.size.height)
                svc.view.layer.borderWidth=1
                svc.view.layer.shadowOpacity=0.5
                dvc.view.backgroundColor=UIColor(patternImage: snap)

                svc.presentViewController(dvc, animated: false, completion: { () -> Void in
                
                   effectView.removeFromSuperview()
                 
                })
                
                /*
                dvc.view.endEditing(true)
                var but=UIButton(frame: CGRectMake(200, 90, 120, 53))
                but.setTitle("tapped", forState:UIControlState.Normal)
                
                but.backgroundColor = UIColor(red: 0.7, green: 0.2, blue: 0.2, alpha: 1)
                but.addTarget(self, action: "dot:", forControlEvents: .TouchUpInside)
                dvc.view.addSubview(but)
                
                func dot(sender: UIButton){
                var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
                
                dvc.view.removeFromSuperview()
                
                }
                */
                
                
        }
        
        
        
        
        
    }
    


}

