//
//  CardStackViewController.swift
//  eComm
//
//  Created by Neegbeah Reeves on 10/29/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import TisprCardStack
import Parse
import ParseUI

class CardStackViewController: TisprCardStackViewController, TisprCardStackViewControllerDelegate {

    private var countOfCards: Int = 6
    
    
    private let colors = [UIColor(red: 45.0/255.0, green: 62.0/255.0, blue: 79.0/255.0, alpha: 1.0),
                          UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0),
                          UIColor(red: 141.0/255.0, green: 72.0/255.0, blue: 171.0/255.0, alpha: 1.0),
                          UIColor(red: 241.0/255.0, green: 155.0/255.0, blue: 44.0/255.0, alpha: 1.0),
                          UIColor(red: 234.0/255.0, green: 78.0/255.0, blue: 131.0/255.0, alpha: 1.0),
                          UIColor(red: 80.0/255.0, green: 170.0/255.0, blue: 241.0/255.0, alpha: 1.0)
    ]


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Get Parse Query
        
        // Animation Speed
        setAnimationSpeed(0.85)
        
        //set size of cards
        let size = CGSizeMake(view.bounds.width - 40, 2*view.bounds.height/3)
        setCardSize(size)
        
        cardStackDelegate = self
        
        //configuration of stacks
        layout.topStackMaximumSize = 4
        layout.bottomStackMaximumSize = 30
        layout.bottomStackCardHeight = 45
        
        //getParseQuery()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfCards() -> Int {
        return countOfCards
    }
    
    override func card(collectionView: UICollectionView, cardForItemAtIndexPath indexPath: NSIndexPath) -> TisprCardStackViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellIdentifier", forIndexPath: indexPath) as! CardStackCell
        
        cell.backgroundColor = colors[indexPath.item % colors.count]
        //cell.text.text = "Card - \(indexPath.item)"
        
        return cell
        
    }
    
    func getParseQuery(){
        let query = PFQuery(className:"GameScore")
        query.whereKey("playerName", equalTo:"Sean Plott")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        print(object.objectId)
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        
    }
    
    @IBAction func moveUP(sender: AnyObject) {
        moveCardUp()
    }
    
    @IBAction func moveCardDown(sender: AnyObject) {
        moveCardDown()
    }
    
    func cardDidChangeState(cardIndex: Int) {
       // print("card with index - \(cardIndex) changed position")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
