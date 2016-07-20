//
//  ViewController.swift
//  ZenGarden
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var rock2: UIImageView!
    @IBOutlet var bush: UIImageView!
    @IBOutlet var rake: UIImageView!
    @IBOutlet var rock1: UIImageView!
    
    var differencePoint: CGPoint?
    var rock1LeftConstraint: NSLayoutConstraint?
    var rock1TopConstraint: NSLayoutConstraint?
    
    var rock1Coordinates : CGPoint?
    
    var rock1WinCon = false
    
    var rock2LeftConstraint: NSLayoutConstraint?
    var rock2TopConstraint: NSLayoutConstraint?
    var rock2WinCon = false
    
    var rock2Coordinates : CGPoint?
    
    var bushLeftConstraint: NSLayoutConstraint?
    var bushTopConstraint: NSLayoutConstraint?
    var bushWinCon = false
    
    var bushCoordinates : CGPoint?
    
    var rakeLeftConstraint: NSLayoutConstraint?
    var rakeTopConstraint: NSLayoutConstraint?
    var rakeWinCon = false
    
    var rakeCoordinates : CGPoint?
    
    var didWin : Bool {
        if (rock1WinCon == true && rock2WinCon == true) && (bushWinCon == true && rakeWinCon == true){
            return true} else {
            return false}
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.removeConstraints(self.view.constraints)
        
        //Rock 1 Constraints
        self.rock1.removeConstraints(self.rock1.constraints)
        self.rock1.translatesAutoresizingMaskIntoConstraints=false
        
        self.rock1TopConstraint =  self.rock1.topAnchor.constraintEqualToAnchor(self.view.centerYAnchor)
        self.rock1TopConstraint?.active=true
        
        self.rock1.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.25).active=true
        self.rock1.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.25).active=true
        
        self.rock1LeftConstraint = self.rock1.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor)
        
        self.rock1LeftConstraint?.active=true
        
        //Rock1 Adding dragging
        
        let dragRock1 = UIPanGestureRecognizer.init(target:self, action: #selector(rock1GestureRecognizer))
        
        rock1.addGestureRecognizer(dragRock1)
        
        //Rock 2 Constraints
        self.rock2.removeConstraints(self.rock2.constraints)
        self.rock2.translatesAutoresizingMaskIntoConstraints=false
        
        self.rock2TopConstraint =  self.rock2.topAnchor.constraintEqualToAnchor(self.view.centerYAnchor)
        self.rock2TopConstraint?.active=true
        
        self.rock2.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.25).active=true
        self.rock2.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.25).active=true
        
        self.rock2LeftConstraint = self.rock2.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor)
        
        self.rock2LeftConstraint?.active=true
        
        //Rock2 Adding dragging
        
        let dragRock2 = UIPanGestureRecognizer.init(target:self, action: #selector(rock2GestureRecognizer))
        
        self.rock2.addGestureRecognizer(dragRock2)
        
        //Bush Constraints
        self.bush.removeConstraints(self.bush.constraints)
        self.bush.translatesAutoresizingMaskIntoConstraints=false
        
        self.bushTopConstraint =  self.bush.topAnchor.constraintEqualToAnchor(self.view.centerYAnchor)
        self.bushTopConstraint?.active=true
        
        self.bush.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.25).active=true
        self.bush.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.25).active=true
        
        self.bushLeftConstraint = self.bush.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor)
        
        self.bushLeftConstraint?.active=true
        
        //Rock2 Adding dragging
        
        let dragBush = UIPanGestureRecognizer.init(target:self, action: #selector(bushGestureRecognizer))
        
        self.bush.addGestureRecognizer(dragBush)
        
        //Rake Constraints
        self.rake.removeConstraints(self.rake.constraints)
        self.rake.translatesAutoresizingMaskIntoConstraints=false
        
        self.rakeTopConstraint =  self.rake.topAnchor.constraintEqualToAnchor(self.view.centerYAnchor)
        self.rakeTopConstraint?.active=true
        
        self.rake.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.25).active=true
        self.rake.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.25).active=true
        
        self.rakeLeftConstraint = self.rake.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor)
        
        self.rakeLeftConstraint?.active=true
        
        //Rake Adding dragging
        
        let dragRake = UIPanGestureRecognizer.init(target:self, action: #selector(rakeGestureRecognizer))
        
        self.rake.addGestureRecognizer(dragRake)
        
        //Enabling user interaction
        
        rock2.userInteractionEnabled = true
        bush.userInteractionEnabled = true
        rake.userInteractionEnabled = true
        rock1.userInteractionEnabled = true
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if self.didWin == true {
            let alertController = UIAlertController(title: "YOU WIN", message: "You won the game!", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
                print("Cancel button pressed")
            }
            alertController.addAction(cancelAction)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
                print("OK button pressed")
            }
            alertController.addAction(OKAction)
            
            
            self.presentViewController(alertController, animated: true, completion: nil)}
    }
    
    func rock1GestureRecognizer(recognizer: UIPanGestureRecognizer){
        
        let rock1Origin = recognizer.translationInView(self.rock1)
        
        let coordinates = rock1Origin
        
        if recognizer.state == .Began {
            
            self.rock1Coordinates = coordinates}
            
        else{
            if let differencePoint = self.rock1Coordinates {
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                
                self.rock1TopConstraint?.constant += diffY
                self.rock1LeftConstraint?.constant += diffX
                self.rock1Coordinates = coordinates
                
                if rock1.distanceToView(rock2) > 100.0 {
                    rock1WinCon = true}
                
                if self.didWin == true {
                    print("WIN")
                    self.viewDidAppear(true)}
            }
        }
    }
    
    func rock2GestureRecognizer(recognizer: UIPanGestureRecognizer){
        
        
        let rock2Origin = recognizer.translationInView(self.rock2)
        
        //print(rock2TopConstraint)
        
        
        
        let coordinates = rock2Origin
        
        if recognizer.state == .Began {
            
            self.rock2Coordinates = coordinates}
            
        else{
            if let differencePoint = self.rock2Coordinates {
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                
                self.rock2TopConstraint?.constant += diffY
                self.rock2LeftConstraint?.constant += diffX
                self.rock2Coordinates = coordinates
                
                
                if (self.rock2TopConstraint?.constant < -250 || self.rock2TopConstraint?.constant > 150) && self.rock2LeftConstraint?.constant < 30{
                    rock2WinCon = true
                    print("Rock2: \(rock2WinCon)")
                }
                
                if self.didWin == true {
                    print("WIN")
                    self.viewDidAppear(true)}
            }
        }
    }
    
    func bushGestureRecognizer(recognizer: UIPanGestureRecognizer){
        
        
        let bushOrigin = recognizer.translationInView(self.bush)
        
        let coordinates = bushOrigin
        
        
        
        if recognizer.state == .Began {
            
            self.bushCoordinates = coordinates}
            
        else{
            if let differencePoint = self.bushCoordinates {
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                
                self.bushTopConstraint?.constant += diffY
                self.bushLeftConstraint?.constant += diffX
                self.bushCoordinates = coordinates
                
                if bush.distanceToView(rake) < 20.0 {
                    bushWinCon = true
                    
                    print("Bush: \(bushWinCon)")}
                
                if self.didWin == true {
                    print("WIN")
                    self.viewDidAppear(true)}
                
            }
        }
    }
    
    func rakeGestureRecognizer(recognizer: UIPanGestureRecognizer){
        
        
        let rakeOrigin = recognizer.translationInView(self.rake)
        
        let coordinates = rakeOrigin
        
        if recognizer.state == .Began {
            
            self.rakeCoordinates = coordinates}
            
        else{
            if let differencePoint = self.rakeCoordinates {
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                
                self.rakeTopConstraint?.constant += diffY
                self.rakeLeftConstraint?.constant += diffX
                self.rakeCoordinates = coordinates
                
                if rake.distanceToView(bush) < 20.0 {
                    rakeWinCon = true
                    
                    print("Rake: \(rakeWinCon)")
                }
                
                if self.didWin == true {
                    print("WIN")
                    self.viewDidAppear(true)}
                
            }
        }
    }
    
    
    
    
    
}

extension UIView {
    
    func distanceToView(view: UIView) -> CGFloat {
        
        return sqrt(pow(view.center.x - self.center.x, 2) + pow(view.center.y - self.center.y, 2))
    }
    
}

