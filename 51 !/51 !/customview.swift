//
//  customview.swift
//  51renew
//
//  Created by 桑原綾人 on 2014/10/29.
//  Copyright (c) 2014年 game. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable class CustomView: UIView {
    var line=UIBezierPath()
    
    var linew:CGFloat?
    var addlinex:CGFloat?
    var addliney:CGFloat?
    var movelinex:CGFloat?
    var moveliney:CGFloat?
       @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var linewidth: CGFloat = 3.0 {
        didSet {
            linew=linewidth
            drawline()
        }
    }
    @IBInspectable var linex1: CGFloat = 6.0 {
        didSet {
            addlinex=linex1
            drawline()
        }
    }
    @IBInspectable var liney1: CGFloat = 3.0 {
        didSet {
            addliney=liney1
            drawline()
        }
    }
    @IBInspectable var linex2: CGFloat = 6.0 {
        didSet {
            movelinex=linex2
            drawline()
        }
    }
    @IBInspectable var liney2: CGFloat = 3.0 {
        didSet {
            moveliney=liney2
            drawline()
        }
    }

    @IBInspectable var shadowOpacity: Float = 0 {
        didSet {
            layer.shadowOpacity=shadowOpacity
        }
    }
    
    @IBInspectable var startColor: UIColor = UIColor.whiteColor() {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var endColor: UIColor = UIColor.blackColor() {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = false {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var roundness: CGFloat = 0.0 {
        didSet{
            setupView()
        }
    }
    
    
    
    // MARK: Overrides ******************************************
    
    override class func layerClass()->AnyClass{
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        let myBound: CGSize = UIScreen.mainScreen().bounds.size
        
        print("Uiview self.frame.origin.x \(self.frame.size.width)" )
        print("Uiview self.frame.origin.y \(self.frame.size.height)" )
        self.frame.size.width=1
        self.frame.size.height=1
        

    }
    
    @IBInspectable  var linex: Float = 0 {
        didSet{
       
            

        }
    }
    
    override func drawRect(rect: CGRect) {
        // Drawing the vertical line
        var i:CGFloat=1
        var columns: [CGFloat] = []
        let ctx = UIGraphicsGetCurrentContext()
        CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.5, 1.0)
        
        CGContextSetLineWidth(ctx, linew!)
        
        for i in 1...6 {
        CGContextMoveToPoint(ctx, CGFloat(i*35)+(addlinex!), CGFloat(i*35)+(addliney!))
        CGContextAddLineToPoint(ctx, movelinex!, CGFloat(i*35)+moveliney!)
        
        CGContextStrokePath(ctx)
        }
    }

    // MARK: Internal functions *********************************
    func drawline(){
      
    }
    // Setup the view appearance
    private func setupView(){
        
        let colors:Array<AnyObject> = [startColor.CGColor, endColor.CGColor]
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = roundness
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        
        if (isHorizontal){
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        }else{
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }
        layer.masksToBounds=true
    }
    
    // Helper to return the main layer as CAGradientLayer
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    
    
    
}