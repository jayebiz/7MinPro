//
//  WorkoutsHomeViewController.swift
//  7MinProject
//
//  Created by Chirag Ganatra on 17/03/16.
//  Copyright © 2016 Chirag Ganatra. All rights reserved.
//

import UIKit

class WorkoutsHomeViewController: UIViewController {

    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var buttonMyWorkouts: UIButton!
    @IBOutlet var buttonAllWorkouts: UIButton!
    @IBOutlet var buttonCalendar: UIButton!
    
    @IBOutlet var constraintMoverLeading: NSLayoutConstraint!
    @IBOutlet var constraintMoverWidth: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(animated: Bool) {
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    // MARK: - font name
    func ThemeMethod(){
        
        labelTitle.font = UIFont.universalFont(14)
    }
    
    
    // MARK: - Movers action listeners
    @IBAction func myWorkoutActionListener(sender: AnyObject) {
        
        // Moving mover bar through animation
        UIView.animateWithDuration(0.2, delay: 0.0, options: .TransitionCrossDissolve, animations: { () -> Void in
            self.constraintMoverLeading.constant = 0
            self.view.layoutIfNeeded()
            }) { (isCompleted:Bool) -> Void in
        }
        
        // Allocate my workouts view
    }
    
    @IBAction func allWorkoutActionListener(sender: AnyObject) {
        
        // Moving mover bar through animation
        UIView.animateWithDuration(0.2, delay: 0.0, options: .TransitionCrossDissolve, animations: { () -> Void in
                self.constraintMoverLeading.constant = self.buttonAllWorkouts.frame.size.width
                self.view.layoutIfNeeded()
            }) { (isCompleted:Bool) -> Void in
        }
    }

    @IBAction func calendarActionListener(sender: AnyObject) {
        
        // Moving mover bar through animation
        UIView.animateWithDuration(0.2, delay: 0.0, options: .TransitionCrossDissolve, animations: { () -> Void in
            self.constraintMoverLeading.constant = self.buttonAllWorkouts.frame.size.width*2
            self.view.layoutIfNeeded()
            }) { (isCompleted:Bool) -> Void in
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
