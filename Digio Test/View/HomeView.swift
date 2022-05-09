//  HomeView.swift
//  Digio Test
//  Created by Juninho on 09/05/22.

import UIKit

class HomeView: UIView {

    var mainLabel: UILabel = {
       var lbl = UILabel()
        lbl.text = "Digio"
        lbl.textColor = UIColor(red: (255/255), green: (255/255), blue: (255/255), alpha: 1.0)
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
        backgroundColor = UIColor(red: (18/255), green: (40/255), blue: (91/255), alpha: 1.0)
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
