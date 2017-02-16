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
    
    private var brickSize: CGSize {
        
        let size = bounds.width / CGFloat(brickPerRow)
        let widthSize = size + 30
        let heightSize = size - 20
        return CGSize(width: widthSize, height: heightSize)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let frame = CGRect(x: 10, y: 30, width: brickSize.width, height: brickSize.height)
        let brick = UIView(frame: frame)
        brick.backgroundColor = UIColor.blue
        addSubview(brick)
    }
    
    private var animating: Bool = false {
        didSet {
            
            if animating {
                
                
            } else {
                
                
            }
        }
    }
    
    
    
    

}
