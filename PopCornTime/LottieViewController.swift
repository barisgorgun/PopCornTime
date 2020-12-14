//
//  LottieViewController.swift
//  PopCornTime
//
//  Created by MacBook on 28.11.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import UIKit
import Lottie


class LottieViewController: UIViewController {

    private var animationView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView = .init(name: "PopCornTime")
        
        animationView!.frame = view.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.7
        view.addSubview(animationView!)
        animationView!.play()
        

        
        let timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(goPopCorn), userInfo: nil, repeats: false)
      
        // Do any additional setup after loading the view.
    }
    
    @objc func goPopCorn (){
        performSegue(withIdentifier: "goPopCornListVC", sender: nil)
        
    }
    

}
