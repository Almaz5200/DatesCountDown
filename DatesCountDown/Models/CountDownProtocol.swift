//
//  CountDownProtocol.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

import Foundation
import RxSwift

protocol CountDown {
    var dateEnd: Date { get set }
    var countdownTitle: String { get set }
}
