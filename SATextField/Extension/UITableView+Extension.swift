//
//  UITableView+Extension.swift
//  SATextField
//
//  Created by Paresh Kanani on 27/06/22.
//

import UIKit

extension UITableView {
    /// Register Cell
    func registerCell(cellId: String) {
        let cellNib = UINib(nibName: cellId, bundle: nil)
        register(cellNib, forCellReuseIdentifier: cellId)
    }
}

extension UICollectionView {
    /// Register Cell
    func registerCell(cellId: String) {
        let cellNib = UINib(nibName: cellId, bundle: nil)
        register(cellNib, forCellWithReuseIdentifier: cellId)
    }
}
