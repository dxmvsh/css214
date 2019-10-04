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
        Website(title: "SDU Portal", url: URL(string: "http://my.sdu.edu.kz")!),
        Website(title: "Instagram", url: URL(string: "https://instagram.com")!)
    ]
    
    private var favourites = [Website]()
    
    lazy var numberOfWebsites = {
        return websites.count
    }()
    
    func add(website: Website) {
        websites.append(website)
    }
    
    func addToFavourites(_ website: Website) {
        favourites.append(website)
    }
    
    func getWebsite(at index: Int) -> Website {
        return websites[index]
    }
    
}
