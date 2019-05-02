//
//  CountDownProtocol.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

import Foundation
import RxSwift

struct CountDown {
    var dateEnd: Date
    var countdownTitle: String
    var id: Int

    init(with realm: RealmCountDown) {
        self.dateEnd = realm.dateEnd
        self.countdownTitle = realm.countdownTitle
        self.id = realm.id
    }

    init(dateEnd: Date, countdownTitle: String, id: Int) {
        self.dateEnd = dateEnd
        self.countdownTitle = countdownTitle
        self.id = id
    }
}

extension CountDown: Equatable {
    static func ==(lhs: CountDown, rhs: CountDown) -> Bool {
        return lhs.id == rhs.id
    }
}
