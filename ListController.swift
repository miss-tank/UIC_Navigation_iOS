//
//  ListController.swift
//  
//
//  Created by Miss Tank on 4/14/18.
//
//

import UIKit
import MapKit

// MARK: - ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
var name = " "

var sourceLatitude = 0.0
var sourceLongitude = 0.0

var destinationLatitude = 0.0
var destinationLongitude = 0.0

var DesitnationName = " "




class ListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    
    // Get ahold of some villains, for the table
    // This is an array of Villain instances
    let allDepartment = Department.allDepartment
    
    let List = ["A", "V", "o"]
    
    
    //var global = "me"
    
    // MARK: Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allDepartment.count

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // drawPath()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "DepartmentCell")
        let department = self.allDepartment[(indexPath as NSIndexPath).row]

        //cell.textLabel?.text = List[indexPath.row]
        
        cell.textLabel?.text = department.name

        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
//
//    
//    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let x = self.allDepartment[indexPath.row]
               name = x.name
//        
//        
        
        
        // 410 S morgan st: 41.876319, -87.652616
        //UH :41.873857, -87.650934
        //SEO : 41.871919, -87.650813
        // BSB : 41.874101, -87.652692
        
        sourceLatitude = 41.876319
        sourceLongitude = -87.652616
        
        
        print("checked \(name)")
        
        if name.isEqual("BSB")
        {
            print("You clicked BSB")
            DesitnationName = " Behva"
            destinationLatitude = 41.874101
            destinationLongitude = -87.652692
            
            

        }
        else if name.isEqual("SEO")
        {
            print("You clicked SEO")
            DesitnationName = " Scie off"
            destinationLatitude = 41.871919
            destinationLongitude = -87.650813

        }
        else if name.isEqual("UH")
        {
            print("You clicked UH")
            DesitnationName = " University hall"
            destinationLatitude = 41.873857
            destinationLongitude = -87.650934

        }
        performSegue(withIdentifier: "openDirection", sender: self)
    }
}


