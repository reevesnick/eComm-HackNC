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
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    let customerIdString = "1223344"
    
    @IBAction func signupButtonTest (_:AnyObject){
        testPostAccount(customerIdString)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
     //   setUpButtons()
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
    
    // Test Account Method
    func testPostAccount(customerId: String) {
        let emailString = emailTextField!.text
       // let passwordSttring = passwordTextField!.text
        
        let accountType = AccountType.Savings
        let accountToCreate = Account(accountId: "", accountType:accountType, nickname: emailString!, rewards: 10, balance: 100, accountNumber: "1234567890123456", customerId: customerIdString)
        AccountRequest().postAccount(accountToCreate, completion:{(response, error) in
            if (error != nil) {
                print(error)
            } else {
                let accountResponse = response as BaseResponse<Account>?
                let message = accountResponse?.message
                let accountCreated = accountResponse?.object
                print("\(message): \(accountCreated)")
            }
        })
    }

}

