//
//  GameScene.swift
//  Tapit
//
//  Created by donezio on 11/27/17.
//  Copyright © 2017 macbook pro. All rights reserved.
//

import SpriteKit
import GameplayKit
import AudioToolbox
import AVFoundation

class GameScene: SKScene , UIGestureRecognizerDelegate{
    
    var count = 0;
    let height = UIScreen.main.bounds.size.height
    let width  = UIScreen.main.bounds.size.width
    var startingTime1  : DispatchTime?
    var startingTIme2  : DispatchTime?
    var endTime1       : DispatchTime?
    var endTime2       : DispatchTime?
    var result         : SKShapeNode?
    // variables to control game state
    var p1Ready = 0
    var p2Ready = 0
    /**
        wait for this value to change to 2
    */
    var countRes  =  0
    

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
                    p1Ready = 1
                    startingTime1 = DispatchTime.now()
                    //change color when touched
                    touchedNode?.fillColor = SKColor.yellow
                    print("area1")
                    if(p1Ready == 1 && p2Ready == 1){
                        gameStart()
                       
                        
                    }
                }
                if name == "area2"{
                    //change color when touched
                    touchedNode?.fillColor = SKColor.red
                    startingTIme2 = DispatchTime.now()
                    print("area2")
                    p2Ready = 1
                    if(p1Ready == 1 && p2Ready == 1){
                        gameStart()
                    }
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
                {   p1Ready = 0
                    countRes = countRes + 1
                    print("~~~~~end touching area1      " + String(countRes))
                    endTime1 = DispatchTime.now()
                    if(countRes == 1){
                        presentResult(1, 2)
                    }
                }
                if name == "area2"{
                    p2Ready = 0
                    countRes = countRes + 1
                    endTime2 = DispatchTime.now()
                    print("~~~~~~~~end touch area2       " + String(countRes))
                    if(countRes == 1){
                        presentResult(2, 1)
                    }
                }
            }
        }
    }
    /**
        game start
     */
    func gameStart(){
        // game logic goes here
        print("game is playing")
        countRes = 0
        let _: SystemSoundID = 0
        //playing sound
        let systemSoundID: SystemSoundID = 1003  // the tweet sound. You can experiment with others
        
        AudioServicesPlaySystemSound (systemSoundID) // // to play sound
    }
  
    /**
           function to present result
    */
    func presentResult(_ winer : Int, _ loser : Int ){
        print("winer is   " + String(winer))
        print("game finished" + String(countRes))
        
        result = SKShapeNode(rectOf: CGSize(width: 100, height: 100))
        result?.fillColor = SKColor.purple
        if winer == 1{
            result?.position = CGPoint(x: width/2, y: height/4)
        }
        else{
            result?.position = CGPoint(x: width/2, y: 3 * height/4)
        }
        self.addChild(result!)
        /*
        let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            result.removeFromParent()
        }
        */
        let vc = self.view?.window?.rootViewController;
        let tmpVC = vc?.storyboard?.instantiateViewController(withIdentifier: "finishVC") as! finishVC
        tmpVC.result = self.result
        vc?.present(tmpVC, animated: true, completion: nil)
    }
}
