//
//  CustomerDetailsViewController.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 27/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import UIKit

class CustomerDetailsViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet var tableView: UITableView!
    @IBOutlet var removeButton: UIButton!
    @IBAction func removeCustomer(_ sender: UIButton) {
        handleCustomerRemoval()
    }
    
    // MARK: Properties
    private var viewModel: CustomerDetailsViewModel!
    private var detailsOutput = DetailsOutput()
    var customerId = ""
}

// MARK: - Lifecycle -

extension CustomerDetailsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        
        viewModel = CustomerDetailsViewModel(headlinesDetailsDataSource: InMemoryDetailsHeadlines(),
                                             customerDataSource: DataBaseContacts(),
                                             customerId: customerId,
                                             customerFormatter: CustomerFormatter())
        requestData()
    }

}

// MARK: - Data -

private extension CustomerDetailsViewController {
    
    func requestData() {
        let result = viewModel.getDetails()
        switch result {
        case .empty:
        // TODO: handle error
            navigationController?.popViewController(animated: true)
        case .withValue(let details):
            detailsOutput = details
            tableView.reloadData()
        }
    }
    
    func handleCustomerRemoval() {
        let success = viewModel.deleteCustomer(with: customerId)
        
        if success.booleanValue {
            showAlert(title: "Sucesso", message: "Cliente excluído com sucesso", action: { [weak self] (action) in
                self?.navigationController?.popViewController(animated: true)
            })
        }
        else {
            showAlert(title: "Ocorreu um erro", message: "Não foi possível concluir a exclusão do cliente. Tente novamente", action: nil)
        }
    }
    
}

// MARK: - Alert -

extension CustomerDetailsViewController {
    
    func showAlert(title: String, message: String, action: ((UIAlertAction)->())?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Concluir", style: .default, handler: action)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}

// MARK: - Tableview datasource -

extension CustomerDetailsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailsCell.identifier, for: indexPath) as? DetailsCell else { fatalError("Cell does note exist in storyboard") }
        
        cell.titleLabel.text = detailsOutput.information[indexPath.row].title
        cell.valueLabel.text = detailsOutput.information[indexPath.row].value
        
        return cell
    }

}

// MARK: - Tableview delegate -

extension CustomerDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

