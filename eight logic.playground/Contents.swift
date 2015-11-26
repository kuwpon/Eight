//: Playground - noun: a place where people can play

import UIKit
import GameplayKit
var head=["d1","s12","h10","h4","s6"]
var opencard=["s6"]


func samesuitflg(selfcard: [String],opencard: [String])->(Bool,Int){
    

    var selfhead=[String]()
    var selfhuter=[String]()
    
    var openhead=[String]()
    var openhuter=[String]()
    var selecthuter2=[String]()
    var maxselect:[Int]=[0,0,0,0,0]
    var point3=[Int]()
    var point4=[Int]()
    var element=[Int]()
    
    var ccount2:Int=0
    var dcount2:Int=0
    var scount2:Int=0
    var hcount2:Int=0
    var ccount:Int=0
    var dcount:Int=0
    var scount:Int=0
    var hcount:Int=0
    
    
    element.removeAll()
    point3.removeAll()
    
    
    for var ta=0; ta<1; ta++ {
        
       
        
        var cut=(opencard[ta] as NSString).substringToIndex(1)
        var cut2=(opencard[ta] as NSString).substringFromIndex(1)
        
        openhead.insert(cut, atIndex: ta)
        openhuter.insert(cut2, atIndex: ta)
    }
  
    
    for var ta=0; ta<5; ta++ {
        
        
        var cut=(selfcard[ta] as NSString).substringToIndex(1)
        var cut2=(selfcard[ta] as NSString).substringFromIndex(1)
        
        selfhead.insert(cut, atIndex: ta)
        selfhuter.insert(cut2, atIndex: ta)
        
    }
    
   var selfcardcount=selfhead.count
    var hitindex:[Int]=[Int]()
    
    for var t=0; t<selfcardcount; t++ {
     
        if selfhead[t]==openhead[0]{
        hitindex.append(t)
          hitindex.sortInPlace { _,_ in arc4random() < arc4random() }
        }
       
    }
    
   
    if hitindex.isEmpty{
        return (false,0)
    }
    else{
         
        return (true,hitindex[0])
    }
    
    
}
samesuitflg(head,opencard: opencard)
