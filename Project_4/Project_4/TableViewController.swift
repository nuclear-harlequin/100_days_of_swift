//
//  TableViewController.swift
//  Project_4
//
//  Created by Giovanna Toni on 13/10/21.
//

import UIKit

class TableViewController: UITableViewController {
    var websites = ["smithsonianmag.com", "bigthink.com", "theonion.com", "oddee.com", "apartmenttherapy.com", "coolthings.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Select a website:"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return websites.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WebView") as? ViewController {
            vc.selectedWebsite = websites[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
