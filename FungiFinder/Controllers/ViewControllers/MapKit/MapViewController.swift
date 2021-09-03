//
//  MapViewController.swift
//  FungiFinder
//
//  Created by Kyle Warren on 9/3/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    //MARK: - OUTLETS
    @IBOutlet private var mapView: MKMapView!
    
    //MARK: - LIFECYCLES
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

    }
    
    //MARK: - HELPER METHODS
    func setupViews() {
        // Set initial location to users current location
        let initialLocation = CLLocation(latitude: 48.74908, longitude: -122.488225)
        mapView.centerToLocation(initialLocation)
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

private extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 2000
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
