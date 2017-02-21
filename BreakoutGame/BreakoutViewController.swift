//
//  BreakoutViewController.swift
//  BreakoutGame
//
//  Created by Younoussa Ousmane Abdou on 2/15/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class BreakoutViewController: UIViewController {

    @IBOutlet private weak var gameView: BreakoutView! {
        didSet {
            
            // MARK: - Gesture Recognizer
            gameView.addGestureRecognizer(UITapGestureRecognizer(target: gameView, action: #selector(gameView.pushBrick)))
            gameView.addGestureRecognizer(UIPanGestureRecognizer(target: gameView, action: #selector(gameView.movingPaddle(_:))))
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        gameView.animating = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        gameView.animating = false
    }
}
