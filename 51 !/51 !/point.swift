//
//  point.swift
//  51game
//
//  Created by 桑原綾人 on 2014/10/13.
//  Copyright (c) 2014年 game. All rights reserved.
//

import Foundation

func point(head: [String])->Int{
    var sum:Int=0
    var cardpoint=[String]()
    
    var head2=[String]()
    var huter=[String]()
    var huter2=[String]()
    
    var point=[Int]()
    var ccount2:Int=0
    var dcount2:Int=0
    var scount2:Int=0
    var hcount2:Int=0
    
    
    head2.removeAll()
    huter.removeAll()
    huter2.removeAll()
    point.removeAll()
    var headcount=[Int]()
    
    var headcount3=[Int]()
    var joker=false
    
    for t in 0...4{
        
        var cut=(head[t] as NSString).substringToIndex(1)
        /* 末尾文字 */
        var cut2=(head[t] as NSString).substringFromIndex(1)
        
        head2.insert(cut, atIndex:t)
        huter2.insert(cut2, atIndex:t)
        
    }
    for var ta=0; ta<5; ta++ {
        if head2[ta]=="c"{
            ccount2=ccount2+1}
        else if head2[ta]=="d"{
            dcount2=dcount2+1
        }
        else if head2[ta]=="s"{
            scount2=scount2+1
        }
        else if head2[ta]=="h"{
            hcount2=hcount2+1
        }
        else if head2[ta]=="x"{
            joker=true
        }
    }
    var headcount2=[Int]()
    headcount2.insert(ccount2, atIndex: 0)
    headcount2.insert(dcount2, atIndex: 1)
    headcount2.insert(scount2, atIndex: 2)
    headcount2.insert(hcount2, atIndex: 3)
    for var t=0; t<5; t++ {
        
        /* 格納されているカードの点数化*/
        if (huter2[t]=="0"){
            point.insert(10, atIndex: t)
        }
        else if (huter2[t]=="1"){
            point.insert(11, atIndex: t)
        }
        else if (huter2[t]=="2"){
            point.insert(2, atIndex: t)
        }
        else if (huter2[t]=="3"){
            point.insert(3, atIndex: t)
        }
        else if (huter2[t]=="4"){
            point.insert(4, atIndex: t)
        }
        else if (huter2[t]=="5"){
            point.insert(5, atIndex: t)
        }
        else if (huter2[t]=="6"){
            point.insert(6, atIndex: t)
        }
        else if (huter2[t]=="7"){
            point.insert(7, atIndex: t)
        }
        else if (huter2[t]=="8"){
            point.insert(8, atIndex: t)
        }
        else if (huter2[t]=="9"){
            point.insert(9, atIndex: t)
        }
        else if (huter2[t]=="10"){
            point.insert(10, atIndex: t)
        }
        else if (huter2[t]=="11"){
            point.insert(10, atIndex: t)
        }
        else if (huter2[t]=="12"){
            point.insert(10, atIndex: t)
        }
        
        
        
    }
    
    var clearflg=headcount2.filter{$0==5}
    if(((ccount2==4) && (joker==true)) || ((dcount2==4) && (joker==true)) || ((scount2==4) && (joker==true)) || ((hcount2==4) && (joker==true))){
        sum=point[0]+point[1]+point[2]+point[3]+point[4]
        if sum>51{
            return 51
        }
        else{
            return sum
        }
    }
        
    else if clearflg.isEmpty{
        return 0
    }
    else {
        sum=point.reduce(0, combine: { $0 + $1 })
    }
    return sum
}
//ジョーカーを含む場合の判別　戻り値　ジョーカーあり、含んでいるインデックス、同じ点数の数
func jokerinclude(player: Array<String>,player2: Array<String>,player3: Array<String>,player4: Array<String>)->(Bool,Int,Int){
    //var playerjoker=player.filter{("x1")}
    let playerjoker=player.contains("x1")
    let player2joker=player2.contains("x1")
    let player3joker=player3.contains("x1")
    let player4joker=player4.contains("x1")
    
    if playerjoker==true{
        
        if ((point(player)==point(player2)) || (point(player)==point(player3)) || (point(player)==point(player4))){
            
            if  (point(player)==point(player2)) && (point(player)==point(player3)){
                return (true,0,2)
            }
            else if  (point(player)==point(player2)) && (point(player)==point(player4)){
                return (true,0,2)
            }
            else if  (point(player)==point(player4)) && (point(player)==point(player3)){
                return (true,0,2)
            }
                
            else if (point(player)==point(player2)){
                
                return (true,0,1)
            }
            else if  (point(player)==point(player3)){
                return (true,0,1)
            }
            else if  (point(player)==point(player4)){
                return (true,0,1)
            }
            
        }
        
    }
    else if  player2joker==true{
        if ((point(player2)==point(player)) || (point(player2)==point(player3)) || (point(player2)==point(player4))){
            
            
            if  (point(player2)==point(player)) && (point(player2)==point(player3)){
                return (true,1,2)
            }
            else if  (point(player2)==point(player)) && (point(player2)==point(player4)){
                return (true,1,2)
            }
            else if  (point(player2)==point(player4)) && (point(player2)==point(player3)){
                return (true,1,2)
            }
                
                
            else if (point(player2)==point(player)){
                
                return (true,1,1)
            }
            else if  (point(player2)==point(player3)){
                return (true,1,1)
            }
            else if  (point(player2)==point(player4)){
                return (true,1,1)
            }
            
        }
        
        
    }
        
    else if  player3joker==true{
        if ((point(player3)==point(player)) || (point(player3)==point(player2)) || (point(player3)==point(player4))){
            
            if  (point(player3)==point(player2)) && (point(player3)==point(player)){
                return (true,2,2)
            }
            else if  (point(player3)==point(player2)) && (point(player3)==point(player4)){
                return (true,2,2)
            }
            else if  (point(player3)==point(player4)) && (point(player3)==point(player)){
                return (true,2,2)
            }
                
            else if (point(player3)==point(player)){
                
                return (true,2,1)
            }
            else if  (point(player3)==point(player2)){
                return (true,2,1)
            }
            else if  (point(player3)==point(player4)){
                return (true,2,1)
            }
            
            
        }
        
    }
        
    else if  player4joker==true {
        if ((point(player4)==point(player)) || (point(player4)==point(player2)) || (point(player4)==point(player3))){
            
            if  (point(player4)==point(player2)) && (point(player4)==point(player3)){
                return (true,3,2)
            }
            else if  (point(player4)==point(player2)) && (point(player4)==point(player)){
                return (true,3,2)
            }
            else if  (point(player4)==point(player)) && (point(player4)==point(player3)){
                return (true,3,2)
            }
            else if (point(player4)==point(player)){
                
                return (true,3,1)
            }
            else if  (point(player4)==point(player2)){
                return (true,3,1)
            }
            else if  (point(player4)==point(player3)){
                return (true,3,1)
            }
            
            
        }
        
    }
    else if ((point(player4)>0) || (point(player2)>0) || (point(player3)>0) || (point(player)>0)){
        return (false,0,0)
    }
    
    return (false,0,0)
}