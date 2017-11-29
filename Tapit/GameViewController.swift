//
//  GameViewController.swift
//  Tapit
//
//  Created by donezio on 11/27/17.
//  Copyright © 2017 macbook pro. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController : UIViewController{
    override func viewDidLoad() {
        print("ready to play")
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        //self.view.isUserInteractionEnabled = false
        skView.presentScene(scene)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
