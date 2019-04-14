//
//  RealmCountDown.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

import RealmSwift

class RealmCountDown: Object, CountDown {
    var dateEnd: Date = Date()
    var countdownTitle: String = ""
    // swiftlint:disable identifier_name
    var id: Int = 0
    // swiftlint:enable identifier_name

    override static func primaryKey() -> String? {
        return "id"
    }
}
