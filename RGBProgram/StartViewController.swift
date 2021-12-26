//
//  StartViewController.swift
//  RGBProgram
//
//  Created by Владислав on 26.12.2021.
//

import UIKit

protocol SettingsColourVCDelegate {
    func setColor(color: UIColor)
}

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VC = segue.destination as! SettingsColorVC
        VC.delegate = self
        
    }
    

}

extension StartViewController: SettingsColourVCDelegate {
    func setColor(color: UIColor) {
        view.backgroundColor = color
    }
    
}

