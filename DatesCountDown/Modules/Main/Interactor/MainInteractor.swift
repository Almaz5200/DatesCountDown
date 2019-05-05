//
//  MainInteractor.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 20/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import RxSwift

class MainInteractor {

    weak var output: MainInteractorOutput?

    private let repository: RepositoryProtocol
    private let disposeBag = DisposeBag()

    init(repository: RepositoryProtocol) {
        self.repository = repository
    }

}

extension MainInteractor: MainInteractorInput {
    func remove(countdown: CountDown) {
        repository.delete(countdown: countdown)
    }

    func fetchCountdowns() {
        repository.getCountdowns { [ unowned self ] in
            self.output?.fetchedConuntdowns(list: $0)
        }
    }
}
