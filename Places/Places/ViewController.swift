//
//  ViewController.swift
//  Places
//
//  Created by Dimash on 10/29/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    let mapTypes: [MKMapType] = [.standard, .satellite, .hybrid]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        setupNavigationBar()
        setupView()
    }
    
    func setupNavigationBar() {
        setNavigationBarBlur()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks,
                                                            target: self,
                                                            action: #selector(showPlacesTableView))
    }
    
    private func setNavigationBarBlur() {
        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurEffectView.frame = (self.navigationController?.navigationBar.bounds.insetBy(dx: 0, dy: -10).offsetBy(dx: 0, dy: -10))!
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.addSubview(blurEffectView)
        navigationController?.navigationBar.sendSubviewToBack(blurEffectView)
    }
    
    @objc private func showPlacesTableView() {
        let placesVC = storyboard?.instantiateViewController(withIdentifier: "PlacesNavigationController") as! UINavigationController
        placesVC.modalPresentationStyle = .overCurrentContext

        navigationController?.present(placesVC, animated: true, completion: nil)
    }
    
    func setupView() {
        segmentedControl.tintColor = .black
        
        segmentedControl.addTarget(self, action: #selector(changeMapType), for: .valueChanged)
        
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(showPopUp(sender: )))
        mapView.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    @objc private func changeMapType() {
        mapView.mapType = mapTypes[segmentedControl.selectedSegmentIndex]
    }
    
    @objc private func showPopUp(sender: UILongPressGestureRecognizer) {
        guard sender.state == .began else { return }

        let location = sender.location(in: mapView)
        let alertController = configureAlertController(location: location)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func configureAlertController(location: CGPoint) -> UIAlertController {
        let alertController = UIAlertController(title: "Add Place",
                                                message: "Fill all the fields",
                                                preferredStyle: .alert)
        
        alertController.addTextField { (titleTextField) in
            titleTextField.placeholder = "Title"
        }
        
        alertController.addTextField { (descriptionTextField) in
            descriptionTextField.placeholder = "Description"
        }
        
        let addAction = UIAlertAction(title: "Add",
                                      style: .default) { (_) in
                                        let title = alertController.textFields?[0].text
                                        let description = alertController.textFields?[1].text
                                        let place = Place(title: title ?? "",
                                                                    description: description ?? "",
                                                                    coordinate: self.mapView.convert(location, toCoordinateFrom: self.mapView))
                                        self.add(place: place)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        return alertController
    }
    
    private func add(place: Place) {
        DataManager.add(place)
        addAnnotation(with: place)
    }
    
    private func addAnnotation(with place: Place) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = place.coordinate
        annotation.title = place.title
        annotation.subtitle = place.description
        mapView.addAnnotation(annotation)
    }
    
    @IBAction func previousTapped(_ sender: Any) {
        
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        
    }
    
}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
            let editButton = UIButton(type: .detailDisclosure)
            annotationView!.rightCalloutAccessoryView = editButton
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
}
