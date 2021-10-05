//
//  ViewController.swift
//  Project 1
//
//  Created by Giovanna Toni on 17/08/21.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true

        let fm = FileManager.default
                 //built-in system type, that lets us work with the file system
        let path = Bundle.main.resourcePath!
                   //Bundle is a directory containing our compiled program and all our assets
                   //"tell me where I can find all those images I added to my app"
        let items = try! fm.contentsOfDirectory(atPath: path)
                    //declares a constant that is set to the contents of the directory at a path
                    //the path is the one returned from the previous line
            //the items array will be a constant collection of the names of all the files found in the resource directory of the app
        
        for item in items {
            //loop for all the files found in the directory
            if item.hasPrefix("nssl") {
                //this is a picture to load!
                pictures.append(item)
                
            }
            
            pictures.sort()
            //sorting the pictures so they are listed on the app in crescent order
            //it's only done once, after loading every picture
            
        }
        
        print(pictures)
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.selectedPictureNumber = indexPath.row + 1
            vc.totalPictures = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}
