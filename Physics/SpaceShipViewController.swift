//
//  SpaceShipViewController.swift
//  Physics
//
//  Created by Sara Hender on 12/12/16.
//  Copyright © 2016 Sara Hender. All rights reserved.
//

import UIKit

class SpaceShipViewController: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var myView: UIView!
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var push: UIPushBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animator = UIDynamicAnimator(referenceView: self.view)
        
        collision = UICollisionBehavior()
        collision.collisionDelegate = self
        animator.addBehavior(collision)
        
        gravity = UIGravityBehavior()
        animator.addBehavior(gravity)

        push = UIPushBehavior(items: [myView], mode: UIPushBehaviorMode.instantaneous)
        push.setAngle( CGFloat(-M_PI_2), magnitude: 0.5);
//        push.active = true
//        push.angle = CGFloat(-M_PI_2)
//        push.magnitude = CGFloat(2.0)
        //push.pushDirection = CGVector(dx: 0, dy: -1)
        animator.addBehavior(push)
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.releaseTheKraken), userInfo: nil, repeats: true)
    }

    func releaseTheKraken() {
        let x = arc4random_uniform(UInt32(self.view.frame.width));

        let image: UIImage = UIImage(named: "spaceship")!
        let spaceship = UIImageView(image: image)
        spaceship.frame = CGRect(x: Int(x), y: 0, width: 50, height: 50)
        
        self.view.addSubview(spaceship)
        collision.addItem(spaceship)
        gravity.addItem(spaceship)
    }

    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        
        let view = item as! UIView
        
        
        
        if let myIdentifier = identifier {
            //print(myIdentifier)
//            if myIdentifier as! String == "ground" {
//                Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(self.meltSnow), userInfo: view, repeats: false)
//                
//                //meltSnow(snowflake: view)
//            }
        }
        /*
         if identifier == (String("ramp") as NSCopying) {
         // Detected collision with a boundary called "shelf"
         } else if (identifier == (String("ground" as NSCopying)) {
         // Detected collision with bounds of reference view
         meltSnow(snowflake: view)
         }*/
    }

    @IBAction func fire(_ sender: UITapGestureRecognizer) {
        print("fire missile!")
        
        let touchPoint = sender.location(in: self.view)
        
        let missile = UIView(frame: CGRect(origin: touchPoint, size: CGSize(width: 20, height: 20)))
        missile.backgroundColor = UIColor.black

        self.view.addSubview(missile)
        
        collision.addItem(missile)
        push.addItem(missile)
        push.active = true
        
        print(push.items)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
