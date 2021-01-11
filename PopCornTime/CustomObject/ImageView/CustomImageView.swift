//
//  CustomImageView.swift
//  PopCornTime
//
//  Created by MacBook on 22.11.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import UIKit

@IBDesignable // Attributese özellik eklemeye yarıyor
class CustomImageView:UIImageView {
    // Attributese eklenen özelliği orada göstermeye yarıyor.
    @IBInspectable  override var cornerRadius: CGFloat{
        get { return self.layer.cornerRadius}
        set {self.layer.cornerRadius = newValue}
    }
    
    @IBInspectable
    override  var isCircle: Bool{
        get {
            return true
        }
        set {
            self.layer.cornerRadius = self.layer.frame.width / 2
            self.clipsToBounds = true
        }
    }
}

