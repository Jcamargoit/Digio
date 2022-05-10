//  HomeView.swift
//  Digio Test
//  Created by Juninho on 09/05/22.

import UIKit

class HomeView: UIView {

    var mainLabel: UILabel = {
       var lbl = UILabel()
        lbl.text = "Digio"
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
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
        setupMainLabel()

    }

    func setupMainLabel() {
        addSubview(mainLabel)
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainLabel.heightAnchor.constraint(equalToConstant: 150),
            mainLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
