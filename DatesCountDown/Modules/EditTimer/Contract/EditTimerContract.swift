//
//  EditTimerContract.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import Foundation

protocol EditTimerViewInput: class {}
protocol EditTimerViewOutput {
    func saveTapped(with countdown: CountDown)
}

protocol EditTimerInteractorInput {
    func save(countdown: CountDown)
}
protocol EditTimerInteractorOutput: class {
    func didSaved()
}

protocol EditTimerRouterInput {
    func returnToRoot()
}
