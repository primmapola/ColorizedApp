//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by Grigory Don on 12.10.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    
    func setNewColor(for colorValue: Color)
    
}

class StartViewController: UIViewController {
    
    var colorValue: Color = Color(redColorValue: 1, greenColorValue: 1, blueColorValue: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: CGFloat(colorValue.redColorValue),
                                       green: CGFloat(colorValue.greenColorValue),
                                       blue: CGFloat(colorValue.blueColorValue),
                                       alpha: 1)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else {
            return
        }
        
        settingsVC.colorValue = colorValue
        settingsVC.redSliderDonor = colorValue.redColorValue
        settingsVC.greenSliderDonor = colorValue.greenColorValue
        settingsVC.blueSliderDonor = colorValue.blueColorValue
        settingsVC.delegate = self
        
    }
   
}

extension StartViewController: SettingsViewControllerDelegate {
    func setNewColor(for colorValue: Color) {
        self.colorValue = colorValue
        view.backgroundColor = UIColor(red: CGFloat(colorValue.redColorValue),
                                       green: CGFloat(colorValue.greenColorValue),
                                       blue: CGFloat(colorValue.blueColorValue),
                                       alpha: 1)
    }
}
