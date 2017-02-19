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
    
    // UIVIews
    private var movingBrick: UIView?
    private var horizontalPaddle: UIView?
    
    private var brickSize: CGSize {
        
        let size = bounds.width / CGFloat(brickPerRow) - CGFloat(padding) - CGFloat(padding/brickPerRow)
        let widthSize = size
        let heightSize = CGFloat(30)
        return CGSize(width: widthSize, height: heightSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
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
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Top bricks
        for x in 1...brickPerRow {
            for y in 1...3 {
                
                let frame = CGRect(x: CGFloat(padding * x) + CGFloat((x - 1)) * brickSize.width, y: CGFloat(padding * y) + CGFloat((y - 1)) * brickSize.height + 10, width: brickSize.width, height: brickSize.height)
                let brick = UIView(frame: frame)
                brick.backgroundColor = UIColor.blue
                addSubview(brick)
            }
        }
    }
    
    private var animating: Bool = false {
        didSet {
            
            if animating {
                
                
            } else {
                
                
            }
        }
    }
    
    
    
    
    
}
