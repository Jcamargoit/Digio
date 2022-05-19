//  ProductResultView.swift
//  Digio Test

import UIKit

class ProductResultView: UIView {
    
    var resultImage: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "banner")
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var mainLabel: UITextView = {
        var lbl = UITextView()
        lbl.text = "Testando a descrição do produto, vamos pra cima!!!\n\nJosé Carlos\n\nLivia\n\nIsis"
        lbl.textColor = .white
        lbl.backgroundColor = .clear
        lbl.isEditable = false
        lbl.font = UIFont.systemFont(ofSize: 17)
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
        setupResultImage()
        setupMainLabel()
    }
    
    func setupResultImage() {
        addSubview(resultImage)
        NSLayoutConstraint.activate([
            resultImage.topAnchor.constraint(equalTo: topAnchor),
            resultImage.widthAnchor.constraint(equalTo: widthAnchor),
            resultImage.heightAnchor.constraint(equalToConstant: size.height * 0.35)
        ])
    }
    func setupMainLabel() {
        addSubview(mainLabel)
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: resultImage.bottomAnchor, constant: 10),
            mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainLabel.widthAnchor.constraint(equalTo: widthAnchor),
            mainLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10)
        ])
    }
}
