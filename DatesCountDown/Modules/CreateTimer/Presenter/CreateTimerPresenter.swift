//
//  CreateTimerPresenter.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

class CreateTimerPresenter {
    weak var view: CreateTimerViewInput?
    var interactor: CreateTimerInteractorInput!
    var router: CreateTimerRouterInput!
}

extension CreateTimerPresenter: CreateTimerViewOutput {

}

extension CreateTimerPresenter: CreateTimerInteractorOutput {

}
