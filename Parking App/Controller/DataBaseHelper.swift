//
//  DataBaseHelper.swift
//  Parking App
//
//  Created by Zakim Javer on 2019-11-22.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class UserData{
    //adding new user
    func addUser(newTask: User){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity : NSEntityDescription? = NSEntityDescription.entity(forEntityName: "CustomerInfo", in: managedContext)
        
        //if we have access to user table
        
        if (userEntity != nil){
            let user = NSManagedObject(entity: userEntity!, insertInto: managedContext)
            newTask.id = self.getNextUserId()//new id
            user.setValue(newTask.name, forKey: "name")
            user.setValue(newTask.password, forKey: "password")
            user.setValue(newTask.email, forKey: "email")
            user.setValue(newTask.id, forKey: "id")
            user.setValue(newTask.contactNo, forKey: "contact_no")
            user.setValue(newTask.carPlateNo, forKey: "car_plate_no")
            
            do{
                //to perform insert operation on database table
                try managedContext.save()
                
            }catch let error as NSError{
                print("Insert user failed...\(error), \(error.userInfo)")
            }
        }
    }
    
    
    //getting all the users
    func getAllUsers() -> [NSManagedObject]?{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return nil
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CustomerInfo")
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            return result as? [NSManagedObject]
        }catch{
            print("Data fetching Unsuccessful")
        }
        return nil
    }
    
    func checkUser(cUser: User) {
        //var taskList = [User]()
        let allUsers = (self.getAllUsers() ?? nil)!
        //to check if there are no users
        if (allUsers != nil){
        
            for user in allUsers{
                print((user.value(forKey: "name") as! String) + " " + (user.value(forKey: "email") as! String) + " " + (user.value(forKey: "password") as! String) + " ")
                if(cUser.email == user.value(forKey: "email") as! String && cUser.password == user.value(forKey: "password") as! String){
                    print("Hello " + (user.value(forKey: "name") as! String))
                }
                
            }
        }
    }
    
    
    //gets new id
    func getNextUserId() -> Int{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return 0
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CustomerInfo")
        var id = 0
        do{
            let result : [NSManagedObject] = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            if (result != nil){
                //gets greatest id
                for user in result{
                    if((user.value(forKey: "id") as! Int) > id){
                        id=(user.value(forKey: "id") as! Int)
                    }
                }
            }
        }catch{
            print("Data fetching Unsuccessful")
        }
        //next id
        id+=1
        return id
    }
    
}

public class PaymentData{
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
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PaymentEntity")
        
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
            print("Data fetching Unsuccessful")
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
    
    func checkPayment() {
        //var taskList = [User]()
        let allUsers = (self.getAllPaymentInfo() ?? nil)!
        //to check if there are no users
        if (allUsers != nil){
        
            for user in allUsers{
                print((user.value(forKey: "card_number") as! String) + " " + (user.value(forKey: "cardholder_name") as! String) + " " + (user.value(forKey: "cvv_number") as! String) + " ")
            }
        }
    }
    
    
    
    
    
}
