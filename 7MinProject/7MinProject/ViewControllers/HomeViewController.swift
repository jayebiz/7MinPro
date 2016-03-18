//
//  HomeViewController.swift
//  7MinProject
//
//  Created by Chirag Ganatra on 17/03/16.
//  Copyright © 2016 Chirag Ganatra. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var buttonFacebookLogin: UIButton!
    @IBOutlet var buttonTwitterLogin: UIButton!
    @IBOutlet var buttonGooglePlusLogin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func facebookLoginActionListener(sender: AnyObject) {
        let objectWorkoutHomeView:WorkoutsHomeViewController = WorkoutsHomeViewController(nibName: "WorkoutsHomeViewController", bundle: nil)
        self.navigationController?.pushViewController(objectWorkoutHomeView, animated: true)
    }
    @IBAction func twitterLoginActionListener(sender: AnyObject) {
    }
    @IBAction func googlePlusLoginActionListener(sender: AnyObject) {
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
