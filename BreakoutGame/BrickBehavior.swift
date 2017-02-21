//
//  BrickBehavior.swift
//  BreakoutGame
//
//  Created by Younoussa Ousmane Abdou on 2/19/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class BrickBehavior: UIDynamicBehavior {
    
    private lazy var collider: UICollisionBehavior = {
        
        let collider = UICollisionBehavior()
        collider.translatesReferenceBoundsIntoBoundary = true
        
        return collider
    }()
    
    override init() {
        super.init()
        
        addChildBehavior(collider)
    }
    
    func addItem(item: UIDynamicItem) {
        
        collider.addItem(item)
    }
    
}
