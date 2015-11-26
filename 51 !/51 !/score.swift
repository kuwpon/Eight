//
//  score.swift
//  51renew
//
//  Created by 桑原綾人 on 2014/10/25.
//  Copyright (c) 2014年 game. All rights reserved.
//

import UIKit

protocol CustomLabelDelegate {
    func touchUpInside(customLabel: Score)
}
class Score: UIView{
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
    // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let uivi=UIView(frame: CGRectMake(30, 300, 300, 300))
        var vicon=UIViewController()
        uivi.backgroundColor=UIColor.greenColor()
        self.addSubview(uivi)
        
    }
    
    
    
    
    var delegate: CustomLabelDelegate?
    func touchUpInside() {
        delegate?.touchUpInside(self)
    }
    
    
}
