//
//  DependencyContainer.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 05/05/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

import Dip

// MARK: - Container for Dependency Injection
class DIContainer {
    static let instance = DependencyContainer()

    private init() {}

    static func configure() {
        let dip = DIContainer.instance

        // MARK: - Authorization
        dip.register() {
            Repository() as RepositoryProtocol
        }
    }
}
