//
//  ViewController.swift
//  RT Survey
//
//  Created by Idapps on 2/8/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet weak var mapa: MKMapView!

    let locationManager = CLLocationManager()
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapa.delegate = self
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        mapa.showsUserLocation = true
        // set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        centerMapOnLocation(initialLocation)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
            mapView.centerCoordinate = userLocation.location!.coordinate
    }

    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        mapa.showsUserLocation = (status == .AuthorizedAlways)
    }
    
    
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        
       
        UIApplication.sharedApplication().openURL(NSURL(string: String(format: "comgooglemaps://?center=%f,%f", location.coordinate.latitude, location.coordinate.longitude))!)
       

        let annotation = MKPointAnnotation()
        annotation.coordinate = location.coordinate
        mapa.addAnnotation(annotation)
        mapa.setRegion(coordinateRegion, animated: true)
    }
}
