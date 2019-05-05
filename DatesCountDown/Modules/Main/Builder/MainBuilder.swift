//
//  MainBuilder.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 20/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import Foundation
import UIKit

class MainBuilder {
    static func build() -> MainViewController {
        guard let repository = try? DIContainer.instance.resolve() as RepositoryProtocol else {
            fatalError("Check DI dependencies")
        }

		let router = MainRouter()

        let interactor = MainInteractor(repository: repository)
        let presenter = MainPresenter(interactor: interactor)
        let viewController = MainViewController(output: presenter)

        presenter.view = viewController
        presenter.router = router
        interactor.output = presenter

        router.viewController = viewController

		return viewController
     }

}
