//
//  GameScene.swift
//  Tapit
//
//  Created by donezio on 11/27/17.
//  Copyright © 2017 macbook pro. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene , UIGestureRecognizerDelegate{
    
    let height = UIScreen.main.bounds.size.height
    let width  = UIScreen.main.bounds.size.width
    
    override func didMove(to view: SKView) {
        self.view?.isMultipleTouchEnabled = true;
        //setting background color
        backgroundColor = SKColor.white
        let area1 = SKShapeNode(rectOf: CGSize(width: width, height: height/2))
        area1.fillColor = SKColor.black
        let area2 = SKShapeNode(rectOf: CGSize(width: width, height: height/2))
        area2.fillColor = SKColor.gray
        // (0 ,0) is at the left botton
        // position is the center of the object
        area1.position = CGPoint(x: width/2, y: height/4)
        area2.position = CGPoint(x: width/2, y: 3 * height/4)
        area1.name = "area1"
        area2.name = "area2"
       
        area1.isUserInteractionEnabled = false
        area2.isUserInteractionEnabled = false
        
        addChild(area1)
        addChild(area2)
    }
    
    /**
        function to detect touch begin
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("i am called")
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name
        {
            if name == "area1"
            {
                print("area1")
            }
            if name == "area2"{
                print("area2")
            }
        }
    }
    /**
        function to detect touch end
    */
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name
        {
            if name == "area1"
            {
                print("end touching area1")
            }
            if name == "area2"{
                print("end touch area2")
            }
        }
    }
}
