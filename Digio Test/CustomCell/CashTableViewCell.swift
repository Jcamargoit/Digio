//  CashTableViewCell.swift
//  Digio Test

import UIKit

class CashTableViewCell: UITableViewCell {

    private var models = [Cash]()
    public weak var delegate: CollectionTableViewCellDelegate?
    static let identifier = "CashTableViewCell"
    private let collectionView: UICollectionView

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width * 0.98,
                                 height: UIScreen.main.bounds.size.height * 0.125)
        layout.sectionInset = UIEdgeInsets(top: 3,
                                           left: 4,
                                           bottom: 3,
                                           right: 3)
        self.collectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: layout)

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false

        collectionView.register(CashCollectionViewCell.self,
                                forCellWithReuseIdentifier: CashCollectionViewCell.indentifier)

        collectionView.delegate = self
        collectionView.dataSource = self

        contentView.addSubview(collectionView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }

    public func configure (with models: [Cash]) {
        self.models = models
        collectionView.reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CashTableViewCell: UICollectionViewDelegate,
                             UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CashCollectionViewCell.indentifier,
                                                      for: indexPath) as! CashCollectionViewCell
        cell.configure(with: model)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _ = models[indexPath.row]
        collectionView.deselectItem(at: indexPath, animated: true)
        // delegate?.didSelectItem(with: model)
    }
}
