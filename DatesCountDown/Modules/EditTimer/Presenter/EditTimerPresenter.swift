//
//  EditTimerPresenter.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

class EditTimerPresenter {
    weak var view: EditTimerViewInput?
    var interactor: EditTimerInteractorInput!
    var router: EditTimerRouterInput!
}

extension EditTimerPresenter: EditTimerViewOutput {}

extension EditTimerPresenter: EditTimerInteractorOutput {

}
