// Playground - noun: a place where people can play

import UIKit
import SpriteKit
var head=["x1","s12","h10","h4","s6"]
var headstring:String?=nil

/*不要なカードを選択 */
func headcut(head: [String])->[String]{
    var head2=[String]()
    var huter=[String]()
    var huter2=[String]()
    
    var point=[Int]()
      
    
    head2.removeAll()
    huter.removeAll()
    huter2.removeAll()
    point.removeAll()
  
    
    for var t=0; t<5; t++ {
        /* 先頭文字 */
        let cut=(head[t] as NSString).substringToIndex(1)
        /* 末尾文字 */
        let cut2=(head[t] as NSString).substringFromIndex(1)
        
        head2.insert(cut, atIndex:t)
        huter2.insert(cut2, atIndex:t)
    }
    return head2
}
func headretune(head: [String])->Int{
    var head2=[String]()
    var huter=[String]()
    var huter2=[String]()
    
    var point=[Int]()
    var pointc=[Int]()
    var pointd=[Int]()
    var pointh=[Int]()
    var points=[Int]()
    var pointmin=[Int]()
    
    var ccount:Int=0
    var dcount:Int=0
    var scount:Int=0
    var hcount:Int=0
    
    
    head2.removeAll()
    huter.removeAll()
    huter2.removeAll()
    point.removeAll()
    var headcount=[Int]()
    
    var headcount3=[Int]()
    
    for var t=0; t<5; t++ {
        /* 先頭文字 */
        var cut=(head[t] as NSString).substringToIndex(1)
        /* 末尾文字 */
        var cut2=(head[t] as NSString).substringFromIndex(1)
        
        head2.insert(cut, atIndex:t)
        huter2.insert(cut2, atIndex:t)
    }
    /* 先頭文字の格納数をカウント*/
    
    for var t=0; t<5; t++ {
        if head2[t]=="c"{
            ccount=ccount+1}
        else if head2[t]=="d"{
            dcount=dcount+1
        }
        else if head2[t]=="s"{
            scount=scount+1
        }
        else if head2[t]=="h"{
            hcount=hcount+1
        }
        
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
    
    headcount.insert(ccount, atIndex: 0)
    headcount.insert(dcount, atIndex: 1)
    headcount.insert(scount, atIndex: 2)
    headcount.insert(hcount, atIndex: 3)
    var twicechar=headcount.indexOf(2)
    headcount[0]==0
    
    var headcountmax=headcount.indexOf(headcount.maxElement()!)
    
    var twicecount=headcount.filter{$0==2}
    
    var zerocount=headcount.filter{$0==0}
    
    var sum = point.reduce(0, combine: { $0 + $1 })
    
    if ( twicecount.count==1)||(twicecount.count==0){
        
        if (headcountmax==0){
            headstring="c" }
        else if (headcountmax==1){
            headstring="d"}
        else if (headcountmax==2){
            headstring="s"}
        else if (headcountmax==3){
            headstring="h"}
        
        
    }
        
        
        
    else if  ((twicecount.count==2) && ((zerocount.count==2)==false)){
        /* スートが同じものが２種類ある場合 */
        if ccount==scount{
            var  ctwice=head.filter{$0.hasPrefix("c")}
            var  stwice=head.filter{$0.hasPrefix("s")}
            var ct1=head.indexOf(ctwice[0])
            var ct2=head.indexOf(ctwice[1])
            var st1=head.indexOf(stwice[0])
            var st2=head.indexOf(stwice[1])
            var cttotal=point[ct1!]+point[ct2!]
            var sttotal=point[st1!]+point[st2!]
            if cttotal>sttotal{
                headstring="c"
            }
            else{
                headstring="s"
            }
            
        }
        else   if ccount==dcount{
            var  ctwice=head.filter{$0.hasPrefix("c")}
            var  dtwice=head.filter{$0.hasPrefix("d")}
            var ct1=head.indexOf(ctwice[0])
            var ct2=head.indexOf(ctwice[1])
            var dt1=head.indexOf(dtwice[0])
            var dt2=head.indexOf(dtwice[1])
            var cttotal=point[ct1!]+point[ct2!]
            var dttotal=point[dt1!]+point[dt2!]
            if cttotal>dttotal{
                headstring="c"
            }
            else{
                headstring="d"
            }
            
        }
        else   if ccount==hcount{
            var  ctwice=head.filter{$0.hasPrefix("c")}
            var  htwice=head.filter{$0.hasPrefix("h")}
            var ct1=head.indexOf(ctwice[0])
            var ct2=head.indexOf(ctwice[1])
            var ht1=head.indexOf(htwice[0])
            var ht2=head.indexOf(htwice[1])
            var cttotal=point[ct1!]+point[ct2!]
            var httotal=point[ht1!]+point[ht2!]
            if cttotal>httotal{
                headstring="c"
            }
            else{
                headstring="h"
            }
            
        }
        else   if dcount==hcount{
            var  dtwice=head.filter{$0.hasPrefix("d")}
            var  htwice=head.filter{$0.hasPrefix("h")}
            var dt1=head.indexOf(dtwice[0])
            var dt2=head.indexOf(dtwice[1])
            var ht1=head.indexOf(htwice[0])
            var ht2=head.indexOf(htwice[1])
            var dttotal=point[dt1!]+point[dt2!]
            var httotal=point[ht1!]+point[ht2!]
            if dttotal>httotal{
                headstring="d"
            }
            else{
                headstring="h"
            }
            
        }
        else   if dcount==scount{
            var  dtwice=head.filter{$0.hasPrefix("d")}
            var  stwice=head.filter{$0.hasPrefix("s")}
            var dt1=head.indexOf(dtwice[0])
            var dt2=head.indexOf(dtwice[1])
            var st1=head.indexOf(stwice[0])
            var st2=head.indexOf(stwice[1])
            var dttotal=point[dt1!]+point[dt2!]
            var sttotal=point[st1!]+point[st2!]
            if dttotal>sttotal{
                headstring="d"
            }
            else{
                headstring="s"
            }
            
        }
        else   if hcount==scount{
            var  htwice=head.filter{$0.hasPrefix("h")}
            var  stwice=head.filter{$0.hasPrefix("s")}
            var ht1=head.indexOf(htwice[0])
            var ht2=head.indexOf(htwice[1])
            var st1=head.indexOf(stwice[0])
            var st2=head.indexOf(stwice[1])
            var httotal=point[ht1!]+point[ht2!]
            var sttotal=point[st1!]+point[st2!]
            if httotal>sttotal{
                headstring="h"
            }
            else{
                headstring="s"
            }
            
        }
    }
    else if  ((twicecount.count==2) && ((zerocount.count==2)==true)){
        /* スートが同じものが２種類ある場合でジョーカーがある場合 */
        
        
        if (ccount==scount) && (headcount[1]==0){
            var  ctwice=head.filter{$0.hasPrefix("c")}
            var  stwice=head.filter{$0.hasPrefix("s")}
            var ct1=head.indexOf(ctwice[0])
            var ct2=head.indexOf(ctwice[1])
            var st1=head.indexOf(stwice[0])
            var st2=head.indexOf(stwice[1])
            var cttotal=point[ct1!]+point[ct2!]
            var sttotal=point[st1!]+point[st2!]
            if cttotal>sttotal{
                headstring="c"
            }
            else{
                headstring="s"
            }
            
        }
        else   if ccount==dcount &&  (headcount[2]==0){
            var  ctwice=head.filter{$0.hasPrefix("c")}
            var  dtwice=head.filter{$0.hasPrefix("d")}
            var ct1=head.indexOf(ctwice[0])
            var ct2=head.indexOf(ctwice[1])
            var dt1=head.indexOf(dtwice[0])
            var dt2=head.indexOf(dtwice[1])
            var cttotal=point[ct1!]+point[ct2!]
            var dttotal=point[dt1!]+point[dt2!]
            if cttotal>dttotal{
                headstring="c"
            }
            else{
                headstring="d"
            }
            
        }
        else   if ccount==hcount && (headcount[1]==0){
            var  ctwice=head.filter{$0.hasPrefix("c")}
            var  htwice=head.filter{$0.hasPrefix("h")}
            var ct1=head.indexOf(ctwice[0])
            var ct2=head.indexOf(ctwice[1])
            var ht1=head.indexOf(htwice[0])
            var ht2=head.indexOf(htwice[1])
            var cttotal=point[ct1!]+point[ct2!]
            var httotal=point[ht1!]+point[ht2!]
            if cttotal>httotal{
                headstring="c"
            }
            else{
                headstring="h"
            }
            
        }
        else   if dcount==hcount && (headcount[0]==0){
            var  dtwice=head.filter{$0.hasPrefix("d")}
            var  htwice=head.filter{$0.hasPrefix("h")}
            var dt1=head.indexOf(dtwice[0])
            var dt2=head.indexOf(dtwice[1])
            var ht1=head.indexOf(htwice[0])
            var ht2=head.indexOf(htwice[1])
            var dttotal=point[dt1!]+point[dt2!]
            var httotal=point[ht1!]+point[ht2!]
            if dttotal>httotal{
                headstring="d"
            }
            else{
                headstring="h"
            }
            
        }
        else   if dcount==scount && (headcount[0]==0){
            var  dtwice=head.filter{$0.hasPrefix("d")}
            var  stwice=head.filter{$0.hasPrefix("s")}
            var dt1=head.indexOf(dtwice[0])
            var dt2=head.indexOf(dtwice[1])
            var st1=head.indexOf(stwice[0])
            var st2=head.indexOf(stwice[1])
            var dttotal=point[dt1!]+point[dt2!]
            var sttotal=point[st1!]+point[st2!]
            if dttotal>sttotal{
                headstring="d"
            }
            else{
                headstring="s"
            }
            
        }
        else   if hcount==scount && (headcount[0]==0){
            var  htwice=head.filter{$0.hasPrefix("h")}
            var  stwice=head.filter{$0.hasPrefix("s")}
            let ht1=head.indexOf(htwice[0])
            let ht2=head.indexOf(htwice[1])
            let st1=head.indexOf(stwice[0])
            let st2=head.indexOf(stwice[1])
            let httotal=point[ht1!]+point[ht2!]
            let sttotal=point[st1!]+point[st2!]
            if httotal>sttotal{
                headstring="h"
            }
            else{
                headstring="s"
            }
            
        }
    }
    
    
    for var i=0; i<4; i++ {
        
        
        /* 同じスートが2つと3つの組み合わせ  */
        if ((headcount[i]==2)&&(headcount.indexOf(3)) != nil){
            
            if i==0{
                var cstr=[String]()
                cstr.removeAll()
                
                cstr=head.filter{$0.hasPrefix("c")}
                
                var ccut1=(cstr[0] as NSString).substringFromIndex(1)
                var ccut2=(cstr[1] as NSString).substringFromIndex(1)
                var carry=[String]()
                carry.insert(ccut1, atIndex: 0)
                carry.insert(ccut2, atIndex: 1)
                
                
                for var c=0; c<2; c++ {
                    if (carry[c]=="0")||(carry[c]=="10")||(carry[c]=="11")||(carry[c]=="12"){
                        pointc.insert(10, atIndex: c)
                    }
                    else if (carry[c]=="1"){
                        pointc.insert(11, atIndex: c)
                    }
                    else if (carry[c]=="2"){
                        pointc.insert(2, atIndex: c)
                    }
                    else if (carry[c]=="3"){
                        pointc.insert(3, atIndex: c)
                    }
                    else if (carry[c]=="4"){
                        pointc.insert(4, atIndex: c)
                    }
                    else if (carry[c]=="5"){
                        pointc.insert(5, atIndex: c)
                    }
                    else if (carry[c]=="6"){
                        pointc.insert(6, atIndex: c)
                    }
                    else if (carry[c]=="7"){
                        pointc.insert(7, atIndex: c)
                    }
                    else if (carry[c]=="8"){
                        pointc.insert(8, atIndex: c)
                    }
                    else if (carry[c]=="9"){
                        pointc.insert(9, atIndex: c)
                    }
                    
                }
                pointc.sortInPlace()
                /*スート1とスート10,11,12,13の場合 */
                if((pointc[0]==11||pointc[1]==11)&&(pointc[0]==10||pointc[1]==10))
                {
                    var c1fil=head.filter{$0.hasPrefix("c")}
                    var except="c1"
                    var cfilter=head.filter({$0 != except})
                    var cstring=cfilter.filter{$0.hasPrefix("c")}
                    let cstringfind=head.indexOf(cstring[0])!
                    return cstringfind
                    
                    
                }
                else if (pointc[0]>pointc[1]){
                    var cstring="c"+String(pointc[1])
                    let cstringfind=head.indexOf(cstring)!
                    return cstringfind
                }
                else if(pointc[0]<pointc[1]) {
                    
                    var cstring="c"+String(pointc[0])
                    let cstringfind=head.indexOf(cstring)!
                    return cstringfind
                }
                else if(pointc[0]==pointc[1]){
                    var equal=head.indexOf(cstr[0])!
                    return equal
                }
                
                
            }
            else if i==1{
                var dstr=[String]()
                dstr.removeAll()
                dstr=head.filter{$0.hasPrefix("d")}
                
                var dcut1=(dstr[0] as NSString).substringFromIndex(1)
                var dcut2=(dstr[1] as NSString).substringFromIndex(1)
                var darry=[String]()
                darry.insert(dcut1, atIndex: 0)
                darry.insert(dcut2, atIndex: 1)
                
                
                for var c=0; c<2; c++ {
                    if (darry[c]=="0")||(darry[c]=="10")||(darry[c]=="11")||(darry[c]=="12"){
                        pointd.insert(10, atIndex: c)
                    }
                    else if (darry[c]=="1"){
                        pointd.insert(11, atIndex: c)
                    }
                    else if (darry[c]=="2"){
                        pointd.insert(2, atIndex: c)
                    }
                    else if (darry[c]=="3"){
                        pointd.insert(3, atIndex: c)
                    }
                    else if (darry[c]=="4"){
                        pointd.insert(4, atIndex: c)
                    }
                    else if (darry[c]=="5"){
                        pointd.insert(5, atIndex: c)
                    }
                    else if (darry[c]=="6"){
                        pointd.insert(6, atIndex: c)
                    }
                    else if (darry[c]=="7"){
                        pointd.insert(7, atIndex: c)
                    }
                    else if (darry[c]=="8"){
                        pointd.insert(8, atIndex: c)
                    }
                    else if (darry[c]=="9"){
                        pointd.insert(9, atIndex: c)
                    }
                    
                }
                pointd.sortInPlace()
                if((pointd[0]==11||pointd[1]==11)&&(pointd[0]==10||pointd[1]==10))
                {
                    var d1fil=head.filter{$0.hasPrefix("d")}
                    let except="d1"
                    let dfilter=head.filter({$0 != except})
                    var dstring=dfilter.filter{$0.hasPrefix("d")}
                    let dstringfind=head.indexOf(dstring[0])!
                    return dstringfind
                    
                    
                }
                    
                else  if (pointd[0]>pointd[1]){
                    let dstring="d"+String(pointd[1])
                    let dstringfind=head.indexOf(dstring)!
                    return dstringfind
                }
                else if(pointd[0]<pointd[1])
                {
                    let dstring="d"+String(pointd[0])
                    let dstringfind=head.indexOf(dstring)!
                    return dstringfind
                }
                else if(pointd[0]==pointd[1]){
                    let equal=head.indexOf(dstr[0])!
                    return equal
                }
                
                
            }
            else if i==2{
                var sstr=[String]()
                sstr=head.filter{$0.hasPrefix("s")}
                let scut1=(sstr[0] as NSString).substringFromIndex(1)
                let scut2=(sstr[1] as NSString).substringFromIndex(1)
                var sarry=[String]()
                sarry.insert(scut1, atIndex: 0)
                sarry.insert(scut2, atIndex: 1)
                
                
                for var c=0; c<2; c++ {
                    if (sarry[c]=="0")||(sarry[c]=="10")||(sarry[c]=="11")||(sarry[c]=="12"){
                        points.insert(10, atIndex: c)
                    }
                    else if (sarry[c]=="1"){
                        points.insert(11, atIndex: c)
                    }
                    else if (sarry[c]=="2"){
                        points.insert(2, atIndex: c)
                    }
                    else if (sarry[c]=="3"){
                        points.insert(3, atIndex: c)
                    }
                    else if (sarry[c]=="4"){
                        points.insert(4, atIndex: c)
                    }
                    else if (sarry[c]=="5"){
                        points.insert(5, atIndex: c)
                    }
                    else if (sarry[c]=="6"){
                        points.insert(6, atIndex: c)
                    }
                    else if (sarry[c]=="7"){
                        points.insert(7, atIndex: c)
                    }
                    else if (sarry[c]=="8"){
                        points.insert(8, atIndex: c)
                    }
                    else if (sarry[c]=="9"){
                        points.insert(9, atIndex: c)
                    }
                    
                }
                points.sortInPlace()
                if((points[0]==11||points[1]==11)&&(points[0]==10||points[1]==10))
                {
                    var s1fil=head.filter{$0.hasPrefix("s")}
                    let except="s1"
                    let sfilter=head.filter({$0 != except})
                    var sstring=sfilter.filter{$0.hasPrefix("s")}
                    let sstringfind=head.indexOf(sstring[0])!
                    return sstringfind
                    
                    
                }
                    
                else if (points[0]>points[1]){
                    let sstring="s"+String(points[1])
                    let sstringfind=head.indexOf(sstring)!
                    return sstringfind
                }
                else if(points[0]<points[1])
                {
                    let sstring="s"+String(points[0])
                    let sstringfind=head.indexOf(sstring)!
                    return sstringfind
                }
                else if(points[0]==points[1]){
                    let equal=head.indexOf(sstr[0])!
                    return equal
                }
                
                
                
            }
            else if i==3{
                var hstr=[String]()
                hstr=head.filter{$0.hasPrefix("h")}
                let hcut1=(hstr[0] as NSString).substringFromIndex(1)
                let hcut2=(hstr[1] as NSString).substringFromIndex(1)
                var harry=[String]()
                harry.insert(hcut1, atIndex: 0)
                harry.insert(hcut2, atIndex: 1)
                
                
                for var c=0; c<2; c++ {
                    if (harry[c]=="0")||(harry[c]=="10")||(harry[c]=="11")||(harry[c]=="12"){
                        pointh.insert(10, atIndex: c)
                    }
                    else if (harry[c]=="1"){
                        pointh.insert(11, atIndex: c)
                    }
                    else if (harry[c]=="2"){
                        pointh.insert(2, atIndex: c)
                    }
                    else if (harry[c]=="3"){
                        pointh.insert(3, atIndex: c)
                    }
                    else if (harry[c]=="4"){
                        pointh.insert(4, atIndex: c)
                    }
                    else if (harry[c]=="5"){
                        pointh.insert(5, atIndex: c)
                    }
                    else if (harry[c]=="6"){
                        pointh.insert(6, atIndex: c)
                    }
                    else if (harry[c]=="7"){
                        pointh.insert(7, atIndex: c)
                    }
                    else if (harry[c]=="8"){
                        pointh.insert(8, atIndex: c)
                    }
                    else if (harry[c]=="9"){
                        pointh.insert(9, atIndex: c)
                    }
                    
                }
                pointh.sortInPlace()
                if((pointh[0]==11||pointh[1]==11)&&(pointh[0]==10||pointh[1]==10))
                {
                    var h1fil=head.filter{$0.hasPrefix("h")}
                    let except="h1"
                    let hfilter=head.filter({$0 != except})
                    var hstring=hfilter.filter{$0.hasPrefix("h")}
                    let hstringfind=head.indexOf(hstring[0])!
                    return hstringfind
                    
                    
                }
                    
                else if (pointh[0]>pointh[1]){
                    let hstring="h"+String(pointh[1])
                    let hstringfind=head.indexOf(hstring)!
                    return hstringfind
                }
                else if (pointh[0]<pointh[1])
                {
                    let hstring="h"+String(pointh[0])
                    let hstringfind=head.indexOf(hstring)!
                    return hstringfind
                }
                else if(pointh[0]==pointh[1]){
                    let equal=head.indexOf(hstr[0])!
                    return equal
                }
                
            }
            
        }
            
            
        else if (ccount==1)||(hcount==1)||(scount==1)||(dcount==1){
            headcount3.insert(ccount, atIndex: 0)
            headcount3.insert(dcount, atIndex: 1)
            headcount3.insert(scount, atIndex: 2)
            headcount3.insert(hcount, atIndex: 3)
            
            let vstr=headcount3.filter{$0==1}
            var selectmin:[Int]=[14,14,14,14]
            vstr.count
            /* 同じスートが２つで他の3つが異なる場合  */
            /*同じスートの２つを最大値にして他のスートの最小のものを求める*/
            if vstr.count==3{
                if ccount==2{
                    var cfil:[String]=head.filter{$0.hasPrefix("c")}
                    let cc1=head.indexOf(cfil[0])
                    let cc2=head.indexOf(cfil[1])
                    point[cc1!]=12
                    point[cc2!]=12
                    return point.indexOf(point.minElement()!)!
                }
                    
                else if dcount==2{
                    var dfil:[String]=head.filter{$0.hasPrefix("d")}
                    let dd1=head.indexOf(dfil[0])
                    let dd2:Int?=head.indexOf(dfil[1])
                    point[dd1!]=12
                    point[dd2!]=12
                    return point.indexOf(point.minElement()!)!
                }
                else if scount==2{
                    var sfil:[String]=head.filter{$0.hasPrefix("s")}
                    let ss1=head.indexOf(sfil[0])
                    let ss2:Int?=head.indexOf(sfil[1])
                    point[ss1!]=12
                    point[ss2!]=12
                    return point.indexOf(point.minElement()!)!
                    
                }
                else if hcount==2{
                    var hfil:[String]=head.filter{$0.hasPrefix("h")}
                    let hh1=head.indexOf(hfil[0])
                    let hh2:Int?=head.indexOf(hfil[1])
                    point[hh1!]=12
                    point[hh2!]=12
                    return point.indexOf(point.minElement()!)!
                    
                }
            }
            /* 同じスートが３つで他の２つが異なる場合  */
            if vstr.count==2{
                
                if (ccount==1) && (hcount==1) {
                    let cchar = "c"
                    var cfound:Int?
                    
                    for (i, value) in head2.enumerate() {
                        if cchar == value {
                            cfound = i
                        }
                    }
                    let hchar = "h"
                    var hfound:Int?
                    
                    for (i, value) in head2.enumerate() {
                        if hchar == value {
                            hfound = i
                        }
                    }
                    // found! is now 1
                    
                    
                    selectmin.insert(point[cfound!], atIndex: 0)
                    selectmin.insert(point[hfound!], atIndex: 1)
                    if( selectmin[0]<selectmin[1]){
                        
                        return  cfound!
                    }
                    else{
                        return hfound!
                    }
                    
                }
                else   if (ccount==1) && (scount==1) {
                    
                    let cchar = "c"
                    var cfound:Int?
                    
                    for (i, value) in head2.enumerate() {
                        if cchar == value {
                            cfound = i
                        }
                    }
                    let schar = "s"
                    var sfound:Int?
                    
                    for (i, value) in head2.enumerate() {
                        if schar == value {
                            sfound = i
                        }
                    }
                    // found! is now 1
                    
                    
                    selectmin.insert(point[cfound!], atIndex: 0)
                    selectmin.insert(point[sfound!], atIndex: 1)
                    if( selectmin[0]<selectmin[1]){
                        
                        return  cfound!
                    }
                    else{
                        return sfound!
                    }
                    
                    
                }
                else   if (ccount==1) && (dcount==1) {
                    
                    let cchar = "c"
                    var cfound:Int?
                    
                    for (i, value) in head2.enumerate() {
                        if cchar == value {
                            cfound = i
                        }
                    }
                    let dchar = "d"
                    var dfound:Int?
                    
                    for (i, value) in head2.enumerate() {
                        if dchar == value {
                            dfound = i
                        }
                    }
                    // found! is now 1
                    
                    
                    selectmin.insert(point[cfound!], atIndex: 0)
                    selectmin.insert(point[dfound!], atIndex: 1)
                    if( selectmin[0]<selectmin[1]){
                        
                        return  cfound!
                    }
                    else{
                        return dfound!
                    }
                    
                    
                }
                else   if (scount==1) && (dcount==1) {
                    
                    let schar = "s"
                    var sfound:Int?
                    
                    for (i, value) in head2.enumerate() {
                        if schar == value {
                            sfound = i
                        }
                    }
                    let dchar = "d"
                    var dfound:Int?
                    
                    for (i, value) in head2.enumerate() {
                        if dchar == value {
                            dfound = i
                        }
                    }
                    // found! is now 1
                    
                    
                    selectmin.insert(point[sfound!], atIndex: 0)
                    selectmin.insert(point[dfound!], atIndex: 1)
                    if( selectmin[0]<=selectmin[1]){
                        
                        return  sfound!
                    }
                    else{
                        return dfound!
                    }
                    
                    
                }
                    
                else   if (hcount==1) && (dcount==1) {
                    
                    let hchar = "h"
                    var hfound:Int?
                    
                    for (i, value) in head2.enumerate() {
                        if hchar == value {
                            hfound = i
                        }
                    }
                    let dchar = "d"
                    var dfound:Int?
                    
                    for (i, value) in head2.enumerate() {
                        if dchar == value {
                            dfound = i
                        }
                    }
                    // found! is now 1
                    
                    
                    selectmin.insert(point[hfound!], atIndex: 0)
                    selectmin.insert(point[dfound!], atIndex: 1)
                    if( selectmin[0]<=selectmin[1]){
                        
                        return  hfound!
                    }
                    else{
                        return dfound!
                    }
                    
                    
                }
                    
                else   if (hcount==1) && (scount==1) {
                    let hchar = "h"
                    var hfound:Int?
                    
                    for (i, value) in head2.enumerate() {
                        if hchar == value {
                            hfound = i
                        }
                    }
                    let schar = "s"
                    var sfound:Int?
                    
                    for (i, value) in head2.enumerate() {
                        if schar == value {
                            sfound = i
                        }
                    }
                    // found! is now 1
                    
                    
                    selectmin.insert(point[hfound!], atIndex: 0)
                    selectmin.insert(point[sfound!], atIndex: 1)
                    if( selectmin[0]<=selectmin[1]){
                        
                        return  hfound!
                    }
                    else{
                        return sfound!
                    }
                    
                    
                }
                
                
                
            }
            
            
            /*4つのスートとジョーカーの場合*/
            if (ccount==1)&&(hcount==1)&&(scount==1)&&(dcount==1){
                for var t=0;t<5;t++ {
                    if ((huter2[t]=="0")||(huter2[t]=="10")||(huter2[t]=="11")||(huter2[t]=="12")){
                        pointmin.insert(10, atIndex: t)
                    }
                    else if (huter2[t]=="1"){
                        pointmin.insert(11, atIndex: t)
                    }
                    else if (huter2[t]=="2"){
                        pointmin.insert(2, atIndex: t)
                    }
                    else if (huter2[t]=="3"){
                        pointmin.insert(3, atIndex: t)
                    }
                    else if (huter2[t]=="4"){
                        pointmin.insert(4, atIndex: t)
                    }
                    else if (huter2[t]=="5"){
                        pointmin.insert(5, atIndex: t)
                    }
                    else if (huter2[t]=="6"){
                        pointmin.insert(6, atIndex: t)
                    }
                    else if (huter2[t]=="7"){
                        pointmin.insert(7, atIndex: t)
                    }
                    else if (huter2[t]=="8"){
                        pointmin.insert(8, atIndex: t)
                    }
                    else if (huter2[t]=="9"){
                        pointmin.insert(9, atIndex: t)
                    }
                    
                }
                return pointmin.indexOf(pointmin.minElement()!)!
            }
            
            if ccount==1{
                
                let c = head2.indexOf("c")
                
                
                return c!
                
            }
            else if dcount==1{
                
                let d = head2.indexOf("d")
                
                
                return d!
            }
            else if scount==1{
                var s = head2.indexOf("s")
                
                
                return s!
            }
            else if hcount==1{
                var h=head2.indexOf("h")
                
                return h!
                
            }
            
        }
    }
    /*格納されている要素の最小値をもとめる*/
    var ra=Int(arc4random()%5)
    return  ra
    
}


/* オープンカードからカードを選択。 */
var head2=["s8","d5","h6","s5","s1"]
func Preplayercharcut(exchangecard:String)->String{
    let cut=(exchangecard as NSString).substringToIndex(1)
    return cut
}
func cardfind(opencard: Array<String>)->Int{
    var headstring2:String?
    var selecthead=[String]()
    var selecthuter=[String]()
    var selecthuter2=[String]()
    var maxselect:[Int]=[0,0,0,0,0]
    var point2=[Int]()
    
    var element=[Int]()
    
    var ccount2:Int=0
    var dcount2:Int=0
    var scount2:Int=0
    var hcount2:Int=0
    var xcount2:Int=0
    selecthead.removeAll()
    selecthuter2.removeAll()
    element.removeAll()
    point2.removeAll()
    
    var maxindex:Int?
    // オープンカードをヘッダーとフッターでわけて配列に格納する
    for var ta=0; ta<5; ta++ {
        let cut=(opencard[ta] as NSString).substringToIndex(1)
        let cut2=(opencard[ta] as NSString).substringFromIndex(1)
        
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
            xcount2=xcount2+1
        }
        
    }
    var headcount2=[Int]()
    headcount2.insert(ccount2, atIndex: 0)
    headcount2.insert(dcount2, atIndex: 1)
    headcount2.insert(scount2, atIndex: 2)
    headcount2.insert(hcount2, atIndex: 3)
    headcount2.insert(xcount2, atIndex: 4)
    
    for var ta=0; ta<5; ta++ {
        if (selecthuter[ta]=="0") || (selecthuter[ta]=="10") || (selecthuter[ta]=="11") || (selecthuter[ta]=="12") {
            point2.insert(10, atIndex: ta)
        }
        else if (selecthuter[ta]=="1"){
            point2.insert(11, atIndex: ta)
        }
        else if (selecthuter[ta]=="2"){
            point2.insert(2, atIndex: ta)
        }
        else if (selecthuter[ta]=="3"){
            point2.insert(3, atIndex: ta)
        }
        else if (selecthuter[ta]=="4"){
            point2.insert(4, atIndex: ta)
        }
        else if (selecthuter[ta]=="5"){
            point2.insert(5, atIndex: ta)
        }
        else if (selecthuter[ta]=="6"){
            point2.insert(6, atIndex: ta)
        }
        else if (selecthuter[ta]=="7"){
            point2.insert(7, atIndex: ta)
        }
        else if (selecthuter[ta]=="8"){
            point2.insert(8, atIndex: ta)
        }
        else if (selecthuter[ta]=="9"){
            point2.insert(9, atIndex: ta)
        }
        
        
    }
    
    var head2count=headcount2.filter{$0==2}
    let head2coincidence=selecthead.filter{$0==headstring}
    
    var headcountmax=headcount2.indexOf(headcount2.maxElement()!)
    let coincidencecount=head2coincidence.count
    var indexcount=0
    var coincidencemax=[Int]()
    
    let coinchar = headstring
    var found:Int?
    var multicoincidencemax:Int?
    
    
    if headcount2[4]==0{
        if coincidencecount>1{
            
            for (i, value) in selecthead.enumerate() {
                if coinchar == value {
                    found = i
                    var maxpoint=found
                    coincidencemax.append(found!)
                    
                    // multicoincidencemax=find(point2,maxElement(maxpoint))
                }
                
                
                indexcount++
            }
            
            var index=coincidencemax
            
            var indexmax=[Int]()
            
            var arrayindex=[String]()
            for var i=0 ;i<coincidencecount; i++ {
                
                
                indexmax.append(point2[index[i]])
                
            }
            
            let finalfind=point2.indexOf(indexmax.maxElement()!)
            
            
            
            return  finalfind!
            
            
        }
            
        else  if coincidencecount==1{
            for (i, value) in selecthead.enumerate() {
                if coinchar == value {
                    found = i
                    var coincidenmax=[Int]()
                    multicoincidencemax=point2.indexOf(point2.maxElement()!)
                }
                
            }
            return  found!
            
            
            
        }
        else if coincidencecount==0{
            maxindex=point2.indexOf(point2.maxElement()!)
            
        }
    }
        // ジョーかがある場合
    else if headcount2[4]==1{
        maxindex=selecthead.indexOf("x")
    }
    return  maxindex!
    
    
}






