//  SpotlighCollectionViewCell.swift
//  Digio Test

import UIKit
import SDWebImage

class SpotlighCollectionViewCell: UICollectionViewCell {

    static let indentifier = "SpotlighCollectionViewCell"
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.shadowOpacity = 0.6
        imageView.layer.shadowColor = UIColor.gray.cgColor
        imageView.layer.shadowOffset = CGSize.init(width: UIScreen.main.bounds.size.width * 0.9,
                                                   height: UIScreen.main.bounds.size.height * 0.2)
        imageView.layer.cornerRadius = 10.5
        imageView.layer.masksToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myImageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        myImageView.frame = CGRect(x: 0,
                                   y: 0,
                                   width: contentView.frame.size.width-0,
                                   height: contentView.frame.size.height-0-0)
    }

    public func configure(with model: Spotlight) {
        let url = NSURL(string: model.bannerURL)
        myImageView.sd_setImage(with: url! as URL)
    }
}
