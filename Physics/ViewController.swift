//
//  ViewController.swift
//  Physics
//
//  Created by Sara Hender on 12/12/16.
//  Copyright © 2016 Sara Hender. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var push: UIPushBehavior!

    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: self.view)

        gravity = UIGravityBehavior()
        animator.addBehavior(gravity)

        /*
        collision = UICollisionBehavior()
        animator.addBehavior(collision)
        

        push.removeItem(self.blueView)

        collision.addItem(self.greenView)
        collision.removeItem(self.blueView)*/
        
/*
        collision.addBoundaryWithIdentifier("shelf" as NSCopying, fromPoint: CGPoint(x: 0, y: 200), toPoint: CGPoint(x: 150, y: 240))
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.collisionDelegate = self
 */
//        
//        // Push goes down, but 1/10 the force of gravity
//        push.pushDirection = CGVector(dx: 0, dy: 0.1)
//        push = UIPushBehavior()
//        push.pushDirection = CGVector(dx: 0, dy: 0.1)
//        animator.addBehavior(push)
//        
//        push.addItem(self.greenView)
//        // Push goes up
//        push.pushDirection = CGVectorMake(0,-1)
//        
//        // Push goes diagonal
//        push.pushDirection = CGVectorMake(1,1)
//        
        
//        gravity.addItem(self.greenView)
//        gravity.removeItem(self.blueView)
//        // Gravity still goes down, but at a reduced force
//        self.gravity.gravityDirection = CGVectorMake(0,0.1)
//        
//        // Gravity goes up
//        self.gravity.gravityDirection = CGVectorMake(0,-1)
//        
//        // Gravity goes diagonal
//        self.gravity.gravityDirection = CGVectorMake(1,1)
    }

    @IBAction func gravityTouch(_ sender: Any) {
        gravity.addItem(self.greenView)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem, atPoint p: CGPoint) {
        var view1 = item1 as UIView
        var view2 = item2 as UIView
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying, atPoint p: CGPoint) {
        
        // You have to convert the identifier to a string
        var boundary = identifier as String
        
        // The view that collided with the boundary has to be converted to a view
        var view = item as UIView
        
        if boundary == "shelf" {
            // Detected collision with a boundary called "shelf"
        } else if (boundary == "") {
            // Detected collision with bounds of reference view
        }
    }*/

}

