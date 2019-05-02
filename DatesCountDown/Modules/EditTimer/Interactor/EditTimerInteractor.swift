//
//  EditTimerInteractor.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import RealmSwift

class EditTimerInteractor {
    weak var output: EditTimerInteractorOutput?

    let realm: Realm

    init() {
        do {
            self.realm = try Realm()
        } catch {
            fatalError("Couldn't init realm")
        }
    }
}

extension EditTimerInteractor: EditTimerInteractorInput {
    func save(countdown: CountDown) {
        guard var countdownToSave = realm.objects(RealmCountDown.self).first(where: { $0.id == countdown.id }) else {
            return
        }
        do {
            try realm.write {
                countdownToSave ~> countdown
            }
            output?.didSaved()
        } catch {
            fatalError("Unable To Write")
        }
    }
}
