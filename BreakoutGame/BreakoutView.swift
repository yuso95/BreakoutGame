//
//  BreakoutView.swift
//  BreakoutGame
//
//  Created by Younoussa Ousmane Abdou on 2/15/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class BreakoutView: UIView {
    
    // Add bricks to the view
    private let brickPerRow = 5
    private let padding = 10
    
    // Animation
    private lazy var animator: UIDynamicAnimator = {
       
        let animator = UIDynamicAnimator(referenceView: self)
        return animator
    }()
    
    // Behaviors
    let brickBehevior = BrickBehavior()
    
    private lazy var push: UIPushBehavior = {
        
        let push = UIPushBehavior(items: [self.movingBrick!], mode: .instantaneous)
        push.active = true
        push.setAngle(CGFloat(arc4random()), magnitude: 0.2)
        
        return push
    }()
    
    // Attachment 
    
//    private lazy var attachment: UIAttachmentBehavior = {
//        
//        let attachment = UIAttachmentBehavior(item: horizontalPaddle!, attachedToAnchor: .zero)
//        return attachment
//    }()
    
    var animating: Bool = false {
        didSet {
            
            if animating {
                
                animator.addBehavior(brickBehevior)
            } else {
                
                animator.removeAllBehaviors()
            }
        }
    }
    
    // UIViews
    var movingBrick: UIView?
    private var horizontalPaddle: UIView?
    
    private var brickSize: CGSize {
        
        let size = bounds.width / CGFloat(brickPerRow) - CGFloat(padding) - CGFloat(padding/brickPerRow)
        let widthSize = size
        let heightSize = CGFloat(30)
        return CGSize(width: widthSize, height: heightSize)
    }
    
    // Remove aDecoder Init because the movingBrick and HorizontalPaddle don't reappear when the view is rotated
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Top bricks
        for x in 1...brickPerRow {
            for y in 1...3 {
                
                let frame = CGRect(x: CGFloat(padding * x) + CGFloat((x - 1)) * brickSize.width, y: CGFloat(padding * y) + CGFloat((y - 1)) * brickSize.height + 10, width: brickSize.width, height: brickSize.height)
                let brick = UIView(frame: frame)
                brick.backgroundColor = UIColor.blue
                addSubview(brick)
                
                // Adding behaviors
                brickBehevior.addItem(item: brick)
            }
        }
        
        // Moving paddle
        let movingFrame = CGRect(x: bounds.midX, y: bounds.midY, width: brickSize.width / 2, height: brickSize.width / 2)
        movingBrick = UIView(frame: movingFrame)
        movingBrick!.backgroundColor = UIColor.red
        addSubview(movingBrick!)
        
        // Horizontal paddle
        let paddleFrame = CGRect(x: bounds.midX, y: bounds.midY + CGFloat(120), width: brickSize.width, height: brickSize.height - 10)
        horizontalPaddle = UIView(frame: paddleFrame)
        horizontalPaddle!.backgroundColor = UIColor.green
        addSubview(horizontalPaddle!)
        
        // Adding Behaviors
        brickBehevior.addItem(item: movingBrick!)
        brickBehevior.addItem(item: horizontalPaddle!)
        
    }
    
    // MARK: - Gesture Recognizer
    
    func pushBrick() {
        
        animator.addBehavior(push)
        brickBehevior.addItem(item: movingBrick!)
    }
    
    func movingPaddle(_ recognizer: UIPanGestureRecognizer) {
        
        let locationOfPan = recognizer.location(in: self)
        
        if recognizer.state == .changed {
            
            horizontalPaddle?.center = locationOfPan
        }
    }
}
