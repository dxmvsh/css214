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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
    }
    
    func setupNavigationBar() {
        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurEffectView.frame = (self.navigationController?.navigationBar.bounds.insetBy(dx: 0, dy: -10).offsetBy(dx: 0, dy: -10))!
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.addSubview(blurEffectView)
    }
    
    func setupView() {
        segmentedControl.tintColor = .black
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(showPopUp(sender: )))
        mapView.addGestureRecognizer(longPressGestureRecognizer)
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
                                        let annotation = Annotation(title: title ?? "",
                                                                    description: description ?? "",
                                                                    coordinate: self.mapView.convert(location, toCoordinateFrom: self.mapView))
                                        self.add(annotation: annotation)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        return alertController
    }
    
    private func add(annotation: Annotation) {
        DataManager.add(annotation)
        addPin(with: annotation)
    }
    
    private func addPin(with annotation: Annotation) {
        let pin = MKPointAnnotation()
        pin.coordinate = annotation.coordinate
        pin.title = annotation.title
        pin.subtitle = annotation.description
        mapView.addAnnotation(pin)
    }
    
    @IBAction func previousTapped(_ sender: Any) {
        
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        
    }
    
}
