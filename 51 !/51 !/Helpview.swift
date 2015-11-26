//
//  Helpview.swift
//  delegate_escape
//
//  Created by 桑原綾人 on 2015/01/11.
//  Copyright (c) 2015年 game. All rights reserved.
//
import Foundation
import UIKit

class Helpview: UIViewController,UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    private var pageViewController: UIPageViewController?
    
    // Initialize it right away here
    
    private let contentImages = ["c2.png",
        "c2.png",
        "c2.png",
        "c2.png"];
    var pageData:NSArray!
       var ja:NSArray = ["　\n   『トランプゲーム　51の遊び方』\n   ｢51｣は、５枚の手札をすべて同じマークにそろえ、手札の合計点数を競い合うゲームです。\n   トランプは4つのマーク(スペード、クローバ、ダイヤ、ハート)の52枚とジョーカー1枚の計53枚です。 \n\n   『勝敗の決め方』\n   ５枚の手札をすべて同じマークにそろえ、手札の合計点数が51に一番近い人が勝ちになります。\n   同じマークでない場合０点となりますので、同じマークをそろえることが勝利するための条件になります。\n \n   『プレイヤー数とラウンド数』\n   メンバーは自分とCPUを含め4名で計５ラウンドです。\n \n  『カードの配られ方』\n   プレイヤーに５枚のカードが裏向きで配られます。\n   次に、カードを５枚、表向きにして場に広げてこれを場札とし、残りは積み札とします。\n \n   『カードの強さ』\n   Ａ→１１点、Ｋ・Ｑ・Ｊ→１０点、ジョーカー→１０点または１１点、その他は数字のとおりです。","\n 『ゲームの進め方』\n  1．ランダムに決まったプレイヤーを順に、時計回りで自分のいらない手札１枚と、場札の中から\n       必要なカード１枚を交換します。手札1枚と場札1枚の交換以外で以下をおこなうことができます。\n      「流す」・・・場札を流して、新たな場札から手札1枚を交換する。\n      「交換」・・・手札の５枚と、場札の５枚全てを交換します。\n \n  2．１周目はパスができません。２周目からは、交換したいカードがなければパスができます。\n \n  3．手札が5枚同じマークが集まり、他のプレイヤーよりも高いと予想する場合、コールを宣言すること\n       ができます。コールされるとそこでゲームは終了し、点数が高い方から順位が決まります。\n \n  4．コールしたプレイヤーの点数がもっとも高い場合、コールした時の手札の合計点数がポイントになります。\n       コールしたプレイヤーより他のプレイヤーの方が点数が高い場合、コールしたプレイヤーの点数は0点にな\n       ります。さらに5枚の手札のマークがそろってないプレイヤーも０点になります。\n       同じ点数のプレイヤーがいた場合、ジョーカーの入っているプレイヤーの方が下の順位になります。\n  \n  5．1ラウンドが終了するとスコアボードが表示され、次のラウンドになります。"," \n『ゲーム画面』"]
    var eng:NSArray = ["　How to play fifty one \n   Fifty one is the card game which each player are trying to collect same suit in their card,and will \n   compete for the scores of the total sum of the numbers with each players. \n \n  The pack \n  The standard 52-card pack and one joker are used. \n\n  The goal\n   The player which the card total of the numbers is the highest is winner.\n   It will be zero if it is not the same suit,so it is necessary to collect the same suit. \n \n   The players and round \n   The players are four players including myself and the CPU in five round. \n \n  The dealing \n   Five cards are dealt face down to each player\n   then, the five cards are dealt face up on the board, and the rest is stacked.\n \n   Scoring \n   Aces are worth 11 points, king, queen and jack are worth 10 and numeral cards 10-2 have their face \n   values.","\n Play\n  1). At first,a player who can deal is decided to random, a player will select one card which is useless in \n     five card in each turn. A player must pick up one of the five cards on the table, add it to his hand, \n     and then discard a different card to the table. Others can be the following.\n      'Return':By returning to a pile, to replace the one card from new face up cards.\n      'Exchange':It will exchange your five cards with all the cards on the table.  \n  2). 1st lap can not pass. From 2nd lap, you can pass if there is no card that you want to exchange.\n  3). If all your cards are of the same suit you may 'call'. The play ends immediately and the hands are \n    scored. \n  4). In order to score points, a hand must consist of five cards of the same suit. Then the value of \n   the hand is the sum of the value of the cards. The maximum value is 51, for a hand consisting \n   of A-K-Q-J-10 of a suit.\n   If it is other player who is the same score, the player who have the Joker becomes lower rank.\n   If those of other players score is higher than the call to players, and the caller will be zero points. \n    Example: A called . A has a hand worth 48, B has 45, C has 48, D has 49. \n   The scores are A: 0, B: 45, C: 48, D: 49.\n    Jokers. Often a joker is included in the deck. This act as wild cards, belonging to whatever suit \n    the holder needs, and have a value of 11 points. \n  5)．When the game finished in the one round, scoreboard is displayed , you can start to the next round."," \n  Capture"]
    

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let ff=NSLocale.preferredLanguages().first
         if ff=="ja" || ff=="ja-JP"    {
          pageData=ja
        }
        else{
            pageData=eng
           
        }
        

        createPageViewController()
        setupPageControl()
      
        
        
       
    }
    
    private func createPageViewController() {
        
        let pageController = self.storyboard!.instantiateViewControllerWithIdentifier("PageController") as! UIPageViewController
        pageController.dataSource = self
        
        if contentImages.count > 0 {
            let firstController = getItemController(0)!
            let startingViewControllers: NSArray = [firstController]
            pageController.setViewControllers(startingViewControllers as! [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        }
        
        pageViewController = pageController
        addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
    }
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.grayColor()
        appearance.currentPageIndicatorTintColor = UIColor.whiteColor()
        appearance.backgroundColor = UIColor.darkGrayColor()
    }
    
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! PageItemController
        
        if itemController.itemIndex > 0 {
            return getItemController(itemController.itemIndex-1)
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! PageItemController
        
        if itemController.itemIndex+1 < self.pageData!.count{
            return getItemController(itemController.itemIndex+1)
        }
      
        return nil
    }
    
     func getItemController(itemIndex: Int) -> PageItemController? {
        
        if itemIndex < contentImages.count {
            let pageItemController = self.storyboard!.instantiateViewControllerWithIdentifier("ItemController") as! PageItemController
            pageItemController.itemIndex = itemIndex
           
            pageItemController.dataObject=self.pageData[itemIndex]
            return pageItemController
        }
        
        return nil
    }
    
    // MARK: - Page Indicator
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pageData!.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
