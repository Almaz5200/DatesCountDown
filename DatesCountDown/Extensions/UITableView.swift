//
//  UITableView.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 02/05/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

import UIKit

extension UITableView {
    func update(_ update: (() -> Void)) {
        beginUpdates()
        update()
        endUpdates()
    }
}
