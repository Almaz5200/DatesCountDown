//
//  UIView.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 02/05/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

import UIKit

extension UIView {

    func addSubviews(_ views: [UIView]) {
        views.forEach { (view) in
            addSubview(view)
        }
    }

}
