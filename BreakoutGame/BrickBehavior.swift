//
//  BrickBehavior.swift
//  BreakoutGame
//
//  Created by Younoussa Ousmane Abdou on 2/19/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class BrickBehavior: UIDynamicBehavior {
    
    private lazy var gravity: UIGravityBehavior = {
        
        let gravity = UIGravityBehavior()
        gravity.magnitude = 1
        
        return gravity
    }()
    
    private lazy var collider: UICollisionBehavior = {
        
        let collider = UICollisionBehavior()
        collider.translatesReferenceBoundsIntoBoundary = true
        
        return collider
    }()
    
    // Add itemBehavior
    private var itemBehavior: UIDynamicItemBehavior {
        
        let itemBehavior = UIDynamicItemBehavior()
        itemBehavior.elasticity = 1.0
        itemBehavior.resistance = 1.0
        itemBehavior.allowsRotation = false
        return itemBehavior
        
    }
    
    override init() {
        super.init()
        
        addChildBehavior(collider)
        addChildBehavior(gravity)
        addChildBehavior(itemBehavior)
    }
    
    func addItem(item: UIDynamicItem) {
        
        collider.addItem(item)
        itemBehavior.addItem(item)
    }
    
    func addGravityItemOnly(item: UIDynamicItem) {
        
        gravity.addItem(item)
    }
}
