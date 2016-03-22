//
//  WorkoutsHomeViewController.swift
//  7MinProject
//
//  Created by Chirag Ganatra on 17/03/16.
//  Copyright © 2016 Chirag Ganatra. All rights reserved.
//

import UIKit

class WorkoutsHomeViewController: UIViewController{

    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var buttonMyWorkouts: UIButton!
    @IBOutlet var buttonAllWorkouts: UIButton!
    @IBOutlet var buttonCalendar: UIButton!
    
    @IBOutlet var constraintMoverLeading: NSLayoutConstraint!
    @IBOutlet var constraintMoverWidth: NSLayoutConstraint!
    
    var myWorkoutsView:MyWorkoutsViewController = MyWorkoutsViewController()
    var allWorkoutsView:AllWorkoutsViewController = AllWorkoutsViewController()
    var calendarView:CalendarViewController = CalendarViewController()
    
    @IBOutlet var carousel : iCarousel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.ThemeMethod()

        //carousel initial configurations
        carousel.type = .Linear
        carousel.reloadData()
        //first index
        carousel.currentItemIndex = 0
        carousel.pagingEnabled = true
        carousel.bounces = false
    }
    
    override func viewWillAppear(animated: Bool) {
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    // MARK: - font name
    func ThemeMethod(){
        
        // In-case you want to check about your custom installed font availability
        /*
            Procedure to add the font.
            - Manually add .ttf files by drag and drop in you project, for this fonts you will check it out inside 'Fonts' folder.
            - In info.plist, add all fonts inside 'Fonts provided by application' array.
        
        */
        // UIFont.checkForFontAvailability()
        
        labelTitle.font = UIFont.universalFont(15)
        buttonMyWorkouts.titleLabel?.font = UIFont.universalFont(13)
        buttonAllWorkouts.titleLabel?.font = UIFont.universalFont(13)
        buttonCalendar.titleLabel?.font = UIFont.universalFont(13)
    }
    
    
    // MARK: - Movers action listeners
    @IBAction func myWorkoutActionListener(sender: AnyObject) {
        carousel.currentItemIndex = 0
        self.myWorkoutMethod()
    }
    func myWorkoutMethod(){
        // Moving mover bar through animation
        UIView.animateWithDuration(0.2, delay: 0.0, options: .TransitionCrossDissolve, animations: { () -> Void in
            self.constraintMoverLeading.constant = 0
            self.view.layoutIfNeeded()
            }) { (isCompleted:Bool) -> Void in
        }
    }
    
    @IBAction func allWorkoutActionListener(sender: AnyObject) {
        carousel.currentItemIndex = 1
        self.allWorkoutMethod()
    }
    func allWorkoutMethod(){
        // Moving mover bar through animation
        UIView.animateWithDuration(0.2, delay: 0.0, options: .TransitionCrossDissolve, animations: { () -> Void in
            self.constraintMoverLeading.constant = self.buttonAllWorkouts.frame.size.width
            self.view.layoutIfNeeded()
            }) { (isCompleted:Bool) -> Void in
        }
    }

    @IBAction func calendarActionListener(sender: AnyObject) {
        carousel.currentItemIndex = 2
        self.calendarMethod()
    }
    func calendarMethod(){
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

extension WorkoutsHomeViewController: iCarouselDataSource, iCarouselDelegate{
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int
    {
        return 3
    }
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView
    {
        var itemView: UIView!
        
        //create new view if no view is available for recycling
        if (view == nil)
        {
            if index == 0 {
                myWorkoutsView.view.frame = CGRect(x:0, y:0, width:UIScreen.mainScreen().bounds.width, height:UIScreen.mainScreen().bounds.height - (64 + 44))
                itemView = myWorkoutsView.view
            }else if index == 1{
                allWorkoutsView.view.frame = CGRect(x:0, y:0, width:UIScreen.mainScreen().bounds.width, height:UIScreen.mainScreen().bounds.height - (64 + 44))
                itemView = allWorkoutsView.view
            }else if index == 2{
                calendarView.view.frame = CGRect(x:0, y:0, width:UIScreen.mainScreen().bounds.width, height:UIScreen.mainScreen().bounds.height - (64 + 44))
                itemView = calendarView.view
            }
            
        }
        else
        {
            //get a reference to the label in the recycled view
            if index == 0 {
                itemView = myWorkoutsView.view
            }else if index == 1{
                itemView = allWorkoutsView.view
            }else if index == 2{
                itemView = calendarView.view
            }
        }
        
        //set item label
        //remember to always set any properties of your carousel item
        //views outside of the `if (view == nil) {...}` check otherwise
        //you'll get weird issues with carousel item content appearing
        //in the wrong place in the carousel
        //label.text = "\(items[index])"
        
        return itemView
    }
    func carouselCurrentItemIndexDidChange(carousel: iCarousel) {
        if carousel.currentItemIndex == 0 {
            self.myWorkoutMethod()
        }else if carousel.currentItemIndex == 1{
            self.allWorkoutMethod()
        }else if carousel.currentItemIndex == 2{
            self.calendarMethod()
        }
    }
    
    func carousel(carousel: iCarousel, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat
    {
        if (option == .Spacing)
        {
            //Some spacing
            //return value * 1.1
            
            //No spacing
            return value
        }
        return value
    }
}
