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

/*var weatherResponse = WeatherResponse(count: 0, list: [List(name: "",
                                                            id: 0, sys: ["":""],
                                                            main: ["":0.0], wind: ["":0.0],
                                                            weather: ["" : ""])])
 */

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
    //let weather : [String : String]
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

/*
struct WeatherIcon : Codable {
    let id : [String : Float]
    let main : String
    let description : String
    let icon : String
}
*/

func getWeather(safeString : String, tableView : UITableView) {
    if let url = URL(string: "http://api.openweathermap.org/data/2.5/find?q=\(safeString)&type=like&units=metric&APPID=14551d4f1ec5732a71a52639524f5d97") {
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
                            }
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
}

func degreesToInt(i : Int) -> Int {
    let degrees = weatherResponse.list[i].main["temp"]
    return Int(degrees!)
}

func getCityId (i : Int) -> Int {
    let id = weatherResponse.list[i].id
    return id
}

func getCity(i : Int) -> String {
    let name = weatherResponse.list[i].name
    return name
}

func getCountryName(i : Int) -> String {
    let country = weatherResponse.list[i].sys["country"]!
    return country
}

func getDegrees(i : Int) -> String {
    let degrees = String(format: "%.1f °C", weatherResponse.list[i].main["temp"]!)
    return degrees
}

func getWind(i : Int) -> String {
    let wind = String(format: "%.1f m/s", weatherResponse.list[i].wind["speed"]!)
    return wind
}

func getHumidity(i : Int) -> String {
    let humidity = String(format: "%.1f hpa", weatherResponse.list[i].main["humidity"]!)
    return humidity
}

func getWeatherIcon(i : Int) -> String {
    let weatherIcon = weatherResponse.list[i].weather[0].icon
    print("icon is: \(weatherIcon)")
    return weatherIcon
}

func getImage(code : String) -> String {
    switch code {
    case "01d", "01n":
        return "clear"
    case "02d", "03d", "04d", "02n", "03n", "04n":
        return "clouds"
    case "09d", "10d", "09n", "10n":
        return "rain"
    case "11d", "11n":
        return "thunder"
    case "13d", "13n":
        return "snow"
    case "50d", "50n":
        return "mist"
    default:
        return ""
    }
}

//#warning fix this so u can save faves
func getCityFromId(id : Int) {
    
}

