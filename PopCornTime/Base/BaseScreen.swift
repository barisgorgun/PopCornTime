//
//  BaseScreen.swift
//  PopCornTime
//
//  Created by MacBook on 5.12.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import UIKit

class BaseScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         modifyNavigationController()
        // Do any additional setup after loading the view.
    }
    

    func modifyNavigationController() {
        // Set Background Color Nil
           navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
           navigationController?.navigationBar.shadowImage = UIImage()
           navigationController?.navigationBar.backgroundColor = .clear
    }

}
