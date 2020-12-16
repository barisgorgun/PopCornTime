//
//  UIView+Extension.swift
//  PopCornTime
//
//  Created by MacBook on 22.11.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import UIKit

@IBDesignable // Attributese özellik eklemeye yarıyor
extension UIView {
    // Attributese eklenen özelliği orada göstermeye yarıyor.
    @IBInspectable  var cornerRadius: CGFloat{
        get { return self.layer.cornerRadius}
        set {self.layer.cornerRadius = newValue}
    }
}
    
