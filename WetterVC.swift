//
//  WetterVC.swift
//  wetterApp
//
//  Created by Florian Schuch on 14.04.17.
//  Copyright © 2017 Florian Schuch. All rights reserved.
//

import UIKit

class WetterVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

//  IBOutlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//      table view: dataSource and delegate declared
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }

//  Necassary Functions for setting up the table view (how many sections, how many rows and who the dequeuable cell should be
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }
    
}

