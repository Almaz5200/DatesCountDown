//
//  CreateTimerContract.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import Foundation

protocol CreateTimerViewInput: class {}
protocol CreateTimerViewOutput {
    func createButtonTappedWith(name: String, date: Date)
}

protocol CreateTimerInteractorInput {
    func createCountdownWith(name: String, date: Date)
}
protocol CreateTimerInteractorOutput: class {
    func didCreatedCountdown()
}

protocol CreateTimerRouterInput {
    func popBack()
}
