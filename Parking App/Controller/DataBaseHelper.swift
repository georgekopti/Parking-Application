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
    
    func checkUser(cUser: User) -> Bool {
        //var taskList = [User]()
        let allUsers = (self.getAllUsers() ?? nil)!
        print("All Users:\n")
        
        //to check if there are no users
        if (allUsers != nil){
            for user in allUsers{
                print((user.value(forKey: "name") as! String) + " " + (user.value(forKey: "email") as! String) + " " + (user.value(forKey: "password") as! String) + " ")
                if(cUser.email == user.value(forKey: "email") as! String && cUser.password == user.value(forKey: "password") as! String){
                    return true
                }
                
            }
        }
        return false
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
