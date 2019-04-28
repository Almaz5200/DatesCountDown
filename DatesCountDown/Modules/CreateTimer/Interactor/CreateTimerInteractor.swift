//
//  CreateTimerInteractor.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import RealmSwift

class CreateTimerInteractor {

    weak var output: CreateTimerInteractorOutput?

    let realm: Realm

    init() {
        do {
            self.realm = try Realm()
        } catch {
            fatalError("Couldn't init realm")
        }
    }

}

extension CreateTimerInteractor: CreateTimerInteractorInput {
    func createCountdownWith(name: String, date: Date) {

        let countDown = RealmCountDown()
        countDown.dateEnd = date
        countDown.countdownTitle = name
        countDown.id = realm.objects(RealmCountDown.self)
            .sorted(byKeyPath: "id")
            .last?.id ?? 0

        do {
            try realm.write {
                realm.add(countDown)
            }
        } catch {
            fatalError(error.localizedDescription)
        }

        output?.didCreatedCountdown()
    }
}
