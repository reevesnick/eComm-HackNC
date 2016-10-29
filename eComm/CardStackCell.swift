//
//  CardStackCell.swift
//  eComm
//
//  Created by Neegbeah Reeves on 10/29/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import TisprCardStack

class CardStackCell: TisprCardStackViewCell {
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 12
        clipsToBounds = false
        
    }
    
    override var center: CGPoint {
        didSet {
            //updateSmileVote()
        }
    }
    
    override internal func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
        //updateSmileVote()
    }

}
