//
//  CreateTimerInteractor.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import UIKit

class CreateTimerInteractor {

    weak var output: CreateTimerInteractorOutput?

    let repository: RepositoryProtocol

    init(repository: RepositoryProtocol) {
        self.repository = repository
    }

}

extension CreateTimerInteractor: CreateTimerInteractorInput {
    func createCountdownWith(name: String, date: Date) {

        repository.save(date: date, name: name)
        output?.didCreatedCountdown()
    }
}
