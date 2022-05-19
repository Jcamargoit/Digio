//  ProductsTableViewCell.swift
//  Digio Test

import UIKit

class ProductsTableViewCell: UITableViewCell {

    public weak var delegate: CollectionTableViewCellDelegate?
    private var models = [Product]()
    static let identifier = "ProductsTableViewCell"
    private let collectionView: UICollectionView

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 105)
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 20,
                                           bottom: 0,
                                           right: 3)
        self.collectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: layout)
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ProductsCollectionViewCell.self,
                                forCellWithReuseIdentifier: ProductsCollectionViewCell.indentifier)
        collectionView.delegate = self
        collectionView.dataSource = self

        contentView.addSubview(collectionView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }

    public func configure (with models: [Product]) {
        self.models = models
        collectionView.reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductsTableViewCell: UICollectionViewDelegate,
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.indentifier,
                                                      for: indexPath) as! ProductsCollectionViewCell
        cell.configure(with: model)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _ = models[indexPath.row]
        collectionView.deselectItem(at: indexPath, animated: true)
        //  delegate?.didSelectItem(with: model)
    }
}
