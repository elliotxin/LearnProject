//
//  MapViewController.swift
//  FoodPin
//
//  Created by elliot xin on 8/10/17.
//  Copyright © 2017 elliot xin. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        
        showAnnotationInMap()
        
    }


    func showAnnotationInMap(){
        //Conver address to coordinate and annotate in on map
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location, completionHandler: {
            placemarks, error in
            if error != nil {
                print(error!)
                return
            }
            
            if let placemarks = placemarks {
                //Get the first placemark
                let placemark = placemarks[0]
                
                //Add annotation
                let annotaion = MKPointAnnotation()
                annotaion.title = self.restaurant.name
                annotaion.subtitle = self.restaurant.type
                
                if let location = placemark.location{
                    annotaion.coordinate = location.coordinate
                    
                    //Display the annotation
                    self.mapView.showAnnotations([annotaion], animated: true)
                    self.mapView.selectAnnotation(annotaion,animated: true)
                }
            }
            
        })
    }
}

extension MapViewController{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        if annotation.isKind(of: MKUserLocation.self){
            return nil
        }
        
        //Reuse the annotation if possbile
        var annotationView:MKPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        let leftIconView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 53, height: 53))
        leftIconView.image = UIImage(named:restaurant.image)
        annotationView?.leftCalloutAccessoryView = leftIconView
        annotationView?.pinTintColor = UIColor.orange
        return annotationView
    
    }
}



