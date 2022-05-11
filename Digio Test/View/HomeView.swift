//  HomeView.swift
//  Digio Test
//  Created by Juninho on 09/05/22.

import UIKit

class HomeView: UIView {

    //    var mainLabel: UILabel = {
    //        var lbl = UILabel()
    //        lbl.text = "Digio"
    //        lbl.textColor = .white
    //        lbl.font = UIFont.systemFont(ofSize: 16)
    //        lbl.translatesAutoresizingMaskIntoConstraints = false
    //        return lbl
    //    }()

    // MARK: - Constants
    private let storeProductsTableViewCellName = "StoreProductsTableViewCell"
    private let storeBannerTableViewCellName = "StoreBannerTableViewCell"
    private let storeFilterTableViewCellName = "StoreFilterTableViewCell"

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.sectionHeaderHeight = UITableView.automaticDimension
//      tableView.estimatedSectionHeaderHeight = 64.0
//      tableView.register(StoreProductsTableViewCell.self, forCellReuseIdentifier: storeProductsTableViewCellName)
//      tableView.register(StoreBannerTableViewCell.self, forCellReuseIdentifier: storeBannerTableViewCellName)
    //  tableView.register(StoreFilterTableViewCell.self, forCellReuseIdentifier: storeFilterTableViewCellName)
//      tableView.delegate = self
//      tableView.dataSource = self
//      tableView.refreshControl = refreshTableView

        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubviews()
    }

    func createSubviews() {
        backgroundColor = .primaryColor
        // setupMainLabel()
        setupTableView()
    }

    //    func setupMainLabel() {
    //        addSubview(mainLabel)
    //        NSLayoutConstraint.activate([
    //            mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
    //            mainLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
    //            mainLabel.heightAnchor.constraint(equalToConstant: 150),
    //            mainLabel.widthAnchor.constraint(equalToConstant: 150)
    //        ])
    //    }

    func setupTableView() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: centerYAnchor),
            tableView.heightAnchor.constraint(equalTo: heightAnchor),
            tableView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
}
