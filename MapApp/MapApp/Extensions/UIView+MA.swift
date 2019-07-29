//
//  UIView+MA.swift
//  MapApp
//
//  Created by Bashir Sentongo on 28/07/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

extension UIView {
    
    func ma_addCornerRadius(_ pRadius: CGFloat = -1) {
        let radiusValue = (pRadius == -1) ? self.frame.height / 2 : pRadius
        self.layer.cornerRadius = radiusValue
    }
}
