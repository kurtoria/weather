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
    var cityId : Int = 0
    var imageIcon : String = ""
    
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
        
        let iconString = getImage(code: imageIcon)
        setImage(code: iconString)
    }
    
    func setImage(code : String) {
        print("Image code is: \(code)")
        imageView.image = UIImage(named: code)
    }
    
    //#warning not done
    @IBAction func addToFav(_ sender: Any) {

        let savedCity = city + ", " + country + ", " + String(cityId)
        
        if favCities.contains(savedCity) {
            print("\(savedCity) is already in damn it")
        } else {
            favCities.append(savedCity)
            print("favCities count: \(favCities.count) + favCities: \(favCities)")
        }
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
            return "Det är megakallt ute. Stanna inne eller ta på dig massa extrakläder."
        case -9...0:
            return "Det är rätt kallt ute, glöm inte handskar!"
        case 1...5:
            return "Det är kallare än du tror utomhus, halsduk gör sig fortfarande bättre på kroppen än en förkylning. 🙃"
        case 6...9:
            return "Ute är det ganska okej just nu, men en jacka är nog en idé."
        case 10...24:
            return "Njut av nordiskt sommarväder at it's best"
        case 25...30:
            return "Det är megavarmt utomhus. Drick vatten så du ej får värmeslag!"
        default:
            return ""
        }
    }

}
