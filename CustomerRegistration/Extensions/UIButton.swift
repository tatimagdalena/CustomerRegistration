//
//  UIButton.swift
//  DataValitation-MVP
//
//  Created by Tatiana Magdalena on 05/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import UIKit

extension UIButton {
    open override var isEnabled: Bool {
        didSet {
            if isEnabled {
                alpha = 1.0
            }
            else {
                alpha = 0.5
            }
        }
    }
}
