//
//  CreateAccountViewController.swift
//  eComm
//
//  Created by Kaleb Holley on 10/29/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    

    
    
    @IBOutlet var signUpButton: UIButton!
    @IBAction func signup (_:AnyObject){
        testPostCustomer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  setUpButtons()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testPostCustomer() {
        let address = Address(streetName: "Street", streetNumber: "1", city: "City", state: "VA", zipCode: "12345")
        let customerToCreate = Customer(firstName: "Hello", lastName: "Lopez", address: address, customerId: "")
        CustomerRequest().postCustomer(customerToCreate, completion:{(response, error) in
            if (error != nil) {
                print(error)
            } else {
                let customerResponse = response as BaseResponse<Customer>?
                let message = customerResponse?.message
                let customerCreated = customerResponse?.object
                print("\(message): \(customerCreated)")
                self.testPutCustomer(customerCreated!)
            }
        })
    }
    
    func testPutCustomer(customerToBeModified: Customer) {
        customerToBeModified.firstName = "Raul"
        CustomerRequest().putCustomer(customerToBeModified, completion:{(response, error) in
            if (error != nil) {
                print(error)
            } else {
                let accountResponse = response as BaseResponse<Customer>?
                let message = accountResponse?.message
                let accountCreated = accountResponse?.object
                print("\(message): \(accountCreated)")
            }
        })
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
