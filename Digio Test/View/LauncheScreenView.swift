//  LauncheScreenView.swift
//  Digio Test

import UIKit

class LaunheScreenView: UIView {
    
    var logoIcon: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "logo")
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
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
        setupIconImage()
    }
    
    func setupIconImage() {
        addSubview(logoIcon)
        NSLayoutConstraint.activate([
            logoIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoIcon.heightAnchor.constraint(equalToConstant: 150),
            logoIcon.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
