//
//  MainContract.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 20/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import Foundation

protocol MainViewInput: class {
    func showCountdowns(list: [CountDown])
}
protocol MainViewOutput {
    func viewDidInited()
    func addButtonTapped()
    func editTapped(with countdown: CountDown)
    func removeTapped(with countdown: CountDown)
}

protocol MainInteractorInput {
    func fetchCountdowns()
    func remove(countdown: CountDown)
}
protocol MainInteractorOutput: class {
    func fetchedConuntdowns(list: [CountDown])
}

protocol MainRouterInput {
    func showTimerCreation()
    func showTimerEditing(with countdown: CountDown)
}
