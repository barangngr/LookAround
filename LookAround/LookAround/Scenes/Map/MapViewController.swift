//
//  MapViewController.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    var mapView: GMSMapView!
    var presenter: MapPresenter!
    var data: MapInfoModel!
    let locationManager = CLLocationManager()
    var myLocation = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureLocationManager()
    }
    
    func configure() {
        let camera = GMSCameraPosition.camera(withLatitude: data.lat, longitude: data.lng, zoom: 10)
        mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        mapView.delegate = self
        self.view.addSubview(mapView)
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: data.lat, longitude: data.lng)
        marker.title = data.name
        marker.snippet = data.adress
        marker.map = mapView
    }
    
    func configureLocationManager() {
        locationManager.delegate = self
        
        if CLLocationManager.locationServicesEnabled() {
          locationManager.requestLocation()

          mapView.isMyLocationEnabled = true
          mapView.settings.myLocationButton = true
        } else {
          locationManager.requestWhenInUseAuthorization()
        }
    }
    
}

// MARK: MapViewProtocol
extension MapViewController: MapViewProtocol {
    
    func handleOutput(_ output: MapPresenterOutPut) {
    }
    
}

// MARK: GMSMapViewDelegate
extension MapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        presenter.goDetail(data: data)
    }
    
}

// MARK: CLLocationManagerDelegate
extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else { return }
        locationManager.requestLocation()
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        myLocation = CLLocation(latitude: (location.coordinate.latitude), longitude: (location.coordinate.longitude))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        mapView.camera = GMSCameraPosition(target: myLocation.coordinate, zoom: 10, bearing: 0, viewingAngle: 0)
        return true
    }
    
}
