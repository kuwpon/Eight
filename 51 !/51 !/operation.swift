//
//  operation.swift
//  51game
//
//  Created by 桑原綾人 on 2014/10/13.
//  Copyright (c) 2014年 game. All rights reserved.
//

import Foundation
/*
var gameclearflg:Bool=false{
willSet{
    var game=GameViewController()
    // game.gameclear()
    //game.time4()
   // println("flfffklr")
    
}
}
*/
func clear(selfcard:[String],turncount:Int)->Bool{
    var play2score:Int=0
    var headstring2:String?
    var selecthead=[String]()
    var selecthuter=[String]()
    var selecthuter2=[String]()
    var maxselect:[Int]=[0,0,0,0,0]
    var point3=[Int]()
    
    var element=[Int]()
    
    var ccount2:Int=0
    var dcount2:Int=0
    var scount2:Int=0
    var hcount2:Int=0
    var joker:Bool=false
    var pointflg=false
    
    var gameclearflg:Bool=false
    
    var p1,p2,p3,p4:Int?
    
    
    if turncount==0{
       p1=80
       p2=70
       p3=60
       p4=30
    }
    else if turncount==1{
        p1=75
        p2=65
        p3=55
        p4=20
    }
    else if turncount==2{
        p1=70
        p2=60
        p3=50
        p4=10
    }
    else {
        p1=60
        p2=50
        p3=40
        p4=1
    }
   // print("p1 \(p1) p2 \(p2) p3 \(p3) p4 \(p4)")
    for var ta=0; ta<5; ta++ {
        
        var maxindex:Int?
        
        
        var cut=(selfcard[ta] as NSString).substringToIndex(1)
        var cut2=(selfcard[ta] as NSString).substringFromIndex(1)
        
        selecthead.insert(cut, atIndex: ta)
        selecthuter.insert(cut2, atIndex: ta)
    }
    
    for var ta=0; ta<5; ta++ {
        if selecthead[ta]=="c"{
            ccount2=ccount2+1}
        else if selecthead[ta]=="d"{
            dcount2=dcount2+1
        }
        else if selecthead[ta]=="s"{
            scount2=scount2+1
        }
        else if selecthead[ta]=="h"{
            hcount2=hcount2+1
        }
        else if selecthead[ta]=="x"{
            joker=true
        }
        
        
    }
    var headcount2=[Int]()
    headcount2.insert(ccount2, atIndex: 0)
    headcount2.insert(dcount2, atIndex: 1)
    headcount2.insert(scount2, atIndex: 2)
    headcount2.insert(hcount2, atIndex: 3)
    
    for var ta=0; ta<5; ta++ {
        if (selecthuter[ta]=="0") || (selecthuter[ta]=="10") || (selecthuter[ta]=="11") || (selecthuter[ta]=="12") {
            point3.insert(10, atIndex: ta)
        }
        else if (selecthuter[ta]=="1"){
            point3.insert(11, atIndex: ta)
        }
        else if (selecthuter[ta]=="2"){
            point3.insert(2, atIndex: ta)
        }
        else if (selecthuter[ta]=="3"){
            point3.insert(3, atIndex: ta)
        }
        else if (selecthuter[ta]=="4"){
            point3.insert(4, atIndex: ta)
        }
        else if (selecthuter[ta]=="5"){
            point3.insert(5, atIndex: ta)
        }
        else if (selecthuter[ta]=="6"){
            point3.insert(6, atIndex: ta)
        }
        else if (selecthuter[ta]=="7"){
            point3.insert(7, atIndex: ta)
        }
        else if (selecthuter[ta]=="8"){
            point3.insert(8, atIndex: ta)
        }
        else if (selecthuter[ta]=="9"){
            point3.insert(9, atIndex: ta)
        }
        
        
    }
    
    var sum = point3.reduce(0, combine: { $0 + $1 })
    
    
    var probability=Int(arc4random()%100)
    
  //  print("probability \(probability)")
    if sum>=47{
        pointflg=true
    }
    else if(41<=sum && sum<=46){
        if probability<p1{
            pointflg=true
        }
    }
        
        
    else if(37<=sum && sum<=40){
        if probability<p2{
            pointflg=true
        }
    }
    else if(33<=sum && sum<=36){
        if probability<p3{
            pointflg=true
        }
    }
    else if(sum<=32){
        if probability<p4{
            pointflg=true
        }
    }
    
    
    
    var clearflg=headcount2.filter{$0==5}
    
    
    if (((ccount2==4) && (joker==true)) || ((dcount2==4) && (joker==true)) || ((scount2==4) && (joker==true)) || ((hcount2==4) && (joker==true))){
        gameclearflg=true
        return gameclearflg
        
    }
    
    if(clearflg.isEmpty){
        return gameclearflg
    }
    else if ((clearflg[0]==5) && (pointflg==true)){
        gameclearflg=true
        
        return gameclearflg
        
    }
    
    //gameclearflg=true
    return gameclearflg
    
}
func selfclear(selfcard:[String])->Bool{
    var play2score:Int=0
    var headstring2:String?
    var selecthead=[String]()
    var selecthuter=[String]()
    var selecthuter2=[String]()
    var maxselect:[Int]=[0,0,0,0,0]
    var point3=[Int]()
    
    var element=[Int]()
    
    var ccount2:Int=0
    var dcount2:Int=0
    var scount2:Int=0
    var hcount2:Int=0
    var joker:Bool=false
    var pointflg=false
    
    var gameclearflg:Bool=false
    
    var p1,p2,p3,p4:Int?
    
    
    for var ta=0; ta<5; ta++ {
        
        var maxindex:Int?
        
        
        var cut=(selfcard[ta] as NSString).substringToIndex(1)
        var cut2=(selfcard[ta] as NSString).substringFromIndex(1)
        
        selecthead.insert(cut, atIndex: ta)
        selecthuter.insert(cut2, atIndex: ta)
    }
    
    for var ta=0; ta<5; ta++ {
        if selecthead[ta]=="c"{
            ccount2=ccount2+1}
        else if selecthead[ta]=="d"{
            dcount2=dcount2+1
        }
        else if selecthead[ta]=="s"{
            scount2=scount2+1
        }
        else if selecthead[ta]=="h"{
            hcount2=hcount2+1
        }
        else if selecthead[ta]=="x"{
            joker=true
        }
        
        
    }
    var headcount2=[Int]()
    headcount2.insert(ccount2, atIndex: 0)
    headcount2.insert(dcount2, atIndex: 1)
    headcount2.insert(scount2, atIndex: 2)
    headcount2.insert(hcount2, atIndex: 3)
    
    for var ta=0; ta<5; ta++ {
        if (selecthuter[ta]=="0") || (selecthuter[ta]=="10") || (selecthuter[ta]=="11") || (selecthuter[ta]=="12") {
            point3.insert(10, atIndex: ta)
        }
        else if (selecthuter[ta]=="1"){
            point3.insert(11, atIndex: ta)
        }
        else if (selecthuter[ta]=="2"){
            point3.insert(2, atIndex: ta)
        }
        else if (selecthuter[ta]=="3"){
            point3.insert(3, atIndex: ta)
        }
        else if (selecthuter[ta]=="4"){
            point3.insert(4, atIndex: ta)
        }
        else if (selecthuter[ta]=="5"){
            point3.insert(5, atIndex: ta)
        }
        else if (selecthuter[ta]=="6"){
            point3.insert(6, atIndex: ta)
        }
        else if (selecthuter[ta]=="7"){
            point3.insert(7, atIndex: ta)
        }
        else if (selecthuter[ta]=="8"){
            point3.insert(8, atIndex: ta)
        }
        else if (selecthuter[ta]=="9"){
            point3.insert(9, atIndex: ta)
        }
        
        
    }
    
    var sum = point3.reduce(0, combine: { $0 + $1 })
    
    
    var probability=Int(arc4random()%100)
    
    
    if sum>=47{
        pointflg=true
    }
    else if(41<=sum && sum<=46){
        if probability<80{
            pointflg=true
        }
    }
        
        
    else if(37<=sum && sum<=40){
        if probability<70{
            pointflg=true
        }
    }
    else if(33<=sum && sum<=36){
        if probability<60{
            pointflg=true
        }
    }
    else if(sum<=32){
        if probability<50{
            pointflg=true
        }
    }
    
    
    
    var clearflg=headcount2.filter{$0==5}
    
    
    if (((ccount2==4) && (joker==true)) || ((dcount2==4) && (joker==true)) || ((scount2==4) && (joker==true)) || ((hcount2==4) && (joker==true))){
        gameclearflg=true
        return gameclearflg
        
    }
    
    if(clearflg.isEmpty){
        return gameclearflg
    }
    else if ((clearflg[0]==5) && (pointflg==true)){
        gameclearflg=true
        
        return gameclearflg
        
    }
    
    gameclearflg=true
    return gameclearflg
    
}

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


func passflg(selfcard: [String],opencard: [String])->Bool{
    
    var headstring2:String?
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
    
    
    
    for var ta=0; ta<5; ta++ {
        
        var maxindex:Int?
        
        var cut=(opencard[ta] as NSString).substringToIndex(1)
        var cut2=(opencard[ta] as NSString).substringFromIndex(1)
        
        openhead.insert(cut, atIndex: ta)
        openhuter.insert(cut2, atIndex: ta)
    }
    
    for var ta=0; ta<5; ta++ {
        
        var maxindex:Int?
        
        var cut=(selfcard[ta] as NSString).substringToIndex(1)
        var cut2=(selfcard[ta] as NSString).substringFromIndex(1)
        
        selfhead.insert(cut, atIndex: ta)
        selfhuter.insert(cut2, atIndex: ta)
    }
    
    for var ta=0; ta<5; ta++ {
        if openhead[ta]=="c"{
            ccount2=ccount2+1}
        else if openhead[ta]=="d"{
            dcount2=dcount2+1
        }
        else if openhead[ta]=="s"{
            scount2=scount2+1
        }
        else if openhead[ta]=="h"{
            hcount2=hcount2+1
        }
        
    }
    
    for var ta=0; ta<5; ta++ {
        if selfhead[ta]=="c"{
            ccount=ccount+1}
        else if selfhead[ta]=="d"{
            dcount=dcount+1
        }
        else if selfhead[ta]=="s"{
            scount=scount+1
        }
        else if selfhead[ta]=="h"{
            hcount=hcount+1
        }
        
    }
    var headcount2=[Int]()
    var headcount=[Int]()
    var cutfilter=[String]()
    headcount2.insert(ccount2, atIndex: 0)
    headcount2.insert(dcount2, atIndex: 1)
    headcount2.insert(scount2, atIndex: 2)
    headcount2.insert(hcount2, atIndex: 3)
    headcount.insert(ccount, atIndex: 0)
    headcount.insert(dcount, atIndex: 1)
    headcount.insert(scount, atIndex: 2)
    headcount.insert(hcount, atIndex: 3)
   
    
    
    
    var selfmaxhead=headcount.maxElement()!
    var openmaxhead=headcount2.maxElement()!
    var maxselfchar:String?
    var maxopenchar:String?
    var selfmaxheadindex=headcount.indexOf(selfmaxhead)
    var openmaxheadindex=headcount2.indexOf(openmaxhead)
    
    if selfmaxheadindex==0{
        maxselfchar="c"
    }
    else if selfmaxheadindex==1{
        maxselfchar="d"
    }
    else if selfmaxheadindex==2{
        maxselfchar="s"
    }
    else if selfmaxheadindex==3{
        maxselfchar="h"
    }
    
    if openmaxheadindex==0{
        maxopenchar="c"
    }
    else if openmaxheadindex==1{
        maxopenchar="d"
    }
    else if openmaxheadindex==2{
        maxopenchar="s"
    }
    else if openmaxheadindex==3{
        maxopenchar="h"
    }
    
    
    var maxfilterselfhead=selfcard.filter{$0.hasPrefix(maxselfchar!)}
    var maxfilteropenhead=opencard.filter{$0.hasPrefix(maxopenchar!)}
    var selffindopencard=opencard.filter{$0.hasPrefix(maxselfchar!)}
    
    for var ta=0;ta<selfmaxhead;ta++ {
        var cutmaxfilter=(maxfilterselfhead[ta] as NSString).substringFromIndex(1)
        cutfilter.append(cutmaxfilter)
        
        if (cutfilter[ta]=="0") || (cutfilter[ta]=="10") || (cutfilter[ta]=="11") || (cutfilter[ta]=="12") {
            point3.insert(10, atIndex: ta)
        }
        else if (cutfilter[ta]=="1"){
            point3.insert(11, atIndex: ta)
        }
        else if (cutfilter[ta]=="2"){
            point3.insert(2, atIndex: ta)
        }
        else if (cutfilter[ta]=="3"){
            point3.insert(3, atIndex: ta)
        }
        else if (cutfilter[ta]=="4"){
            point3.insert(4, atIndex: ta)
        }
        else if (cutfilter[ta]=="5"){
            point3.insert(5, atIndex: ta)
        }
        else if (cutfilter[ta]=="6"){
            point3.insert(6, atIndex: ta)
        }
        else if (cutfilter[ta]=="7"){
            point3.insert(7, atIndex: ta)
        }
        else if (cutfilter[ta]=="8"){
            point3.insert(8, atIndex: ta)
        }
        else if (cutfilter[ta]=="9"){
            point3.insert(9, atIndex: ta)
        }
        
    }
    let selfheadmaxsum=point3.reduce(0, combine: { $0 + $1 })
    
    
    if openmaxheadindex==0{
        maxopenchar="c"
    }
    else if openmaxheadindex==1{
        maxopenchar="d"
    }
    else if openmaxheadindex==2{
        maxopenchar="s"
    }
    else if openmaxheadindex==3{
        maxopenchar="h"
    }
    for var ta=0;ta<openmaxhead;ta++ {
        var cutmaxfilter=(maxfilteropenhead[ta] as NSString).substringFromIndex(1)
        cutfilter.append(cutmaxfilter)
        
        if (cutfilter[ta]=="0") || (cutfilter[ta]=="10") || (cutfilter[ta]=="11") || (cutfilter[ta]=="12") {
            point4.insert(10, atIndex: ta)
        }
        else if (cutfilter[ta]=="1"){
            point4.insert(11, atIndex: ta)
        }
        else if (cutfilter[ta]=="2"){
            point4.insert(2, atIndex: ta)
        }
        else if (cutfilter[ta]=="3"){
            point4.insert(3, atIndex: ta)
        }
        else if (cutfilter[ta]=="4"){
            point4.insert(4, atIndex: ta)
        }
        else if (cutfilter[ta]=="5"){
            point4.insert(5, atIndex: ta)
        }
        else if (cutfilter[ta]=="6"){
            point4.insert(6, atIndex: ta)
        }
        else if (cutfilter[ta]=="7"){
            point4.insert(7, atIndex: ta)
        }
        else if (cutfilter[ta]=="8"){
            point4.insert(8, atIndex: ta)
        }
        else if (cutfilter[ta]=="9"){
            point4.insert(9, atIndex: ta)
        }
        
    }
    let openheadmaxsum=point4.reduce(0, combine: { $0 + $1 })
    // openmaxheadは3 openheadmaxsumは25に設定する
    var rand=Int(arc4random()%100)
    if (selffindopencard.isEmpty) && rand<31{
        return true
    }
        
    else if ((openmaxhead<selfmaxhead) && (selfmaxhead>=3)) && ((selfheadmaxsum<openheadmaxsum) && (selfheadmaxsum>=25)){
        
        return true
    }
    
    
    return false
}


func allchange(selfcard: [String],opencard: [String])->Bool{
    
    var headstring2:String?
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
    
    
    
    for var ta=0; ta<5; ta++ {
        
        var maxindex:Int?
        
        var cut=(opencard[ta] as NSString).substringToIndex(1)
        var cut2=(opencard[ta] as NSString).substringFromIndex(1)
        
        openhead.insert(cut, atIndex: ta)
        openhuter.insert(cut2, atIndex: ta)
    }
    
    for var ta=0; ta<5; ta++ {
        
        var maxindex:Int?
        
        var cut=(selfcard[ta] as NSString).substringToIndex(1)
        var cut2=(selfcard[ta] as NSString).substringFromIndex(1)
        
        selfhead.insert(cut, atIndex: ta)
        selfhuter.insert(cut2, atIndex: ta)
    }
    
    for var ta=0; ta<5; ta++ {
        if openhead[ta]=="c"{
            ccount2=ccount2+1}
        else if openhead[ta]=="d"{
            dcount2=dcount2+1
        }
        else if openhead[ta]=="s"{
            scount2=scount2+1
        }
        else if openhead[ta]=="h"{
            hcount2=hcount2+1
        }
        
    }
    
    for var ta=0; ta<5; ta++ {
        if selfhead[ta]=="c"{
            ccount=ccount+1}
        else if selfhead[ta]=="d"{
            dcount=dcount+1
        }
        else if selfhead[ta]=="s"{
            scount=scount+1
        }
        else if selfhead[ta]=="h"{
            hcount=hcount+1
        }
        
    }
    var headcount2=[Int]()
    var headcount=[Int]()
    var cutfilter=[String]()
    headcount2.insert(ccount2, atIndex: 0)
    headcount2.insert(dcount2, atIndex: 1)
    headcount2.insert(scount2, atIndex: 2)
    headcount2.insert(hcount2, atIndex: 3)
    headcount.insert(ccount, atIndex: 0)
    headcount.insert(dcount, atIndex: 1)
    headcount.insert(scount, atIndex: 2)
    headcount.insert(hcount, atIndex: 3)
    
    
    
    
    var selfmaxhead=headcount.maxElement()!
    var openmaxhead=headcount2.maxElement()!
    var maxselfchar:String?
    var maxopenchar:String?
    var selfmaxheadindex=headcount.indexOf(selfmaxhead)
    var openmaxheadindex=headcount2.indexOf(openmaxhead)
    
    if selfmaxheadindex==0{
        maxselfchar="c"
    }
    else if selfmaxheadindex==1{
        maxselfchar="d"
    }
    else if selfmaxheadindex==2{
        maxselfchar="s"
    }
    else if selfmaxheadindex==3{
        maxselfchar="h"
    }
    
    if openmaxheadindex==0{
        maxopenchar="c"
    }
    else if openmaxheadindex==1{
        maxopenchar="d"
    }
    else if openmaxheadindex==2{
        maxopenchar="s"
    }
    else if openmaxheadindex==3{
        maxopenchar="h"
    }
    
    
    var maxfilterselfhead=selfcard.filter{$0.hasPrefix(maxselfchar!)}
    var maxfilteropenhead=opencard.filter{$0.hasPrefix(maxopenchar!)}
    
    
    for var ta=0;ta<selfmaxhead;ta++ {
        var cutmaxfilter=(maxfilterselfhead[ta] as NSString).substringFromIndex(1)
        cutfilter.append(cutmaxfilter)
        
        if (cutfilter[ta]=="0") || (cutfilter[ta]=="10") || (cutfilter[ta]=="11") || (cutfilter[ta]=="12") {
            point3.insert(10, atIndex: ta)
        }
        else if (cutfilter[ta]=="1"){
            point3.insert(11, atIndex: ta)
        }
        else if (cutfilter[ta]=="2"){
            point3.insert(2, atIndex: ta)
        }
        else if (cutfilter[ta]=="3"){
            point3.insert(3, atIndex: ta)
        }
        else if (cutfilter[ta]=="4"){
            point3.insert(4, atIndex: ta)
        }
        else if (cutfilter[ta]=="5"){
            point3.insert(5, atIndex: ta)
        }
        else if (cutfilter[ta]=="6"){
            point3.insert(6, atIndex: ta)
        }
        else if (cutfilter[ta]=="7"){
            point3.insert(7, atIndex: ta)
        }
        else if (cutfilter[ta]=="8"){
            point3.insert(8, atIndex: ta)
        }
        else if (cutfilter[ta]=="9"){
            point3.insert(9, atIndex: ta)
        }
        
    }
    let selfheadmaxsum=point3.reduce(0, combine: { $0 + $1 })
    
    
    if openmaxheadindex==0{
        maxopenchar="c"
    }
    else if openmaxheadindex==1{
        maxopenchar="d"
    }
    else if openmaxheadindex==2{
        maxopenchar="s"
    }
    else if openmaxheadindex==3{
        maxopenchar="h"
    }
    for var ta=0;ta<openmaxhead;ta++ {
        var cutmaxfilter=(maxfilteropenhead[ta] as NSString).substringFromIndex(1)
        cutfilter.append(cutmaxfilter)
        
        if (cutfilter[ta]=="0") || (cutfilter[ta]=="10") || (cutfilter[ta]=="11") || (cutfilter[ta]=="12") {
            point4.insert(10, atIndex: ta)
        }
        else if (cutfilter[ta]=="1"){
            point4.insert(11, atIndex: ta)
        }
        else if (cutfilter[ta]=="2"){
            point4.insert(2, atIndex: ta)
        }
        else if (cutfilter[ta]=="3"){
            point4.insert(3, atIndex: ta)
        }
        else if (cutfilter[ta]=="4"){
            point4.insert(4, atIndex: ta)
        }
        else if (cutfilter[ta]=="5"){
            point4.insert(5, atIndex: ta)
        }
        else if (cutfilter[ta]=="6"){
            point4.insert(6, atIndex: ta)
        }
        else if (cutfilter[ta]=="7"){
            point4.insert(7, atIndex: ta)
        }
        else if (cutfilter[ta]=="8"){
            point4.insert(8, atIndex: ta)
        }
        else if (cutfilter[ta]=="9"){
            point4.insert(9, atIndex: ta)
        }
        
    }
    let openheadmaxsum=point4.reduce(0, combine: { $0 + $1 })
    // openmaxheadは3 openheadmaxsumは25に設定する
    if ((openmaxhead>selfmaxhead) && (openmaxhead>=3)) && ((selfheadmaxsum<openheadmaxsum) && (openheadmaxsum>=25)){
        
        return true
    }
    
    
    return false
}
