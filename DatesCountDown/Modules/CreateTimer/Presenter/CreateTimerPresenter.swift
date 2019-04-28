//
//  CreateTimerPresenter.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import UIKit

class CreateTimerPresenter {
    weak var view: CreateTimerViewInput?
    var interactor: CreateTimerInteractorInput!
    var router: CreateTimerRouterInput!
}

extension CreateTimerPresenter: CreateTimerViewOutput {

    func createButtonTappedWith(name: String, date: Date) {
        interactor.createCountdownWith(name: name, date: date)
    }

}

extension CreateTimerPresenter: CreateTimerInteractorOutput {

    func didCreatedCountdown() {
        router.popBack()
    }

}
