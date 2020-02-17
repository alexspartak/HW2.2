//
//  FirstViewController.swift
//  HW2.2
//
//  Created by Alex Tishchenko on 2/16/20.
//  Copyright © 2020 Alex Tishchenko. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as? SettingsViewController
        secondVC?.colorEdit = view.backgroundColor
        secondVC?.delegate = self
    }
    

    
    @IBAction func buttonToSet(_ sender: UIBarButtonItem) {
       
    }
    
    @IBAction func unwindTest(segue: UIStoryboardSegue) {
        
    }
    
    

}

extension FirstViewController: ColorProtocol {
    
    func colorChanged(newColor color: UIColor) {
        view.backgroundColor = color
    }
    
    
}
