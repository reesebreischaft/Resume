//
//  ViewController.swift
//  Resume
//
//  Created by Reese Breischaft on 2/12/18.
//  Copyright © 2018 Reese Breischaft. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate, letsCallParent {
    
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var experienceView: UIView!
    
    @IBOutlet weak var clhsView: UIView!
    @IBOutlet weak var omniView: UIView!
    @IBOutlet weak var sdiView: UIView!
    @IBOutlet weak var skaldView: UIView!
    
    
    let transition = CircularTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutView.layer.cornerRadius = 25
        experienceView.layer.cornerRadius = 25
        
        clhsView.layer.cornerRadius = 25
        omniView.layer.cornerRadius = 25
        sdiView.layer.cornerRadius = 25
        skaldView.layer.cornerRadius = 25
        
        menuButton.layer.cornerRadius = menuButton.frame.size.width / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "circle" {
            let secondVC = segue.destination as! MenuViewController
            secondVC.myParent = self
            secondVC.transitioningDelegate = self
            secondVC.modalPresentationStyle = .custom
        }
    }
    
    func amDoneHere(dataToPass: String) {
        print("\(dataToPass)")
        
        aboutView.isHidden = true
        experienceView.isHidden = true
        
        if dataToPass == "about" {
            aboutView.isHidden = false
        }
        else if dataToPass == "experience" {
            experienceView.isHidden = false
        }
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = menuButton.center
        transition.circleColor = menuButton.backgroundColor!
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = menuButton.center
        transition.circleColor = menuButton.backgroundColor!
        
        return transition
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

