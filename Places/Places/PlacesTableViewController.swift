//
//  PlacesTableViewController.swift
//  Places
//
//  Created by Dimash on 10/31/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

protocol PlacesTableViewDelegate {
    func changePlace(at index: Int)
}

class PlacesTableViewController: UITableViewController {

    var delegate: PlacesTableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewBackground()
        setupNavigationBar()
    }
    
    private func setupTableViewBackground() {
        tableView.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.frame
        
        tableView.backgroundView = blurEffectView
    }
    
    func setupNavigationBar() {
        addBlurEffect(to: navigationController?.navigationBar)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                            target: self,
                                                            action: #selector(closeVC))
    }
    
    func addBlurEffect(to view: UIView?) {
        guard let view = view else { return }
        
        if let navBar = view as? UINavigationBar{
            navBar.setBackgroundImage(UIImage(), for: .default)
            navBar.shadowImage = UIImage()
        }
        
        var bounds = view.bounds
        bounds.offsetBy(dx: 0.0, dy: -20.0)
        bounds.size.height = bounds.height + 20.0
        
        let blurEffect = UIBlurEffect(style: .light)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        
        visualEffectView.isUserInteractionEnabled = false
        visualEffectView.frame = bounds
        visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(visualEffectView, at: -1)
    }

    @objc private func closeVC() {
        dismiss(animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath)
        let place = DataManager.places[indexPath.row]
        cell.textLabel?.text = place.title
        cell.detailTextLabel?.text = place.description

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.changePlace(at: indexPath.row)
        dismiss(animated: true, completion: nil)
    }
    
}
