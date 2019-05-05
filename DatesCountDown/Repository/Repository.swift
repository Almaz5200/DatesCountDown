//
//  Repository.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 05/05/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

import RealmSwift
import RxSwift

class Repository: RepositoryProtocol {

    let realm: Realm
    let disposeBag = DisposeBag()

    init() {
        realm = try!Realm()
    }

    func save(countdown: CountDown) {
        let objectsList = realm.objects(RealmCountDown.self)
        if var existingObject = objectsList.first(where: { $0.id == countdown.id }) {
            try! realm.write {
                existingObject ~> countdown
            }
        } else {
            try! realm.write {
                realm.add(countdown.asRealm)
            }
        }
    }
    
    func getCountdowns(fetched: @escaping ([CountDown]) -> Void) {
        let objectsList = realm.objects(RealmCountDown.self)
        Observable.array(from: objectsList)
            .map { $0.map { CountDown(with: $0) } }
            .subscribe(onNext: {
                fetched($0)
            })
            .disposed(by: disposeBag)
    }
    
}
