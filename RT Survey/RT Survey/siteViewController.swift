//
//  siteViewController.swift
//  RTSurvey
//
//  Created by Idapps on 2/9/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit
import MapKit

class siteViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var latitud: UITextField!
    @IBOutlet weak var longitud: UITextField!
    @IBOutlet var mapa: MKMapView!

    var locManager: CLLocationManager!
    var location: CLLocation!
    let regionRadius: CLLocationDistance = 1000
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let titulo = "Site"
        NSNotificationCenter.defaultCenter().postNotificationName("cambiarTituloNav", object: titulo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup our Location Manager
        locManager = CLLocationManager()
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.requestAlwaysAuthorization()
        locManager.startUpdatingLocation()
        
        //Setup our Map View
        mapa.delegate = self
        mapa.mapType = MKMapType.Satellite
        mapa.showsUserLocation = true

    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        locManager.stopUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapa.setRegion(coordinateRegion, animated: true)
    }

   
    // MARK: - Mapas
    func mapView(mapView: MKMapView, didUpdateUserLocation
        userLocation: MKUserLocation) {
            mapa.centerCoordinate = userLocation.location!.coordinate
            centerMapOnLocation(userLocation.location!)
            latitud.text = String(userLocation.location!.coordinate.latitude)
            longitud.text = String(userLocation.location!.coordinate.longitude)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
