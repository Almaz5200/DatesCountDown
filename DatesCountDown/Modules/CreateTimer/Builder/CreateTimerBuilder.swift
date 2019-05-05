//
//  CreateTimerBuilder.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import Foundation
import UIKit

class CreateTimerBuilder {

    static func build() -> CreateTimerViewController {
        let dip = DIContainer.instance
        guard let repository = try? dip.resolve() as RepositoryProtocol else {
            fatalError("Check DI dependencies")
        }

        let viewController = CreateTimerViewController()

		let router = CreateTimerRouter()

        let presenter = CreateTimerPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CreateTimerInteractor(repository: repository)
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        router.viewController = viewController

		return viewController
     }

}
