//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Grigory Don on 11.10.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redColorLabel: UILabel!
    @IBOutlet weak var greenColorLabel: UILabel!
    @IBOutlet weak var blueColorLabel: UILabel!
    
    @IBOutlet weak var viewField: UIView!
    
    @IBOutlet weak var redTF: UITextField!
    @IBOutlet weak var greenTF: UITextField!
    @IBOutlet weak var blueTF: UITextField!
    
    var redSliderDonor: Float = 0.0
    var greenSliderDonor: Float = 0.0
    var blueSliderDonor: Float = 0.0
    
    var delegate: SettingsViewControllerDelegate!
    
    var colorValue: Color!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewField.layer.cornerRadius = 30
        
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
        
        redSlider.value = colorValue.redColorValue
        greenSlider.value = colorValue.greenColorValue
        blueSlider.value = colorValue.blueColorValue
        
        redTF.text = String(colorValue.redColorValue)
        greenTF.text = String(colorValue.greenColorValue)
        blueTF.text = String(colorValue.blueColorValue)
        
        redColorLabel.text = String(round(100 * (colorValue.redColorValue)) / 100)
        greenColorLabel.text = String(round(100 * (colorValue.greenColorValue)) / 100)
        blueColorLabel.text = String(round(100 * (colorValue.blueColorValue)) / 100)
        
        redColorLabel.textColor = .red
        greenColorLabel.textColor = .green
        blueColorLabel.textColor = .blue
        
        viewField.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)

    }
    
    @IBAction func redSliderChanges(_ sender: Any) {
        
        viewField.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
        
        redColorLabel.text = String(round(100 * (redSlider.value)) / 100)
        redTF.text = String(redSlider.value)
        colorValue.redColorValue = redSlider.value
        
    }
    
    @IBAction func greenSliderChanges(_ sender: Any) {
        
        viewField.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
        
        greenColorLabel.text = String(round(100 * (greenSlider.value)) / 100)
        greenTF.text = String(greenSlider.value)
        colorValue.greenColorValue = greenSlider.value


    }
    @IBAction func blueSliderChanges(_ sender: Any) {
        
        viewField.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
        
        blueColorLabel.text = String(round(100 * (blueSlider.value)) / 100)
        blueTF.text = String(blueSlider.value)
        colorValue.blueColorValue = blueSlider.value


    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        
        view.endEditing(true)
        delegate.setNewColor(for: colorValue)
        dismiss(animated: true)
        
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let totalValue = Float(newValue) else { return }
        
        if textField == redTF {
            colorValue.redColorValue = totalValue
        } else if textField == greenTF {
            colorValue.greenColorValue = totalValue
        } else {
            colorValue.blueColorValue = totalValue
        }
    }
    
}
