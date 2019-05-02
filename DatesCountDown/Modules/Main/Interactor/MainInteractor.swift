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
    func remove(countdown: CountDown) {
        guard let object = realm.objects(RealmCountDown.self).first(where: { $0.id == countdown.id }) else {
            return
        }
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            fatalError("unable to write")
        }
    }

    func fetchCountdowns() {
        let countdowns: [CountDown] = realm.objects(RealmCountDown.self)
            .map { CountDown(with: $0) }
            .sorted(by: { $0.id < $1.id })
        output?.fetchedConuntdowns(list: countdowns)
    }
}
