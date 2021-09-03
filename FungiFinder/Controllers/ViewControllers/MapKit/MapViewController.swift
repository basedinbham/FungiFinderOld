//
//  MapViewController.swift
//  FungiFinder
//
//  Created by Kyle Warren on 9/3/21.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    //MARK: - OUTLETS
    @IBOutlet private var mapView: MKMapView!
    
    let manager = CLLocationManager()
    
    //MARK: - LIFECYCLES
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupViews()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    
    //MARK: - HELPER METHODS
//    func setupViews() {
//        // Set initial location to users current location
//        let initialLocation = CLLocation(latitude: 48.74908, longitude: -122.488225)
//        mapView.centerToLocation(initialLocation)
//    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            
            render(location)
        }
    }
    
    func render(_ location: CLLocation) {
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}// End of Class

//private extension MKMapView {
//    func centerToLocation(
//        _ location: CLLocation,
//        regionRadius: CLLocationDistance = 2000
//    ) {
//        let coordinateRegion = MKCoordinateRegion(
//            center: location.coordinate,
//            latitudinalMeters: regionRadius,
//            longitudinalMeters: regionRadius)
//        setRegion(coordinateRegion, animated: true)
//    }
//}
