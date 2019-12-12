

import UIKit
import MapKit
import CoreLocation

class SearchVC: UIViewController {
    
    
    var locationManager = CLLocationManager()
    var regionRadius: CLLocationDistance = 100

    @IBOutlet var myMap : MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup map appearance
        myMap.mapType = MKMapType.satellite
        myMap.isZoomEnabled = true
        myMap.isScrollEnabled = true
        myMap.isUserInteractionEnabled = true
        
        print("hi")
        //set up locationmanager properties
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        print("hi2")
        if (CLLocationManager.locationServicesEnabled()){
            locationManager.startUpdatingLocation()
        }
    }
    
    @IBAction func onSearchNearby(){
        
        let request = MKLocalSearch.Request()
        let keyword = "parking"
        
        request.naturalLanguageQuery = keyword
        
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        
        let centerCoordinate = CLLocationCoordinate2D(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
        
        request.region = MKCoordinateRegion(center: centerCoordinate, span: span)
        
         let search = MKLocalSearch(request: request)
        
        search.start(completionHandler: {(response, error) in
        guard let response = response else{
            print("error : \(error?.localizedDescription ?? "Unknown error happened.")")
            return
            }
            
            for item in response.mapItems{
                self.addPinToMap(title: item.name, lat: item.placemark.location!.coordinate.latitude, long: item.placemark.location!.coordinate.longitude)
            }
            
            var region : MKCoordinateRegion = self.myMap.region
            var span : MKCoordinateSpan = self.myMap.region.span
            span.latitudeDelta *= 8
            span.longitudeDelta *= 8
            region.span = span
            self.myMap.setRegion(region, animated: true)
            
        })
        
        
        
    }
    
    
}


extension SearchVC : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            locationManager.requestLocation()
        case .authorizedAlways:
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestLocation()
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if locations.last != nil{
            print("location :: \(locations.last)")
        }
        
        print("Updating location")
        
        //create a center point of our location to be displayed on map using current latitude and longitude
        let center = CLLocationCoordinate2D(latitude: (locationManager.location?.coordinate.latitude)!,
                                            longitude: (locationManager.location?.coordinate.longitude)!)
        
        print("center : \(center)")
        
        let region = MKCoordinateRegion(center: center, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        self.myMap.setRegion(region, animated: true)
        
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = center //where to display...provide 2D coordinates...Lat and Long
        myAnnotation.title = "You are here !"
        
        myMap.addAnnotation(myAnnotation)
    }
    
    func addPinToMap(title: String?, lat: CLLocationDegrees, long: CLLocationDegrees){
        if let title = title{
            let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
            let myAnnotation = MKPointAnnotation()
            myAnnotation.coordinate = location
            myAnnotation.title = title
            self.myMap.addAnnotation(myAnnotation)
        }
    }
    
}
