//
//  WeatherModel.swift
//  Weather
//
//  Created by Victoria Grönqvist on 2018-04-20.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import Foundation
import UIKit

var favCities : [String] = []
var searchReult : [String] = []
var weatherResponse = WeatherResponse(count: 0, list: [List(name: "",
                                                            id: 0, sys: ["":""],
                                                            main: ["":0.0], wind: ["":0.0],
                                                            weather: [Weather(description: "",
                                                                              icon: "")])])

struct Weather : Codable {
    let description : String
    let icon : String
}

struct List : Codable {
    let name : String
    let id : Int
    let sys : [String : String]
    let main : [String : Float]
    let wind : [String : Float]
    let weather : [Weather]
}

struct WeatherResponse : Codable {
    let count : Int
    let list : [List]
}

struct Sys : Codable {
    let country : String
    let sunrise : Int
    let sunset : Int
}

struct ListId : Codable {
    let name : String
    let id : Int
    let sys : Sys
    let main : [String : Float]
    let wind : [String : Float]
    let weather : [Weather]
}

func getWeather(safeString : String, tableView : UITableView) {
    //if let safeString = self.searchField.text!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
    print("Goes into func")

    //if let url = URL(string: "http://api.openweathermap.org/data/2.5/find?q=\(safeString)&type=like&units=metric&APPID=14551d4f1ec5732a71a52639524f5d97") {
        if let url = URL(string: "http://api.openweathermap.org/data/2.5/find?q=\(safeString)&type=like&units=metric&APPID=11c4663bbece8c9fa78ea61f96029874") {
        let request = URLRequest(url: url)
        print("This is the url: \(url)")
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
            (data : Data?, response : URLResponse?, error : Error?) in
            if let actualError = error {
                print("This is the error: \(actualError)")
            } else {
                if let actualData = data {
                    
                    let decoder = JSONDecoder()
                    do {
                        weatherResponse = try decoder.decode(WeatherResponse.self, from: actualData)
                        
                        DispatchQueue.main.async {
                            for x in 0..<weatherResponse.count {
                                searchReult.append(weatherResponse.list[x].name + ", " + weatherResponse.list[x].sys["country"]!)
                                //print("\(x). City is: \(weatherResponse) and CityId is: ")
                            }
                            //print("Length on array: \(self.citiesStruct.count)")
                            tableView.reloadData()
                        }
                    } catch let e {
                        print("Error parsing json: \(e)")
                        print("List: \(weatherResponse.list)")
                        print("Count: \(weatherResponse.count)")
                    }
                    
                } else {
                    print("Data was nil.")
                }
            }
        })
        
        task.resume()
        
    } else {
        print("Bad url string.")
    }
    
    //searchField.text = ""
    
}
