//
//  ViewController.swift
//  MapMarket
//
//  Created by Julie Hess on 9/21/22.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    
    @IBOutlet weak var mymap: MKMapView!
    
    let locationM = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationM.delegate = self
        locationM.requestWhenInUseAuthorization()
        locationM.startUpdatingLocation()
    }
}
// MARK: - user Location
extension ViewController: CLLocationManagerDelegate {
    
    // MARK: - func for update locations on user.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: locations[0].coordinate, span: span)
        mymap.setRegion(region, animated: true)
        self.mymap.setRegion(region, animated: true)
        mymap.showsUserLocation = true
        mymap.showsCompass = true
        
    }
    
}

