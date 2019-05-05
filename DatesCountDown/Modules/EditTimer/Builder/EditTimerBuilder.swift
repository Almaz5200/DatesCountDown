//
//  EditTimerBuilder.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import Foundation
import UIKit

class EditTimerBuilder {
    static func build(with countdown: CountDown) -> EditTimerViewController {
        let dip = DIContainer.instance
        guard let repository = try? dip.resolve() as RepositoryProtocol else {
            fatalError("Check DI dependencies")
        }

        let viewController = EditTimerViewController(countdown: countdown)

		let router = EditTimerRouter()

        let presenter = EditTimerPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = EditTimerInteractor(repository: repository)
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        router.viewController = viewController

		return viewController
     }
}
