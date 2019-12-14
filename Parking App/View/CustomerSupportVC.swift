//
//  CustomerSupportVC.swift
//  Parking App
//
//  Created by Xcode User on 2019-12-13.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import UIKit

import MessageUI

class CustomerSupportVC: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet var callButton: UIButton!
    
    @IBOutlet var emailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pig-1")!)
        // Do any additional setup after loading the view.
    }

    @IBAction func doingCall(){
         print("Trying to call...")
         
         var phoneNumber : String = "3065803931"
         
         // URL format tel://1234567890
         let callString : String = "tel://\(phoneNumber)"
         
         //convert string into URL
         let url = URL(string: callString)
         
         print("URL : \(url)")
         
         //check if any application is available to execute the created URL
         if UIApplication.shared.canOpenURL(url!){
             
             //check the version of iOS on the device on which the app is running
             if #available(iOS 10, *){
                 //for all the version of iOS 10 onwards
                 //if app is available open the URL
                 UIApplication.shared.open(url!)
             }else{
                 //for iOS version 9 and older
                 UIApplication.shared.openURL(url!)
             }
         }else{
             print("Can't place call")
         }
     }
    
    @IBAction func mailButtonPressed(_ sender: Any) {
        

      
        if MFMailComposeViewController.canSendMail() {
         
             let mailComposeViewController = MFMailComposeViewController()
             mailComposeViewController.mailComposeDelegate = self
             mailComposeViewController.setToRecipients(["abc@abc.abc"])
             mailComposeViewController.setSubject("Subject")
             mailComposeViewController.setMessageBody("Hello!!!", isHTML: false)
         
             present(mailComposeViewController, animated: true, completion: nil)
         
        }
    }


    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
     
         controller.dismiss(animated: true, completion: nil)
     
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
