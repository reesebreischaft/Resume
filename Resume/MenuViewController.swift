//
//  MenuViewController.swift
//  Resume
//
//  Created by Reese Breischaft on 2/12/18.
//  Copyright © 2018 Reese Breischaft. All rights reserved.
//

import UIKit

var aboutVisible = false

protocol letsCallParent {
    func amDoneHere(dataToPass: String)
}

class MenuViewController: UIViewController {
    
    var myParent : letsCallParent?
    
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var headshotImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dismissButton.layer.cornerRadius = dismissButton.frame.size.width / 2
        headshotImage.layer.cornerRadius = headshotImage.frame.size.width / 2
        headshotImage.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func aboutVC(_ sender: Any) {
        
        if let parent = myParent {
            parent.amDoneHere(dataToPass: "about")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func experienceVC(_ sender: Any) {
        
        if let parent = myParent {
            parent.amDoneHere(dataToPass: "experience")
        }
        self.dismiss(animated: true, completion: nil)
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
