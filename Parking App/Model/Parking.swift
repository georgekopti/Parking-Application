

import Foundation
public class ParkingModel{
    internal init(plateNumber: String, buildingCode: Int, suitNumber: Int, hoursParked: Int, parkingDate: Date, parkingCost: Int, userId : Int) {
        self.plateNumber = plateNumber
        self.buildingCode = buildingCode
        self.suitNumber = suitNumber
        self.hoursParked = hoursParked
        self.parkingDate = parkingDate
        self.parkingCost = parkingCost
        self.userId = userId
    }
    
    var plateNumber: String!
    var buildingCode: Int!
    var suitNumber: Int!
    var hoursParked: Int!
    var parkingDate: Date!
    var parkingCost: Int!
    var userId : Int!
    
}
