//
//  ViewController.swift
//  RGBProgram
//
//  Created by Владислав on 10.12.2021.
//

import UIKit

class SettingsColorVC: UIViewController {
    
    @IBOutlet weak var modifyingView: UIView!
    
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTF: UITextField!
    @IBOutlet weak var greenTF: UITextField!
    @IBOutlet weak var blueTF: UITextField!
    
    var delegate: SettingsColourVCDelegate!
    
    private var viewCornerRadius: CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setingsForView()
        slidersSetting()
        labelsSettings()
        modifyingView.layer.cornerRadius = viewCornerRadius
        addDoneButtonTo(redTF)
        addDoneButtonTo(greenTF)
        addDoneButtonTo(blueTF)
    }
    
    @IBAction func redSliderAction() {
        redValue.text = String(format: "%.2f", redSlider.value)
        redTF.text = String(format: "%.2f", redSlider.value)
        setingsForView()
        
    }
    @IBAction func greenSliderAction() {
        greenValue.text = String(format: "%.2f", greenSlider.value)
        greenTF.text = String(format: "%.2f", greenSlider.value)
        setingsForView()
    }
    @IBAction func blueSliderAction() {
        blueValue.text = String(format: "%.2f", blueSlider.value)
        blueTF.text = String(format: "%.2f", blueSlider.value)
        setingsForView()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setColor(color: modifyingView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    private func setingsForView() {
        modifyingView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                                green: CGFloat(greenSlider.value),
                                                blue: CGFloat(blueSlider.value),
                                                alpha: 1
        )
        
    }
    
    private func slidersSetting() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
    
    private func labelsSettings() {
        redValue.text = String(format: "%.2f", redSlider.value)
        greenValue.text = String(format: "%.2f", greenSlider.value)
        blueValue.text = String(format: "%.2f", blueSlider.value)
        redTF.text = String(format: "%.2f", redSlider.value)
        greenTF.text = String(format: "%.2f", greenSlider.value)
        blueTF.text = String(format: "%.2f", blueSlider.value)
    }
    
}

extension SettingsColorVC: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == redTF {
            guard let text = textField.text else { return }
            if let currentValue = Float(text) {
                redValue.text = String(currentValue)
                redSlider.value = currentValue
                setingsForView()
            } else {
                showAlert()
            }
        } else if textField == greenTF {
            guard let text = textField.text else { return }
            if let currentValue = Float(text) {
                greenTF.text = String(currentValue)
                greenSlider.value = currentValue
                setingsForView()
            } else {
                showAlert()
            }
    } else if textField == blueTF {
        guard let text = textField.text else { return }
        if let currentValue = Float(text) {
            blueTF.text = String(currentValue)
            blueSlider.value = currentValue
            setingsForView()
        } else {
            showAlert()
        }
}
}
    private func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Incorrect data entry, please entry only numbers", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated:true)
    }
    private func addDoneButtonTo(_ textField: UITextField) {
             
             let numberToolbar = UIToolbar()
             textField.inputAccessoryView = numberToolbar
             numberToolbar.sizeToFit()
             
             let doneButton = UIBarButtonItem(title:"Done",
                                              style: .done,
                                              target: self,
                                              action: #selector(didTapDone))
             
             let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                                 target: nil,
                                                 action: nil)
             numberToolbar.items = [flexBarButton, doneButton]
             
         }
         
         @objc private func didTapDone() {
             view.endEditing(true)
         }
}
