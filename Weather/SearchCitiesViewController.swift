//
//  SearchCitiesViewController.swift
//  Weather
//
//  Created by Victoria Grönqvist on 2018-04-20.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import UIKit

class SearchCitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    
    //var searchResult : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchButton(_ sender: Any) {
        searchReult = []
        getWeather(safeString: searchField.text!, tableView: tableView)
        searchField.text = ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchReult.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let indexPath = tableView.indexPathForSelectedRow
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchedCell", for: indexPath) as! SearchedCitiesTableViewCell
        if ( weatherResponse.list[indexPath.row].name .isEmpty) {
            cell.cityLabel.text = ""
            cell.cityId = 0
        } else {
            /*
            cell.cityLabel.text = weatherResponse.list[indexPath.row].name + ", " + weatherResponse.list[indexPath.row].sys["country"]!
            cell.cityId = weatherResponse.list[indexPath.row].id
            print("City is: " + cell.cityLabel.text! + ", and CellId is: " + String(cell.cityId))
            cell.degreesLabel.text = getDegrees(i: indexPath.row)
            */
            cell.cityId = indexPath.row
            cell.cityLabel.text = getCity(i: indexPath.row) + ", " + getCountryName(i: indexPath.row)
            cell.degreesLabel.text = getDegrees(i: indexPath.row)
        }
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "specificSearch" {
        
            if let cell = sender as? SearchedCitiesTableViewCell {
                let specificCity : SearchedSpecificCityViewController = segue.destination as! SearchedSpecificCityViewController
                if cell.cityId != 0 {
                    print("Id of city, not 0: \(cell.cityId)")
                    
                    specificCity.city = getCity(i: cell.cityId)
                    specificCity.country = getCountryName(i: cell.cityId)
                    specificCity.degrees = getDegrees(i: cell.cityId)
                    specificCity.wind = getWind(i: cell.cityId)
                    specificCity.humidity = getHumidity(i: cell.cityId)
                    
                    //#warning fix non-optional cityId
                    //specificCity.passedCity = cell.cityId
                    
                } else {
                    print("Id of city: \(cell.cityId)")
                }
                //specificCity.passedCity = String(cell.cityId)
                //print("CellId is: " + String(cell.cityId))
            }
        }
    }
    

}
