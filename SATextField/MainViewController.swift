//
//  MainViewController.swift
//  SATextField
//
//  Created by Paresh Kanani on 27/06/22.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let cellData = ["Form", "Swipe View"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "List"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = self.cellData[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        else {
            if let vc = self.storyboard?.instantiateViewController(identifier: "SwipeViewController") as? SwipeViewController {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
