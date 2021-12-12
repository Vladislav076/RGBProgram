//
//  ViewController.swift
//  RGBProgram
//
//  Created by Владислав on 10.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var redRGBValue:  CGFloat = 0.5
    private var greenRGBValue: CGFloat = 0.5
    private var blueRGBValue: CGFloat = 0.5
    private var viewCornerRadius: CGFloat = 30
    
    @IBOutlet weak var modifyingView: UIView!
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setingsForView()
        slidersSetting()
        labelsSettings()
        
}
    
    @IBAction func redSliderAction() {
        redValue.text = String(format: "%.3f", redSlider.value)
        redRGBValue = CGFloat(redSlider.value)
        modifyingView.backgroundColor = UIColor(red: redRGBValue, green: greenRGBValue, blue: blueRGBValue, alpha: 1)
        
    }
    @IBAction func greenSliderAction() {
        greenValue.text = String(format: "%.3f", greenSlider.value)
        greenRGBValue = CGFloat(greenSlider.value)
        modifyingView.backgroundColor = UIColor(red: redRGBValue, green: greenRGBValue, blue: blueRGBValue, alpha: 1)
    }
    @IBAction func blueSliderAction() {
        blueValue.text = String(format: "%.3f", blueSlider.value)
        blueRGBValue = CGFloat(blueSlider.value)
        modifyingView.backgroundColor = UIColor(red: redRGBValue, green: greenRGBValue, blue: blueRGBValue, alpha: 1)
    }
    
    private func setingsForView() {
        modifyingView.backgroundColor = UIColor(red: redRGBValue,
                                                green: greenRGBValue,
                                                blue: blueRGBValue,
                                                alpha: 1
        )
        modifyingView.layer.cornerRadius = viewCornerRadius
    }
    
    private func slidersSetting() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        redSlider.value = Float(redRGBValue)
        greenSlider.value = Float(greenRGBValue)
        blueSlider.value = Float(blueRGBValue)
    }

    private func labelsSettings() {
        redValue.text = String(redSlider.value)
        greenValue.text = String(greenSlider.value)
        blueValue.text = String(blueSlider.value)
    }
    
}

