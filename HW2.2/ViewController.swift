//
//  ViewController.swift
//  HW2.2
//
//  Created by Alex Tishchenko on 30.01.2020.
//  Copyright © 2020 Alex Tishchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var redLabelText: UILabel!
    @IBOutlet var greenLabelText: UILabel!
    @IBOutlet var blueLabelText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.value = 0
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.value = 0
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.value = 0
        
        redLabelText.text = String(format: "%.2f", redSlider.value)
        greenLabelText.text = String(format: "%.2f", greenSlider.value)
        blueLabelText.text = String(format: "%.2f", blueSlider.value)
        
        updateSliderValues()
    }
    
    @IBAction func redActionSlider() {
        updateSliderValues()
		redLabelText.text = String(format: "%.2f", redSlider.value)
    }
    
    
    @IBAction func greenActionSlider() {
        updateSliderValues()
		greenLabelText.text = String(format: "%.2f", greenSlider.value)
    }
    
    @IBAction func blueActionSlider() {
        updateSliderValues()
		blueLabelText.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func updateSliderValues() {
        
		let redSliderValue = CGFloat(redSlider.value)
		let greenSliderValue = CGFloat(greenSlider.value)
		let blueSliderValue = CGFloat(blueSlider.value)
        
		let newColor = UIColor(red: redSliderValue,
							   green: greenSliderValue,
							   blue: blueSliderValue,
							   alpha: 1)
        
		colorView.backgroundColor = newColor
        
    }
}

extension ViewController: UITextFieldDelegate {
    
}
