//
//  SettingsViewController.swift
//  HW2.2
//
//  Created by Alex Tishchenko on 30.01.2020.
//  Copyright © 2020 Alex Tishchenko. All rights reserved.
//

import UIKit

protocol ColorProtocol: AnyObject {
    func colorChanged(newColor color: UIColor)
}


class SettingsViewController: UIViewController {

    weak var delegate: ColorProtocol?
    
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
    
    var colorEdit: UIColor!

    

	let tapGesture = UITapGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
		tapGesture.addTarget(self, action: #selector(resignResponder))
		view.addGestureRecognizer(tapGesture)
        
        navigationItem.hidesBackButton = true
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
		redSlider.value = Float(redTextField.text ?? "0") ?? 0
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.value = Float(blueTextField.text ?? "0") ?? 0
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.value = Float(greenTextField.text ?? "0") ?? 0
        
        redLabelText.text = String(format: "%.2f", redSlider.value)
        greenLabelText.text = String(format: "%.2f", greenSlider.value)
        blueLabelText.text = String(format: "%.2f", blueSlider.value)
        
        
        updateSliderValues()
        colorView.backgroundColor = colorEdit
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
    
    @IBAction func saveAndClose() {
        
        self.delegate?.colorChanged(newColor: colorView.backgroundColor ?? UIColor())

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

	@objc private func resignResponder() {
		self.view.endEditing(true)
	}
}

extension SettingsViewController: UITextFieldDelegate {
    
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
		if string.count == 0 {
			if textField.text?.count == 3 {
				textField.text = "0"
				return false
			}

			return true
		}
		guard let number = Float(string) else { return false }

		if textField.text?.count ?? 0 > 1 {
			return true
		} else {
			textField.text = "0."
		}

		switch textField {
		case redTextField:
			redSlider.value = number
		case greenTextField:
			greenSlider.value = number
		case blueTextField:
			blueSlider.value = number
		default:
			return false
		}

		updateSliderValues()

		return true
	}

	func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
		if textField.text?.count == 0 {
			textField.text = "0"
		}

		return true
	}
}
