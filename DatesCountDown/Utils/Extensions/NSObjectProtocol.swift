//
//  NSObjectProtocol.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 02/05/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

import Foundation

extension NSObjectProtocol {

    func with(_ closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }

}
