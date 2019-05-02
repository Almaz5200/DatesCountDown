//
//  RealmCountDown.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

import RealmSwift

class RealmCountDown: Object {
    @objc dynamic var dateEnd: Date = Date()
    @objc dynamic var countdownTitle: String = ""
    // swiftlint:disable identifier_name
    @objc dynamic var id: Int = 0
    // swiftlint:enable identifier_name

    override static func primaryKey() -> String? {
        return "id"
    }
}

extension RealmCountDown {
    static func ~>(lhs: inout RealmCountDown, rhs: CountDown) {
        lhs.dateEnd = rhs.dateEnd
        lhs.countdownTitle = rhs.countdownTitle
    }
}
