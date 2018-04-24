//
//  FavCitiesTableViewController.swift
//  Weather
//
//  Created by Victoria Grönqvist on 2018-04-20.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import UIKit

class FavCitiesTableViewController: UITableViewController, UISearchResultsUpdating {
    var searchController : UISearchController!
    //var favCities : [Int : String] = [:]
    var favCities : [String] = []
    var searchResult : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        setupSearchBar()
    }
    
    //Set up search bar
    func setupSearchBar() {
        definesPresentationContext = true
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    /*
    func fromIntToString(intArray : [Int]) -> [String] {
        var stringArray : [String]
        for one in intArray {
            one = getCityName(i: )
            stringArray.append(one)
        }
        return stringArray
    }
     */
    
    
    // #warning make more effective later by using own class for search bar
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text?.lowercased() {
            //searchResult = favCities[String].filter({ $0.lowercased().contains(text) })
            searchResult = favCities.filter({ $0.lowercased().contains(text) })
        } else {
            searchResult = []
        }
        tableView.reloadData()
    }
    
    //Help property
    var shouldUseSearchResult : Bool {
        if let text = searchController.searchBar.text {
            if text.isEmpty {
                return false
            } else {
                return searchController.isActive
            }
        } else {
            return false
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldUseSearchResult {
            return searchResult.count
        } else {
            return favCities.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavCityCell", for: indexPath) as! FavCitiesTableViewCell
        
        
        //#warning change to [Cities]
        let array : [String]
        
        if shouldUseSearchResult {
            array = searchResult
        } else {
            array = favCities
        }
        
        //cell.degreesLabel?.text =
        cell.cityLabel?.text = array[indexPath.row]
        
        //cell.countryLabel?.text =
        //cell.weatherImage?.image = UIImage()
        
        
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
