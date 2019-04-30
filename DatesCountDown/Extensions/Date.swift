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

    var rounded: Date {
        var components = NSCalendar.current.dateComponents([.second], from: self)
        let second = components.second ?? 30
        components.second = second >= 30 ? 60 - second : -second
        return Calendar.current.date(byAdding: components, to: self) ?? Date()
    }

}
