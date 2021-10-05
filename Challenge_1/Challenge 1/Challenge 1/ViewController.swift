//
//  ViewController.swift
//  Challenge 1
//
//  Created by Giovanna Toni on 07/09/21.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [String]()
    

    @IBOutlet var imageView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FLAG VIEWER"
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("png") && !item.contains("@") {
                var countryName = item
                let range = countryName.index(countryName.endIndex, offsetBy: -4)..<countryName.endIndex
                countryName.removeSubrange(range)
                countries.append(countryName)
            }
            
            countries.sort()
            
        }
        
        print(countries)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].uppercased()
        cell.imageView?.image = UIImage(named: "\(countries[indexPath.row])")
        cell.imageView?.layer.borderWidth = 1
        cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController
            {
            vc.selectedCountry = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

