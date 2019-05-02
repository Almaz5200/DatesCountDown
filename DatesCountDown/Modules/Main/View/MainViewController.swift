//
//  MainViewController.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 20/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import PinLayout
import RxCocoa
import RxSwift
import UIKit

class MainViewController: BaseViewController {

    var output: MainViewOutput!
    private var disposeBag = DisposeBag()

    // MARK: Properties
    var countdowns: [CountDown] = []

    let tableView = UITableView()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewDidInited()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = nil
        tableView.allowsSelection = false

        addSubviews()
        setupViews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layout()
    }

    // MARK: Private methods
    private func addSubviews() {
        view.addSubviews([tableView])
    }

    private func layout() {
        tableView.pin
            .top(view.pin.safeArea.top)
            .left()
            .right()
            .bottom()
    }

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
        let cell = tableView.cell(at: indexPath, for: MainCell.self)

        cell.setup(with: countdowns[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let countdown = countdowns[indexPath.row]

        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, _ in
            self.output.removeTapped(with: countdown)
            tableView.update {
                tableView.deleteRows(at: [indexPath], with: .right)
                self.countdowns.remove(at: indexPath.row)
            }
        }
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { _, _ in
            self.output.editTapped(with: countdown)
        }
        return [deleteAction, editAction]
    }
}
