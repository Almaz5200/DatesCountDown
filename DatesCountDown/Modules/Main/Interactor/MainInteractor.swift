//
//  MainInteractor.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 20/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import RealmSwift
import RxRealm
import RxSwift

class MainInteractor {

    weak var output: MainInteractorOutput?

    private let realm: Realm
    private let disposeBag = DisposeBag()

    init() {
        do {
            self.realm = try Realm()
        } catch {
            fatalError("Couldn't init realm")
        }
        //startObservingChanges()
    }

    private func startObservingChanges() {
        realm.autorefresh = true
        realm.objects(RealmCountDown.self).observe { _ in
            self.fetchCountdowns()
        }.invalidate()
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
        let countdowns = realm.objects(RealmCountDown.self)
        Observable.collection(from: countdowns)
            .map { $0.map { CountDown(with: $0) }
                .sorted(by: { $0.id < $1.id })
            }
            .subscribe (onNext: {
                self.output?.fetchedConuntdowns(list: $0)
            })
            .disposed(by: disposeBag)
    }
}
