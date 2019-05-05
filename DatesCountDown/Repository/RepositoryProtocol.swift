//
//  RepositoryProtocol.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 05/05/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

protocol RepositoryProtocol {
    func save(countdown: CountDown)
    func getCountdowns(fetched: @escaping ([CountDown]) -> Void)
}
