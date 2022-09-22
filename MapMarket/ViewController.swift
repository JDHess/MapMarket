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
    

    var update = 0
    var manager = CLLocationManager()
    
    var organizations: [Organizations] = []
    
    let locationM = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager.delegate = self
        organizations = bringAllOrganizations()
        
        locationM.delegate = self
        organizations = bringAllOrganizations()
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
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: {(timer) in
            if let coordinate = self.manager.location?.coordinate {
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                
                self.mymap.addAnnotation(annotation)
            }
            else {
                self.manager.requestWhenInUseAuthorization()
            }
        })
        
    }
    }

