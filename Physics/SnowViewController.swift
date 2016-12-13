//
//  SnowViewController.swift
//  Physics
//
//  Created by Sara Hender on 12/12/16.
//  Copyright © 2016 Sara Hender. All rights reserved.
//

import UIKit

class SnowViewController: UIViewController, UICollisionBehaviorDelegate {

    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: self.view)

        collision = UICollisionBehavior()
        collision.collisionDelegate = self
        animator.addBehavior(collision)
        
        gravity = UIGravityBehavior()
        animator.addBehavior(gravity)
        
        collision.addBoundary(withIdentifier: "ground" as NSCopying, from: CGPoint(x: 0, y: self.view.frame.height - 5),to: CGPoint(x: self.view.frame.width, y: self.view.frame.height))
        
        
        //rampView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4));

        collision.addBoundary(withIdentifier: "ramp" as NSCopying, from: CGPoint(x: 0, y: 200),to: CGPoint(x: 250, y: 340))
        
        
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.letItSnow), userInfo: nil, repeats: true)
    }

    func letItSnow() {
        let x = arc4random_uniform(UInt32(self.view.frame.width));
        let snowflake = UIView(frame: CGRect(x: Int(x), y: 0, width: 10, height: 10))
        snowflake.backgroundColor = UIColor.white
        self.view.addSubview(snowflake)
        collision.addItem(snowflake)
        gravity.addItem(snowflake)
    }

    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        
        /*
        // You have to convert the identifier to a string
        var boundary = identifier as String
        
        // The view that collided with the boundary has to be converted to a view*/
        let view = item as! UIView
    
        //print(identifier)

        
        if let myIdentifier = identifier {
            //print(myIdentifier)
            if myIdentifier as! String == "ground" {
                Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(self.meltSnow), userInfo: view, repeats: false)
                
                //meltSnow(snowflake: view)
            }
        }
        /*
        if identifier == (String("ramp") as NSCopying) {
            // Detected collision with a boundary called "shelf"
        } else if (identifier == (String("ground" as NSCopying)) {
            // Detected collision with bounds of reference view
            meltSnow(snowflake: view)
        }*/
    }
    
    func meltSnow(timer: Timer/*snowflake: UIView*/) {
        var snowflake = timer.userInfo as! UIView
        
        print("melt snow!")
        UIView.animate(withDuration: 1.0, animations: {
            snowflake.alpha = 0
        }, completion: { success in
            self.collision.removeItem(snowflake)
            self.gravity.removeItem(snowflake)
            snowflake.removeFromSuperview()
        })
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
