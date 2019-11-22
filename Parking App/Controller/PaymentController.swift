//
//  PaymentController.swift
//  Parking App
//
//  Created by Mohit Mamtani on 2019-11-21.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class paymentController{
    func insertPayment(newPayment: PaymentModel){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let paymentEntity : NSEntityDescription? = NSEntityDescription.entity(forEntityName: "PaymentEntity", in: managedContext)
        
        //if we have access to user table
        if (paymentEntity != nil){
            let payment = NSManagedObject(entity: paymentEntity!, insertInto: managedContext)
            
            payment.setValue(newPayment.email, forKey: "email")
            payment.setValue(newPayment.cardholderName, forKey: "cardholder_name")
            payment.setValue(newPayment.cardNumber, forKey: "card_number")
            payment.setValue(newPayment.expiryDate, forKey: "expiry_date")
            payment.setValue(newPayment.cvvNumber, forKey: "cvv_number")
            
            
            do{
                //to perform insert operation on database table
                try managedContext.save()
                
            }catch let error as NSError{
                print("Insert payment failed...\(error), \(error.userInfo)")
            }
        }
    }
    
    func updatePayment(payment : PaymentModel){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntity")
        
        fetchRequest.predicate = NSPredicate(format: "email = %@", payment.email)
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            
            let existingPayment = result[0] as! NSManagedObject
            
            existingPayment.setValue(payment.email, forKey: "email")
            existingPayment.setValue(payment.cardholderName, forKey: "cardholder_name")
            existingPayment.setValue(payment.cardNumber, forKey: "card_number")
            existingPayment.setValue(payment.expiryDate, forKey: "expiry_date")
            existingPayment.setValue(payment.cvvNumber, forKey: "cvv_number")
            
            
            do{
                try managedContext.save()
                print("Payment update Successful")
            }catch{
                print("Payment update unsuccessful")
            }
        }catch{
            print("Payment update unsuccessful")
        }
        
    }
    
    func deletePayment(email: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PaymentEntity")
        
        fetchRequest.predicate = NSPredicate(format: "email = %@", email)
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            let existingPayment = result[0] as! NSManagedObject
            
            managedContext.delete(existingPayment)
            
            do{
                try managedContext.save()
                print("Payment delete Successful")
            }catch{
                print("Payment delete unsuccessful")
            }
            
        }catch{
            
        }
        
        
    }
    
    
    
    func getAllPaymentInfo() -> [NSManagedObject]?{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return nil
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PaymentEntity")
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            return result as? [NSManagedObject]
        }catch{
            print("Data fetching Unsuccessful")
        }
        return nil
    }
    
    
    
    
    
}
