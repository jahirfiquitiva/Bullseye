//
//  ViewController.swift
//  bullseye
//
//  Created by Jahir Fiquitiva on 6/06/18.
//  Copyright © 2018 Jahir Fiquitiva. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var counterText: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var check: UISwitch!
    @IBOutlet weak var playAgainBtn: UIButton!
    
    var random = 0
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // counterText.text = "\(counter)"
        initUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func increase(_ sender: Any) {
        counter += 1
        counterText.text = "\(counter)"
    }
    
    @IBAction func check(_ sender: Any) {
        let value = Int(round(slider.value))
        
        if check.isOn {
            if value == random {
                resultLabel.text = "You did it!"
            } else {
                resultLabel.text = "You missed it! Try again"
            }
        } else {
            if value <= random+2 && value >= random - 2 {
                resultLabel.text = "You did it!"
            } else {
                resultLabel.text = "You missed it! Try again"
            }
        }
        checkBtn.isHidden = true
        playAgainBtn.isHidden = false
        resultLabel.isHidden = false
    }
    
    @IBAction func playAgainPressed(_ sender: Any) {
        initUI()
    }
    @IBAction func onSliderValueChanged(_ sender: Any) {
        // counterText.text = "\(value)"
    }
    
    func initUI(){
        checkBtn.isHidden = false
        playAgainBtn.isHidden = true
        resultLabel.isHidden = true
        random = Int(arc4random_uniform(101))
        counterText.text = "Move the slider to \(random)"
        slider.value = 50.0
    }
    
}

