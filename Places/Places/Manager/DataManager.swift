//
//  DataManager.swift
//  Places
//
//  Created by Dimash on 10/31/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataManager {
    static var places = [PlaceModel]()
    static func add(_ place: PlaceModel) {
        places.append(place)
    }
    static func deletePlace(at index: Int) {
        places.remove(at: index)
    }
    static func updatePlace(at index: Int, _ title: String, _ description: String) {
        places[index].title = title
        places[index].description = description
    }
    
//    static func saveData(_ title: String?, _ subtitle: String?, _ latitude: Double?, _ longitude: Double?) {
//        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
//            let context = appDelegate.persistentContainer.viewContext
//            if let entity = NSEntityDescription.entity(forEntityName: "Place", in: context) {
//                let place = NSManagedObject(entity: entity, insertInto: context)
//                place.setValue(title, forKey: "title")
//                place.setValue(subtitle, forKey: "subtitle")
//                place.setValue(latitude, forKey: "latitude")
//                place.setValue(longitude, forKey: "longitude")
//                
//                do {
//                    try context.save()
//                    places.append(place as! PlaceModel)
//                } catch {
//                    print("Error")
//                }
//            }
//        }
//        
//    }
}
