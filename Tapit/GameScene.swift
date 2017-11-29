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
    
    var count = 0;
    let height = UIScreen.main.bounds.size.height
    let width  = UIScreen.main.bounds.size.width
    var startingTime1  : DispatchTime?
    var startingTIme2  : DispatchTime?
    var endTime1       : DispatchTime?
    var endTime2       : DispatchTime?
    /**
        wait for this value to change to 2
    */
    var countRes  =  0 {
        didSet{
            print("my value changed")
            if countRes == 2{
                countRes = 0
                presentResult()
            }
        }
    }
    
    override func didMove(to view: SKView) {
        print("second file is called")
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
        //print("i am called")
        for touch in touches{
            let positionInScene = touch.location(in: self)
            let touchedNode = self.atPoint(positionInScene) as? SKShapeNode
            if let name = touchedNode?.name
            {
                if name == "area1"
                {
                    startingTime1 = DispatchTime.now()
                    touchedNode?.fillColor = SKColor.yellow
               
                    print("area1")
                }
                if name == "area2"{
                    startingTIme2 = DispatchTime.now()
                    print("area2")
                }
            }
        }
    }
    /**
        function to detect touch end
    */
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("********* i am called" + String(count))
        count = count + 1
        for touch in touches{
            let positionInScene = touch.location(in: self)
            let touchedNode = self.atPoint(positionInScene)
            if let name = touchedNode.name
            {
                if name == "area1"
                {
                    countRes = countRes + 1
                    print("~~~~~end touching area1" + String(countRes))
                    endTime1 = DispatchTime.now()
                }
                if name == "area2"{
                    countRes = countRes + 1
                    endTime2 = DispatchTime.now()
                    print("~~~~~~~~end touch area2" + String(countRes))
                }
            }
        }
    }
    
  
    /**
           function to present result
    */
    func presentResult(){
        print("game finished")
    }
}
