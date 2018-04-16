//
//  DepartmentListController.swift
//  MapsDirection
//
//  Created by Miss Tank on 4/14/18.
//  Copyright © 2018 balitax. All rights reserved.
//

//
//  ViewController.swift
//  BondVillains
//
//  Created by Jason on 11/19/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
var name = " "


@available(iOS 10.0, *)
class DepartmentListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    
    // Get ahold of some villains, for the table
    // This is an array of Villain instances
    let allDepartment = Department.allDepartment
    
    //var global = "me"
    
    // MARK: Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allDepartment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmentCell")!
        let department = self.allDepartment[(indexPath as NSIndexPath).row]
        
        // Set the name and image
        cell.textLabel?.text = department.name
        
        // If the cell has a detail label, we will put the evil scheme in.
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let x = self.allDepartment[indexPath.row]
        
        
        name = x.name
        
        
        print("checked \(name)")
        
        
        //performSegue(withIdentifier: "SecondScreen", sender: self)
        
        
        
        
    }
}
