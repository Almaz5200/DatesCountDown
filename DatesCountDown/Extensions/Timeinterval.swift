//
//  Timeinterval.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 30/04/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

import UIKit

extension TimeInterval {
    func format(using units: NSCalendar.Unit) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = units
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .pad

        return formatter.string(from: self) ?? ""
    }
}
