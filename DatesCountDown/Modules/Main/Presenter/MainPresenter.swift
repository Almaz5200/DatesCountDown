//
//  MainPresenter.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 20/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

class MainPresenter {
    weak var view: MainViewInput?
    var interactor: MainInteractorInput!
    var router: MainRouterInput!

    init(interactor: MainInteractorInput) {
        self.interactor = interactor
    }
}

extension MainPresenter: MainViewOutput {

    func removeTapped(with countdown: CountDown) {
        interactor.remove(countdown: countdown)
    }

    func addButtonTapped() {
        router.showTimerCreation()
    }

    func editTapped(with countdown: CountDown) {
        router.showTimerEditing(with: countdown)
    }

    func viewDidInited() {
        interactor.fetchCountdowns()
    }

}

extension MainPresenter: MainInteractorOutput {

    func fetchedConuntdowns(list: [CountDown]) {
        view?.showCountdowns(list: list)
    }

}
