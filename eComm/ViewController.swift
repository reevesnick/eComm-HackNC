//
//  ViewController.swift
//  eComm
//
//  Created by Neegbeah Reeves on 10/29/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUpButtons(){
        loginButton.layer.cornerRadius = 23
        loginButton.layer.masksToBounds = true
    
    
    }

}

