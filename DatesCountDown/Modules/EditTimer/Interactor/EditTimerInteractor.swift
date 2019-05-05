//
//  EditTimerInteractor.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

class EditTimerInteractor {
    weak var output: EditTimerInteractorOutput?

    let repository: RepositoryProtocol

    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
}

extension EditTimerInteractor: EditTimerInteractorInput {
    func save(countdown: CountDown) {
        repository.save(countdown: countdown)
        output?.didSaved()
    }
}
