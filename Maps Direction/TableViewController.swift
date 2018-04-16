//
//  TableViewController.swift
//  MapsDirection
//
//  Created by Miss Tank on 4/15/18.
//  Copyright © 2018 balitax. All rights reserved.
//

import UIKit

var sourceLatitude = 0.0
var sourceLongitude = 0.0
var destinationLatitude = 0.0
var destinationLongitude = 0.0
var DesitnationName = " "



class TableViewController: UITableViewController, UISearchResultsUpdating {

    //Link used : http://maps.uic.edu/#

    var array =
     [  "Admissions and Records", 
        "Bookstores",
        "Disability Resource Center",
        "ID Center",
        "Student Employment",
        "UIC Forum",
        "UIC Pavillion",
        "UIC Quad",
        "University Village Maxwell Street",
        "Academic Center for Excellence",
        "African American Academic Network",
        "African American Cultural Center",
        "Asian American Resource and Cultural Center",
        "BSB Learning Center",
        "Gender and Sexuality Center",
        "Honors College Tutoring",
        "IDEA Commons",
        "Latin American Recruitment and Educational Services",
        "Latino Cultural Center",
        "Mathematical Sciences Learning Center",
        "Science and Engineering Offices",
        "Native American Support Group",
        "Science Learning Center",
        "University Hall",
        "Study Abroad",
        "TRIO",
        "The Writing Center",
        "University Archives",
        "Women Leadership and Resource Center",
        "Academic Computing and Communication Center",
        "Agape House",
        "Alumni Relations Office",
        "Student Center East ",
        "Campus Housing",
        "UIC Recreation Center",
        "Science and Engineering Labs ",
        "Campus Programs",
        "Career Services",
        "Douglas Hall",
        "Lincoln Hall",
        "Commuter Student Resource Center",
        "John Paul II Newman Center",
        "Library, Richard J. Daley",
        "Student Services Building",
        "Innovation Center",
        "Office of Sustainability",
        "Orientation Program",
        "Parking Services",
        "Student Development Services",
        "Student Government",
        "Transfer Student Assistance Office",
        "UIC Association of Parents",
        "Wellness Advocates Volunteering to Educate Students",
        "Argo Tea",
        "Bull Market Coffee Shop",
        "Burrito Bravo",
        "Café Descartes (SCE)",
        "Dining Hall (SCE)",
        "Dunkin’ Donuts/Baskin Robins",
        "East Café",
        "Freshii",
        "Garden Café",
        "Grand Ground Café",
        "Halsted Street Station",
        "Jive n’ Java",
        "Marketplace",
        "Morgan Street Station",
        "Pollo",
        "Port Center Café",
        "Sbarro (SCE)",
        "The Daley Grind",
        "Tropical Smoothie Café (SRF)",
        "Union Station",
        "Wendy’s",
        "All Gender Restrooms",
        "Campus Advocacy Network",
        "Environmental Health and Safety Offices",
        "Family Medicine and UIC Pharmacy",
        "Lactation Rooms",
        "Medical Immunization Records",
        "Mile Square Health Center",
        "The Counseling Center",
        "The Wellness Center",
        "UIC Police",
        "University of Illinois Hospital",
        "Office of Special Scholarships",
        "Office of Student Financial Aid",
        "University Student Financial Services and Cashier Operations",
        "Veteran Affairs",
        "International Services",
        "Office of the Dean of Students",
        "Student Legal Services",
        "Harrison Field"
       
]
            var Latitude =
                [ 41.875099,
                  41.872144,
                    41.871872,
                    41.875157,
                    41.875157,
                    41.867062,
                    41.875191,
                    41.872158,
                   41.864972,
                    41.875157,
                     41.875157,
                   41.875157,
                     41.875477,
                    41.874101,
                     41.875477,
                    41.871188,
                     41.872087,
                    41.875477,
                     41.875477,
                     41.871129,
                    41.871129,
                    41.875477,
                     41.875477,
                     41.874019,
                     41.875477,
                    41.875477,
                    41.873059,
                     41.875477,
                     41.875477,
                    41.874101,
                    41.875477,
                     41.875477,
                    41.872176,
                   41.867201,
                     41.872697,
                     41.870524,
                    41.875477,
                     41.875477,
                    41.873003,
                     41.872721,
                    41.872176,
                     41.872849,
                     41.872087,
                    41.875157,
                     41.874724,
                      41.875157,
                      41.875157,
                     41.875157,
                     41.875157,
                     41.875157,
                      41.875157,
                      41.875157,
                      41.875157,
                    41.872176,
                    41.872176,
                     41.872176,
                    41.872176,
                     41.872176,
                   41.872176,
                    41.872176,
                     41.872176,
                    41.875157,
                    41.875157,
                     41.872176,
                    41.875157,
                    41.875157,
                     41.872176,
                    41.875157,
                    41.872176,
                     41.872176,
                     41.872087,
                     41.872697,
                  41.879001,
                     41.872176,
                   41.872176,
                     41.872176,
                     41.870788,
                     41.870788,
                     41.870788,
                     41.870788,
                     41.870788,
                     41.875477,
                     41.870788,
                    41.875477,
                     41.869417,
                    41.875477,
                     41.875477,
                     41.875477,
                     41.875477,
                    41.875477,
                    41.875477,
                    41.875477,
                    41.874857,
            ]
    
            var Longitude =
                [ -87.657971,
                   -87.647986,
                    -87.668586,
                    -87.658532,
                     -87.658532,
                  -87.645659,
                     -87.656141,
                   -87.649222,
                -87.650280,
                   -87.658532,
                    -87.658532,
                    -87.658532,
                   -87.658565,
                    -87.652714,
                    -87.658565,
                   -87.649487,
                     -87.650475,
                    -87.658565,
                     -87.658565,
                    -87.650449,
                     -87.650449,
                     -87.658565,
                     -87.658565,
                      -87.650996,
                      -87.658565,
                      -87.658565,
                      -87.649542,
                      -87.658565,
                     -87.658565,
                    -87.652714,
                   -87.658565,
                    -87.658565,
                    -87.647964,
                    -87.645868,
                    -87.646270,
                    -87.648119,
                    -87.658565,
                    -87.658565,
                    -87.649048,
                    -87.649296,
                    -87.647964,
                    -87.651421,
                   -87.650582,
                     -87.658532,
                   -87.658576,
                    -87.658532,
                    -87.658532,
                     -87.658532,
                    -87.658532,
                    -87.658532,
                      -87.658532,
                     -87.658532,
                    -87.658532,
                    -87.647964,
                   -87.647964,
                     -87.647964,
                    -87.647964,
                     -87.647964,
                  -87.647964,
                     -87.647964,
                    -87.647964,
                     -87.658532,
                    -87.658532,
                    -87.647964,
                    -87.658532,
                     -87.658532,
                    -87.647964,
                     -87.658532,
                    -87.647964,
                    -87.647964,
                   -87.650582,
                    -87.646270,
                     -87.640269,
                     -87.647964,
                 -87.647964,
                     -87.647964,
                    -87.671134,
                     -87.671134,
                     -87.671134,
                    -87.671134,
                     -87.671134,
                    -87.658565,
                   -87.671134,
                    -87.658565,
                     -87.671775,
                     -87.658565,
                     -87.658565,
                     -87.658565,
                     -87.658565,
                     -87.658565,
                     -87.658565,
                     -87.658565,
                    -87.648395
            ]
    
    var searchController = UISearchController()
    var resultsController = UITableViewController()
    var filtereDAray = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        searchController = UISearchController(searchResultsController: resultsController)
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        
        
        resultsController.tableView.delegate = self
        resultsController.tableView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

  
    func updateSearchResults(for searchController: UISearchController) {
        
        filtereDAray = array.filter({ (array:String) -> Bool in
            if array.contains(searchController.searchBar.text!)
            {
                return true
            }
            else
            {
                return false
            }
            
        
        })
        resultsController.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if(tableView ==  resultsController.tableView)
        {
            return filtereDAray.count

        }
        else{
            return array.count

        }
        
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
    
        if(tableView ==  resultsController.tableView)
        {
            cell.textLabel?.text = filtereDAray[indexPath.row]
        }
        else{
            cell.textLabel?.text = array[indexPath.row]
        }
        return cell
    }
    
    override
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let departmentName = array[indexPath.row]
        
        
        //UH :41.873857, -87.650934
        //SEO : 41.871919, -87.650813
        // BSB : 41.874101, -87.652692
        
        
        
        // 410 S morgan st: 41.876319, -87.652616
        sourceLatitude = 41.876319
        sourceLongitude = -87.652616
    
        
        print("checked \(departmentName)")
        print("index is -\(indexPath.row) -")
        print("Latitude is -\(Latitude[indexPath.row]) -")
        print("Longitude is -\(Longitude[indexPath.row]) -")
        print("Name is -\(array[indexPath.row]) -")
        
        destinationLatitude = Latitude[indexPath.row]
        destinationLongitude = Longitude[indexPath.row]
        DesitnationName =  departmentName

        performSegue(withIdentifier: "openDirection", sender: self)
    }
}



//        var array =
//            [  "Admissions and Records", 41.875099, -87.657971
//                "Bookstores", 41.872144, -87.647986
//                "Disability Resource Center", 41.871872, -87.668586
//                "ID Center",41.875157, -87.658532
//                "Student Employment", 41.875157, -87.658532
//                "UIC Forum", 41.867062, -87.645659
//                "UIC Pavillion",41.875191, -87.656141
//                "UIC Quad",41.872158, -87.649222
//                "University Village Maxwell Street", 41.864972, -87.650280
//                "Academic Center for Excellence",41.875157, -87.658532
//                "African American Academic Network", 41.875157, -87.658532
//                "African American Cultural Center", 41.875157, -87.658532
//                "Asian American Resource and Cultural Center", 41.875477, -87.658565
//                "BSB Learning Center", 41.874101, -87.652714
//                "Gender and Sexuality Center", 41.875477, -87.658565
//                "Honors College Tutoring", 41.871188, -87.649487
//                "IDEA Commons", 41.872087, -87.650475
//                "Latin American Recruitment and Educational Services",41.875477, -87.658565
//                "Latino Cultural Center", 41.875477, -87.658565
//                "Mathematical Sciences Learning Center", 41.871129, -87.650449
//                "Science and Engineering Offices", 41.871129, -87.650449
//                "Native American Support Group", 41.875477, -87.658565
//                "Science Learning Center", 41.875477, -87.658565
//                "Univerisity Hall", 41.874019, -87.650996
//                "Study Abroad", 41.875477, -87.658565
//                "TRIO", 41.875477, -87.658565
//                "The Writing Center", 41.873059, -87.649542
//                "University Archives", 41.875477, -87.658565
//                "Women Leadership and Resource Center", 41.875477, -87.658565
//                "Academic Computing and Communication Center",41.874101, -87.652714
//                "Agape House", 41.875477, -87.658565
//                "Alumni Relations Office", 41.875477, -87.658565
//                "Student Center East ",41.872176, -87.647964
//                "Campus Housing", 41.867201, -87.645868
//                "UIC Recreation Center", 41.872697, -87.646270
//                "Science and Engineering Labs ", 41.870524, -87.648119
//                "Campus Programs", 41.875477, -87.658565
//                "Career Services", 41.875477, -87.658565
//                "Douglas Hall", 41.873003, -87.649048
//                "Lincoln Hall", 41.872721, -87.649296
//                "Commuter Student Resource Center",41.872176, -87.647964
//                "John Paul II Newman Center", 41.872849, -87.651421
//                "Library, Richard J. Daley", 41.872087, -87.650582
//                "Student Services Building", 41.875157, -87.658532
//                "Innovation Center", 41.874724, -87.658576
//                "Office of Sustainability",  41.875157, -87.658532
//                "Orientation Program",  41.875157, -87.658532
//                "Parking Services", 41.875157, -87.658532
//                "Student Development Services",  41.875157, -87.658532
//                "Student Government",  41.875157, -87.658532
//                "Transfer Student Assistance Office",  41.875157, -87.658532
//                "UIC Association of Parents",  41.875157, -87.658532
//                "Wellness Advocates Volunteering to Educate Students",  41.875157, -87.658532
//                "Argo Tea", 41.872176, -87.647964
//                "Bull Market Coffee Shop", 41.872176, -87.647964
//                "Burrito Bravo", 41.872176, -87.647964
//                "Café Descartes (SCE)", 41.872176, -87.647964
//                "Dining Hall (SCE)", 41.872176, -87.647964
//                "Dunkin’ Donuts/Baskin Robins", 41.872176, -87.647964
//                "East Café", 41.872176, -87.647964
//                "Freshii", 41.872176, -87.647964
//                "Garden Café",41.875157, -87.658532
//                "Grand Ground Café",41.875157, -87.658532
//                "Halsted Street Station", 41.872176, -87.647964
//                "Jive n’ Java",41.875157, -87.658532
//                "Marketplace",41.875157, -87.658532
//                "Morgan Street Station", 41.872176, -87.647964
//                "Pollo",41.875157, -87.658532
//                "Port Center Café", 41.872176, -87.647964
//                "Subway (SCE)", 41.872176, -87.647964
//                "The Daley Grind", 41.872087, -87.650582
//                "Tropical Smoothie Café ",  41.872697, -87.646270
//                "Union Station", 41.879001, -87.640269
//                "Wendy’s", 41.872176, -87.647964
//                "All Gender Restrooms", 41.872176, -87.647964
//                "Campus Advocacy Network", 41.872176, -87.647964
//                "Environmental Health and Safety Offices", 41.870788, -87.671134
//                "Family Medicine and UIC Pharmacy", 41.870788, -87.671134
//                "Lactation Rooms", 41.870788, -87.671134
//                "Medical Immunization Records", 41.870788, -87.671134
//                "Mile Square Health Center", 41.870788, -87.671134
//                "The Counseling Center", 41.875477, -87.658565
//                "The Wellness Center", 41.870788, -87.671134
//                "UIC Police", 41.875477, -87.658565
//                "University of Illinois Hospital", 41.869417, -87.671775
//                "Office of Special Scholarships",41.875477, -87.658565
//                "Office of Student Financial Aid", 41.875477, -87.658565
//                "University Student Financial Services and Cashier Operations", 41.875477, -87.658565
//                "Veteran Affairs", 41.875477, -87.658565
//                "International Services", 41.875477, -87.658565
//                "Office of the Dean of Students", 41.875477, -87.658565
//                "Student Legal Services", 41.875477, -87.658565
//                "Harrison Field", 41.874857, -87.648395
//        ]
//


