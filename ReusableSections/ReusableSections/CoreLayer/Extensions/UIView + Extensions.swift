//
//  UIView + Extensions.swift
//  ReusableSections
//
//  Created by Agatay Embeev on 15.02.2023.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
