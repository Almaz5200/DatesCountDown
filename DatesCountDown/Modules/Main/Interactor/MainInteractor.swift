//
//  MainInteractor.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 20/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import RealmSwift

class MainInteractor {
    weak var output: MainInteractorOutput?

    let realm: Realm

    init() {
        do {
            self.realm = try Realm()
        } catch {
            fatalError("Couldn't init realm")
        }
    }
}

extension MainInteractor: MainInteractorInput {
    func fetchCountdowns() {
        let countdowns: [CountDown] = realm.objects(RealmCountDown.self).map { $0 }
        output?.fetchedConuntdowns(list: countdowns)
    }
}
