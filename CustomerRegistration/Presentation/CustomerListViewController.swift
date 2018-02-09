//
//  CustomerListViewController.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 08/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import UIKit

class CustomerListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var emptyMessageLabel: UILabel!
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleEmptyTable()
    }

    func handleEmptyTable() {
        tableView.isHidden = true
        emptyMessageLabel.isHidden = false
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
