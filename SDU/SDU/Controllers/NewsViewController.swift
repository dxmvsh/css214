//
//  NewsViewController.swift
//  SDU
//
//  Created by Dimash on 10/25/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet var newsImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    var news: News? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
        titleLabel.text = news?.title
        descriptionLabel.text = news?.description
        newsImage.image = news?.image
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
