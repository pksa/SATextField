//
//  SwipeViewController.swift
//  SATextField
//
//  Created by Paresh Kanani on 27/06/22.
//

import UIKit

class SwipeViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var currentTableView: UITableView!
    @IBOutlet weak var pastTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Swipe view"
        self.scrollView.delegate = self
        self.setUpTableView()
    }

    fileprivate func setUpTableView() {
        self.currentTableView.separatorStyle = .none
        self.currentTableView.registerCell(cellId: "OrderTableCell")
        
        self.currentTableView.delegate = self
        self.pastTableView.delegate = self
        self.currentTableView.dataSource = self
        self.pastTableView.dataSource = self
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.scrollView.scrollRectToVisible(CGRect(x: 0, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height), animated: true)
                self.currentTableView.reloadData()
            }
            break
        case 1:
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.scrollView.scrollRectToVisible(CGRect(x: ScreenSize.screenWidth, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height), animated: true)
                self.pastTableView.reloadData()
            }
            break
        default:
            break
        }
    }
}

extension SwipeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.currentTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableCell") as! OrderTableCell
            cell.frame = tableView.bounds
            cell.layoutIfNeeded()
            cell.collectionView.reloadData()
            cell.collectionViewHeight.constant = cell.collectionView.collectionViewLayout.collectionViewContentSize.height
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PastCell")
            cell?.textLabel?.text = "Past \(indexPath.row + 1)"
            return cell ?? UITableViewCell()
        }
    }
}

extension SwipeViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.currentPage == 1 {
            self.segment.selectedSegmentIndex = 0
        }
        else {
            self.segment.selectedSegmentIndex = 1
        }
    }
}


enum ScreenSize {
    static let screenHeight = UIScreen.main.bounds.height
    static let screenWidth  = UIScreen.main.bounds.width
}

extension UIScrollView {
    var currentPage: Int {
        return Int((self.contentOffset.x + (0.5 * self.frame.size.width)) /
        self.frame.width) + 1
    }
}
