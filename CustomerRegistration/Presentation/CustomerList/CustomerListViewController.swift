//
//  CustomerListViewController.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 08/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import UIKit

class CustomerListViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet var tableView: UITableView!
    @IBOutlet var emptyMessageLabel: UILabel!
    @IBOutlet var addButton: UIButton!
    // MARK: Properties
    private var viewModel: CustomerListViewModel!
    private var dataModel = [CustomerOutput]()
    
}

// MARK: - Lifecycle -

extension CustomerListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        handleEmptyTable()
        viewModel = CustomerListViewModel(contactsDataSource: DataBaseContacts(),
                                          customerFormatter: CustomerFormatter())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        requestData()
    }
    
}

// MARK: - Data -

extension CustomerListViewController {
    
    private func requestData() {
        let result = viewModel.getCustomers()
        switch result {
        case .empty:
            dataModel = [CustomerOutput]()
            handleEmptyTable()
        case .withValue(let customers):
            dataModel = customers
            handlePopulatedTable()
        }
    }
    
    private func handleEmptyTable() {
        tableView.isHidden = true
        emptyMessageLabel.isHidden = false
        tableView.reloadData()
    }
    
    private func handlePopulatedTable() {
        tableView.isHidden = false
        emptyMessageLabel.isHidden = true
        tableView.reloadData()
    }
    
}

// MARK: - Table view data source -

extension CustomerListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomerCell.identifier, for: indexPath) as? CustomerCell
            else { fatalError("Cell does not exist in storyboard") }
        
        cell.captionLabel.text = dataModel[indexPath.row].companyInitials
        cell.companyLabel.text = dataModel[indexPath.row].company
        cell.ownerLabel.text = dataModel[indexPath.row].owner
        
        return cell
    }
    
}

// MARK: - Table view delegate -

extension CustomerListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = dataModel[indexPath.row].customerId
        if !id.isEmpty {
            goToDetails(with: id)
        }
    }
}

// MARK: - Navigation -

extension CustomerListViewController {
    
    func goToDetails(with customerId: String) {
        guard let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomerDetailsViewController") as? CustomerDetailsViewController
            else { fatalError("Cell does not exist in storyboard") }
        
        detailsVC.customerId = customerId
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}
