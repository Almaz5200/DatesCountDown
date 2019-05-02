//
//  MainViewController.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 20/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class MainViewController: UIViewController {

    var output: MainViewOutput!
    private var disposeBag = DisposeBag()

    // MARK: Properties
    var countdowns: [CountDown] = []

    @IBOutlet weak var tableView: UITableView!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewDidInited()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = nil
        tableView.allowsSelection = false

        setupViews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: Private methods
    private func setupViews() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)

        addButton.rx.tap
            .subscribe { _ in
                self.output.addButtonTapped()
            }
            .disposed(by: disposeBag)

        navigationItem.setRightBarButton(addButton, animated: true)
    }

}

extension MainViewController: MainViewInput {
    func showCountdowns(list: [CountDown]) {
        countdowns = list
        tableView.reloadData()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countdowns.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.mainCell,
                                                       for: indexPath) else {
            fatalError("Couldn't init cell")
        }

        cell.setup(with: countdowns[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, index in
            self.output.removeTapped(with: self.countdowns[index.row])
            tableView.update {
                tableView.deleteRows(at: [index], with: .right)
                self.countdowns.remove(at: index.row)
            }
        }
        return [deleteAction]
    }
}
