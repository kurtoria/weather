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
    @IBOutlet weak var underLogoLabel: UIButton!
    
    @IBOutlet weak var lightning1: UILabel!
    @IBOutlet weak var lightning2: UILabel!
    @IBOutlet weak var lightning3: UILabel!
    @IBOutlet weak var lightning4: UILabel!
    @IBOutlet weak var lightning5: UILabel!
    @IBOutlet weak var lightning6: UILabel!
    
    var dynamicAnimator : UIDynamicAnimator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //startImage.image = UIImage(named: "lackOfSunshineMarcJohns")
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        
        
        //lightning3.isHidden = true
        //lightning4.isHidden = true
        //lightning5.isHidden = true
        thunderStruck()
        
    }
    
    func thunderStruck() {
        lightning(end: CGPoint(x: -15.0, y: 470.0), light: lightning1, duration: 2.5)
        lightning(end: CGPoint(x: -12.0, y: 640.0), light: lightning2, duration: 2.0)
        lightning(end: CGPoint(x: -12.0, y: 580.0), light: lightning3, duration: 1.5)
        lightning(end: CGPoint(x: -12.0, y: 380.0), light: lightning4, duration: 1.5)
        lightning(end: CGPoint(x: -12.0, y: 234.0), light: lightning5, duration: 1.0)
        lightning(end: CGPoint(x: -12.0, y: 850.0), light: lightning6, duration: 1.5)
    }
    
    func lightning(end: CGPoint, light : UILabel, duration : Double) {
        UIView.animate(withDuration: duration, animations: {
            light.center = end
        }) /*{ (complete) in
            UIView.animate(withDuration: 2.0, animations: {
                print("Done")
            })
 
        }
 */
    }

    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
        let pos = sender.location(in: self.view)
        print("Tap, \(pos)")
    
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
