//
//  Date.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 28/04/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

import UIKit

extension Date {
    var toHooman: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium

        return formatter.string(from: self)
    }
}
