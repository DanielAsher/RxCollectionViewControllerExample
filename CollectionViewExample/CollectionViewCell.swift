//
//  CollectionViewCell.swift
//  CollectionViewExample
//
//  Created by Daniel Asher on 02/03/2017.
//  Copyright © 2017 LEXI LABS. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var gameTitle: UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
