//
//  ViewController.swift
//  iOS-Easy-Task
//
//  Created by Sarina Chen on 2017-08-24.
//  Copyright © 2017 Sc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currDate: UILabel!
    @IBOutlet weak var currTemp: UILabel!
    @IBOutlet weak var showTempButton: UIButton!
    private let weather = WeatherController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.weather.getWeatherJSON(city: "Houston")
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        currDate.text = formatter.string(from: date)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonPressed(_ sender: Any) {
        if (showTempButton.currentTitle == "Clear Temperature"){
            currTemp.text = "? Celsius"
            showTempButton.setTitle("Show Current Temperature", for: .normal)
        }else{
            currTemp.text = self.weather.getTemp()
            showTempButton.setTitle("Clear Temperature", for: .normal)
        }
        
    }
}

