//
//  Parking.swift
//  Parking App
//
//  Created by Mohit Mamtani on 2019-11-21.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import Foundation

public class ParkingModel{
    internal init(plateNumber: String, buildingCode: Int, suiteVisiting: Int, parkingCount: Int, hoursParked: Int, parkingBeginTime: Date, parkingEndTime: Date, parkingCost: Int) {
        self.plateNumber = plateNumber
        self.buildingCode = buildingCode
        self.suiteVisiting = suiteVisiting
        self.parkingCount = parkingCount
        self.hoursParked = hoursParked
        self.parkingBeginTime = parkingBeginTime
        self.parkingEndTime = parkingEndTime
        self.parkingCost = parkingCost
    }
    
    var plateNumber: String!
    var buildingCode: Int!
    var suiteVisiting: Int!
    var parkingCount: Int!
    var hoursParked: Int!
    var parkingBeginTime: Date!
    var parkingEndTime: Date!
    var parkingCost: Int!
    
    
    
}
