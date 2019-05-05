//
//  Repository.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 05/05/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

import RealmSwift
import RxRealm
import RxSwift

class Repository: RepositoryProtocol {

    let realm: Realm
    let disposeBag = DisposeBag()

    init() {
        realm = try!Realm()
    }

    func save(countdown: CountDown) {
        let objectsList = realm.objects(RealmCountDown.self)
        guard var existingObject = objectsList.first(where: { $0.id == countdown.id }) else {
            return
        }
        try! realm.write {
            existingObject ~> countdown
        }
    }

    func save(date: Date, name: String) {
        let objectsList = realm.objects(RealmCountDown.self)
        
        let object = RealmCountDown()
        object.dateEnd = date
        object.countdownTitle = name
        object.id = (objectsList.sorted(byKeyPath: "id").last?.id ?? -1) + 1

        try! realm.write {
            realm.add(object)
        }

    }

    func delete(countdown: CountDown) {
        guard let object = realm.objects(RealmCountDown.self).first(where: { $0.id == countdown.id }) else {
            return
        }
        try! realm.write {
            realm.delete(object)
        }
    }
    
    func getCountdowns(fetched: @escaping ([CountDown]) -> Void) {
        let objectsList = realm.objects(RealmCountDown.self)
        Observable.collection(from: objectsList)
            .map { $0.map { CountDown(with: $0) } }
            .subscribe(onNext: {
                fetched($0)
            })
            .disposed(by: disposeBag)
    }
    
}
