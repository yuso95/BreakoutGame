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
    
    private var brickSize: CGSize {
        
        let size = bounds.width / CGFloat(brickPerRow) - CGFloat(padding) - CGFloat(padding/brickPerRow)
        let widthSize = size
        let heightSize = CGFloat(30)
        return CGSize(width: widthSize, height: heightSize)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
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
