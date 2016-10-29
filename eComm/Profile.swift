//
//  Profile.swift
//  eComm
//
//  Created by Kaleb Holley on 10/29/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit

class Profile: UIViewController {

    @IBOutlet var profileImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPage()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setUpPage(){
        profileImageView.layer.cornerRadius = 100
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.borderColor = UIColor.whiteColor().CGColor
    
    
    
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
