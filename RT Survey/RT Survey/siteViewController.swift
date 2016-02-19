//
//  siteViewController.swift
//  RTSurvey
//
//  Created by Idapps on 2/9/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit
import MapKit

class siteViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var latitud: UITextField!
    @IBOutlet weak var longitud: UITextField!
    @IBOutlet var mapa: GMSMapView!
    
    var locManager: CLLocationManager!
    let marker = GMSMarker()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let titulo = "Site"
        NSNotificationCenter.defaultCenter().postNotificationName("cambiarTituloNav", object: titulo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapa.delegate = self
        mapa.myLocationEnabled = true
        mapa.settings.myLocationButton = true
        mapa.settings.zoomGestures = true
        
        
        locManager = CLLocationManager()
        locManager.delegate = self
        locManager.requestWhenInUseAuthorization()
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.requestAlwaysAuthorization()
        locManager.startUpdatingLocation()
        
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        locManager.stopUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func mapView(mapView: GMSMapView!, willMove gesture: Bool) {
        mapa.clear()
    }
    
    func mapView(mapView: GMSMapView!, idleAtCameraPosition cameraPosition: GMSCameraPosition!) {
        let geocoder = GMSGeocoder()
        let handler = { (response : GMSReverseGeocodeResponse!, error: NSError!) -> Void in
            if let result = response.firstResult() {
                
                self.marker.position = cameraPosition.target
                self.marker.title = result.lines[0] as! String
                self.marker.snippet = result.lines[1] as! String
                self.marker.map = self.mapa
                
                self.latitud.text = String(cameraPosition.target.latitude)
                self.longitud.text = String(cameraPosition.target.longitude)
            }
        }
        geocoder.reverseGeocodeCoordinate(cameraPosition.target, completionHandler: handler)
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            //mapa.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            
            self.marker.position = location.coordinate
            self.marker.appearAnimation = kGMSMarkerAnimationPop
            self.marker.map = mapa
            locManager.stopUpdatingLocation()
            
        }
        
    }
}
