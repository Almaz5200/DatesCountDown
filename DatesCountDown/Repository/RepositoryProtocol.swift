//
//  RepositoryProtocol.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 05/05/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

import UIKit

protocol RepositoryProtocol {

    /**
     Saving already created countdown
     - Author:
     Artem Trubacheev
     - Version:
     1.0
     */
    func save(countdown: CountDown)
    /**
     Create and save new countdown
     - Author:
     Artem Trubacheev
     - Version:
     1.0
     */
    func save(date: Date, name: String)
    func delete(countdown: CountDown)
    func getCountdowns(fetched: @escaping ([CountDown]) -> Void)
}
