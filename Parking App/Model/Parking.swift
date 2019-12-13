

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
    
    init() {
        self.plateNumber = ""
        self.buildingCode = 0
        self.suitNumber = 0
        self.hoursParked = 0
        self.parkingDate = nil
        self.parkingCost = 0
        self.userId = 0
    }
    var plateNumber: String!
    var buildingCode: Int!
    var suitNumber: Int!
    var hoursParked: Int!
    var parkingDate: Date!
    var parkingCost: Int!
    var userId : Int!
    
}
