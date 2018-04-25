//
//  StartViewController.swift
//  Weather
//
//  Created by Victoria Grönqvist on 2018-04-25.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    @IBOutlet weak var startImage: UIImageView!
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var underLogoLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startImage.image = UIImage(named: "lackOfSunshineMarcJohns")

        // Do any additional setup after loading the view.
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

}
