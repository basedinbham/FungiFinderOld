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
    // Gets location of device
    let manager = CLLocationManager()
    
    //MARK: - LIFECYCLES
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupViews()
        
    }
    
    //MARK: - HELPER METHODS
    func setupViews() {
        // Set accuracy for location
        manager.desiredAccuracy = kCLLocationAccuracyBest
        // set delegate for location
        manager.delegate = self
        // Request permission
        manager.requestWhenInUseAuthorization()
        // Fetch location
        manager.startUpdatingLocation()
        // Set delegate for mapView
        mapView.delegate = self
    }
    // Delegate function; gets called when location is updated
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            
            render(location)
        }
    }
    // Zoom into map on location, & add pin
    func render(_ location: CLLocation) {
        // The latitude and longitude associated with a location
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        // The width and height of a map region.
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        // Set maps region(view)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
    // Set custom image for map pin
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customAnnotation")
        annotationView.image = #imageLiteral(resourceName: "fungiPoint2")
        annotationView.canShowCallout = true
        return annotationView
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
