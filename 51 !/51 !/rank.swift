func rank(a:Int,b:Int,c:Int,d:Int)->(Int,Int,Int,Int){
    var maxplayer:Int?
    var playe1rrank:Int?
    var playe2rrank:Int?
    var playe3rrank:Int?
    var playe4rrank:Int?
    
    var scorearray=[Int]()
    scorearray.insert(a, atIndex: 0)
    scorearray.insert(b, atIndex: 1)
    scorearray.insert(c, atIndex: 2)
    scorearray.insert(d, atIndex: 3)
    let maxscore=scorearray.maxElement()!
    let scoremax=scorearray.indexOf(scorearray.maxElement()!)
    let scoremaxcount=scorearray.filter{$0==maxscore}
    scoremaxcount.count
    //    var scoremaxcount=scoremaxcount.count
    scorearray.sortInPlace{$0>$1}
    
    let score2ndcount=scorearray.filter{$0==scorearray[1]}
    let score3rdcount=scorearray.filter{$0==scorearray[2]}
    
    
    
    if (scoremaxcount.count==1)&&(score2ndcount.count==1)&&(score3rdcount.count==1){
        maxplayer=scoremax
        var ndplayerindex=scorearray.indexOf(scorearray[1])
        var rdplayerindex=scorearray.indexOf(scorearray[2])
        let player1rank:Int=scorearray.indexOf(a)!
        let player2rank:Int=scorearray.indexOf(b)!
        let player3rank:Int=scorearray.indexOf(c)!
        let player4rank:Int=scorearray.indexOf(d)!
        switch player1rank {
        case 0:
            playe1rrank=0
        case 1:
            playe1rrank=1
        case 2:
            playe1rrank=2
        case 3:
            playe1rrank=3
        default:
            break
        }
        
        switch player2rank {
        case 0:
            playe2rrank=0
        case 1:
            playe2rrank=1
        case 2:
            playe2rrank=2
        case 3:
            playe2rrank=3
        default:
            break
        }
        switch player3rank {
        case 0:
            playe3rrank=0
        case 1:
            playe3rrank=1
        case 2:
            playe3rrank=2
        case 3:
            playe3rrank=3
        default:
            break
        }
        switch player4rank {
        case 0:
            playe4rrank=0
        case 1:
            playe4rrank=1
        case 2:
            playe4rrank=2
        case 3:
            playe4rrank=3
        default:
            break
        }
        
        
        
        
    }
        
    else{
        maxplayer=scoremax
        var ndplayerindex=scorearray.indexOf(scorearray[1])
        var rdplayerindex=scorearray.indexOf(scorearray[2])
        let player1rank:Int=scorearray.indexOf(a)!
        let player2rank:Int=scorearray.indexOf(b)!
        let player3rank:Int=scorearray.indexOf(c)!
        let player4rank:Int=scorearray.indexOf(d)!
        switch player1rank {
        case 0:
            playe1rrank=0
        case 1:
            playe1rrank=1
        case 2:
            playe1rrank=2
        case 3:
            playe1rrank=3
        default:
            break
        }
        
        switch player2rank {
        case 0:
            playe2rrank=0
        case 1:
            playe2rrank=1
        case 2:
            playe2rrank=2
        case 3:
            playe2rrank=3
        default:
            break
        }
        switch player3rank {
        case 0:
            playe3rrank=0
        case 1:
            playe3rrank=1
        case 2:
            playe3rrank=2
        case 3:
            playe3rrank=3
        default:
            break
        }
        switch player4rank {
        case 0:
            playe4rrank=0
        case 1:
            playe4rrank=1
        case 2:
            playe4rrank=2
        case 3:
            playe4rrank=3
        default:
            break
        }
        
        
        
        
    }
    
    return (playe1rrank!,playe2rrank!,playe3rrank!,playe4rrank!)
}
func rankstring(a:Int,b:Int,c:Int,d:Int)->(String,String,String,String){
    var playe1rrank:String?
    var playe2rrank:String?
    var playe3rrank:String?
    var playe4rrank:String?
    let st = "1"
    let nd = "2"
    let rd = "3"
    let th = "4"

    switch a {
    case 0:
        playe1rrank=String(st)
    case 1:
        playe1rrank=String(nd)
    case 2:
        playe1rrank=String(rd)
    case 3:
        playe1rrank=String(th)
    default:
        break
    }
    
    switch b {
    case 0:
        playe2rrank=String(st)
    case 1:
        playe2rrank=String(nd)
    case 2:
        playe2rrank=String(rd)
    case 3:
        playe2rrank=String(th)
    default:
        break
    }
    switch c {
    case 0:
        playe3rrank=String(st)
    case 1:
        playe3rrank=String(nd)
    case 2:
        playe3rrank=String(rd)
    case 3:
        playe3rrank=String(th)
    default:
        break
    }
    switch d{
    case 0:
        playe4rrank=String(st)
    case 1:
        playe4rrank=String(nd)
    case 2:
        playe4rrank=String(rd)
    case 3:
        playe4rrank=String(th)
    default:
        break
    }
    return (playe1rrank!,playe2rrank!,playe3rrank!,playe4rrank!)
}
