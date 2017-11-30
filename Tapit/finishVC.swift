//
//  finishVC.swift
//  Tapit
//
//  Created by donezio on 11/29/17.
//  Copyright © 2017 macbook pro. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


class finishVC: UIViewController {

    var result         : SKShapeNode?
    
    @IBAction func finish(_ sender: Any) {
        
        result?.removeFromParent()
        
        
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
