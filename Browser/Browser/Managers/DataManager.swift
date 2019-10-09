//
//  DataManager.swift
//  Browser
//
//  Created by Dimash on 10/2/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import Foundation

class DataManager {
    
    private var websites = [
        Website(title: "VK", url: URL(string: "https://vk.com")!),
        Website(title: "Google", url: URL(string: "https://google.com")!),
        Website(title: "Instagram", url: URL(string: "https://instagram.com")!)
    ]
    
    private var favourites = [Website]()
    var isFavourites = false
    
    var numberOfWebsites: Int {
        get {
            return isFavourites ? favourites.count : websites.count
        }
    }
    
    func add(website: Website) {
        websites.append(website)
    }
    
    func addToFavourites(website: Website) {
        favourites.append(website)
    }
    
    func getWebsite(at index: Int) -> Website {
        return isFavourites ? favourites[index] : websites[index]
    }
    
}
