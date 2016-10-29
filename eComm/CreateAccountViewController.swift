//
//  CreateAccountViewController.swift
//  eComm
//
//  Created by Kaleb Holley on 10/29/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//MARK - Set Up look of buttons--> Csll in viewdidload
    
    func setUpButtons(){
    signUpButton.layer.cornerRadius = 23
    signUpButton.layer.masksToBounds = true
    

    }
    
    @IBAction func createAccountDismiss(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
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
