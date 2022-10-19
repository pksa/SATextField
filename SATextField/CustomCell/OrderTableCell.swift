//
//  OrderTableCell.swift
//  SATextField
//
//  Created by Paresh Kanani on 27/06/22.
//

import UIKit

class OrderTableCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.setUpCollectionView()
    }

    fileprivate func setUpCollectionView() {
        self.collectionView.registerCell(cellId: "OrderCollectionCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
}

extension OrderTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrderCollectionCell", for: indexPath) as! OrderCollectionCell
        cell.lineView.backgroundColor = indexPath.row == 1 ? UIColor.clear : UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.collectionView.frame.width)
        let height = 82.0
            return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
