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
    //adding new user and return their ID
    func addUser(newTask: User)->Int{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return -1
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
                return -1
            }
        }
        return newTask.id
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
    
    //sees if the user exists in the db. if found their id is returned else it will return -1
    func checkUser(cUser: User) -> Int {
        //var taskList = [User]()
        let allUsers = (self.getAllUsers() ?? nil)!
        print("All Users:\n")
        
        //to check if there are no users
        if (allUsers != nil){
        
            for user in allUsers{
                //print((user.value(forKey: "name") as! String) + " " + (user.value(forKey: "email") as! String) + " " + (user.value(forKey: "password") as! String) + " ")
                let id = user.value(forKey: "id") as! Int
                let name = user.value(forKey: "name") as! String
                print("Customer id = \(id), name \(name)")
                if(cUser.email == user.value(forKey: "email") as! String && cUser.password == user.value(forKey: "password") as! String){
                    return user.value(forKey: "id") as! Int
                }
                
            }
        }
        return -1
    }
    
    //gets current user
    func returnUser(id : Int) -> User{
        
        let currentUser = User()
        
        let allUsers = (self.getAllUsers() ?? nil)!
        print("Called ReturnUser : \(id)")
        //to check if there are no users
        if (allUsers != nil){
            for user in allUsers{
                if(user.value(forKey: "id") as! Int == id){
                    currentUser.id = user.value(forKey: "id") as! Int
                    currentUser.email = user.value(forKey: "email") as! String
                    currentUser.name = user.value(forKey: "name") as! String
                    currentUser.password = user.value(forKey: "password") as! String
                    currentUser.contactNo = user.value(forKey: "contact_no") as! String
                    currentUser.carPlateNo = user.value(forKey: "car_plate_no") as! String
                    
                    print("This is the Dtat: \(user.value(forKey: "email") as! String)")
                    return currentUser
                }
                
            }
        }
        return currentUser
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
    
    func updateUser(user : User)->Bool{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return false
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CustomerInfo")
        
        fetchRequest.predicate = NSPredicate(format: "id = \(user.id)")
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            
            let existingUser = result[0] as! NSManagedObject
            
            existingUser.setValue(user.name, forKey: "name")
            existingUser.setValue(user.password, forKey: "password")
            existingUser.setValue(user.email, forKey: "email")
            existingUser.setValue(user.contactNo, forKey: "contact_no")
            existingUser.setValue(user.carPlateNo, forKey: "car_plate_no")
            do{
                try managedContext.save()
                print("User update Successful")
                return true
            }catch{
                print("User update unsuccessful")
                return false
            }
        }catch{
            print("User update unsuccessful")
            return false
        }
    }
    
}
//end of userData

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
            
            payment.setValue(newPayment.customerId, forKey: "customer_id")
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
    
    func updatePayment(payment : PaymentModel) -> Bool{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return false
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PaymentEntity")
        
        fetchRequest.predicate = NSPredicate(format: "customer_id = \(payment.customerId!)")
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            
            let existingPayment = result[0] as! NSManagedObject
            
            existingPayment.setValue(payment.cardholderName, forKey: "cardholder_name")
            existingPayment.setValue(payment.cardNumber, forKey: "card_number")
            existingPayment.setValue(payment.expiryDate, forKey: "expiry_date")
            existingPayment.setValue(payment.cvvNumber, forKey: "cvv_number")
            
            
            do{
                try managedContext.save()
                print("Payment update Successful")
                return true
            }catch{
                print("Payment update unsuccessful")
                return false
            }
        }catch{
            print("Payment update unsuccessful")
            return false
        }
        
    }
    
    func deletePayment(id: Int){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PaymentEntity")
        
        fetchRequest.predicate = NSPredicate(format: "customer_id = \(id)")
        
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
        print("Checking payment")
        if (allUsers != nil){
            for user in allUsers{
                let id = user.value(forKey: "customer_id") as! Int
                let name = user.value(forKey: "cardholder_name") as! String
                print("customer in payment ID = \(id), name= \(name)")
            }
        }
    }
    
    func returnPayment(id : Int) -> PaymentModel{
        
        let currentPayment = PaymentModel()
        
        let allPayments = (self.getAllPaymentInfo() ?? nil)!
        
        //to check if there are no users
        if (allPayments != nil){
            for payment in allPayments{
                if(payment.value(forKey: "customer_id") as! Int == id){
                    currentPayment.customerId = (payment.value(forKey: "customer_id") as! Int)
                    currentPayment.cardNumber = (payment.value(forKey: "card_number") as! String)
                    currentPayment.cvvNumber = (payment.value(forKey: "cvv_number") as! String)
                    currentPayment.expiryDate = (payment.value(forKey: "expiry_date") as! String)
                    currentPayment.cardholderName = (payment.value(forKey: "cardholder_name") as! String)
                    return currentPayment
                }
                
            }
        }
        return currentPayment
    }
}

public class ParkingData{
    
    
    func insertParking(newParking: ParkingModel){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let parkingEntity : NSEntityDescription? = NSEntityDescription.entity(forEntityName: "ParkingEntity", in: managedContext)
        
        if (parkingEntity != nil){
            let parking = NSManagedObject(entity: parkingEntity!, insertInto: managedContext)
            
            parking.setValue(newParking.buildingCode, forKey: "building_code")
            parking.setValue(newParking.hoursParked, forKey: "hours")
            parking.setValue(newParking.plateNumber, forKey: "plate_number")
            parking.setValue(newParking.suitNumber, forKey: "suit_number")
            parking.setValue(newParking.parkingDate, forKey: "parking_date")
            parking.setValue(newParking.parkingCost, forKey: "parking_cost")
            parking.setValue(newParking.userId, forKey: "customer_id")
           
            
            do{
                //to perform insert operation on database table
                try managedContext.save()
                
            }catch let error as NSError{
                print("Insert parking failed...\(error), \(error.userInfo)")
            }
        }
    }
    
    
    func getAllParking(user_id: Int) -> [ParkingModel]?{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return nil
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ParkingEntity")
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            var all_parking = [ParkingModel]()
            
            
            for parking in ((result as? [NSManagedObject])!){
                
                if(user_id == (parking.value(forKey: "customer_id") as! Int)){
                    
                    var new_parking = ParkingModel();
                    
                    new_parking.buildingCode = (parking.value(forKey: "building_code") as! Int)
                    new_parking.hoursParked = (parking.value(forKey: "hours") as! Int)
                    new_parking.plateNumber = (parking.value(forKey: "plate_number") as! String)
                    new_parking.suitNumber = (parking.value(forKey: "suit_number") as! Int)
                    new_parking.parkingDate = (parking.value(forKey: "parking_date") as! Date)
                    new_parking.parkingCost = (parking.value(forKey: "parking_cost") as! Int)
                    new_parking.userId = (parking.value(forKey: "customer_id") as! Int)
                    
                    all_parking.append(new_parking)
                    
                    
                }
                
                
            }
            
            return all_parking
        }catch{
            print("Data fetching Unsuccessful")
        }
        return nil
    }
    
    func getParkingCout(month: Int, user_id: Int) -> Int{
        
        var count: Int = 0
        let all_parking : [ParkingModel] = getAllParking(user_id: user_id)!
        
        for parking in all_parking{
            
            let calanderDate = Calendar.current.dateComponents([.month], from: parking.parkingDate)
            let parking_month: Int = calanderDate.month!
            
            if(parking_month == month){
                count = count + 1
            }
        }
        
        return count
    }
    
    
}
