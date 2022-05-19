//  SpotlightCollectionAndTableViewCellModel.swift
//  Digio Test

import UIKit

enum CellModel {
    case collectionView(models: [Spotlight], rows: Int)
    case collectionViewCash(models: [Cash], rows: Int)
    case collectionViewProducts(models: [Product], rows: Int)
}
