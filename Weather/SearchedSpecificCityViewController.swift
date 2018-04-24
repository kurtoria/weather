//
//  SearchedSpecificCityViewController.swift
//  Weather
//
//  Created by Victoria Grönqvist on 2018-04-20.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import UIKit

class SearchedSpecificCityViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var degreesLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var weatherCommentText: UITextView!
    var degrees : String = ""
    var city : String = ""
    var country : String = ""
    var wind : String = ""
    var humidity : String = ""
    var weatherComment : String = ""
    var degreesInt : Int = 0
    
    
    var passedCity : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Degrees: \(degrees)")

        setUpInfo()
    }
    
    func setUpInfo() {
        degreesLabel.text = degrees
        cityLabel.text = city + ", " + country
        windLabel.text = wind
        humidityLabel.text = humidity
        weatherCommentText.text = weatherComments(degrees: degreesInt)
    }
    
    
    @IBAction func addToFav(_ sender: Any) {
        //favCities.append(passedCity)
        let savedCity = city + ", " + country
        favCities.append(savedCity)
        print("favCities count: \(favCities.count)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func weatherComments(degrees : Int) -> String {
        switch degrees {
        case -40...(-10):
            return "Rätt megakallt"
        case -9...0:
            return "Ganska kallt"
        case 1...5:
            return "Kallare än du tror, det är itne vår än!!!"
        case 6...9:
            return "Helt ok"
        case 10...20:
            return "Svenskt sommarväder at it's best"
        case 21...30:
            return "Megavarmt"
        default:
            return "Oklart"
        }
    }

}
