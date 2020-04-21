//
//  EmployeeListViewController.swift
//  Atividade-Proposta
//
//  Created by Thiago Martins on 18/04/20.
//  Copyright © 2020 Thiago Anderson Martins. All rights reserved.
//

import UIKit

class EmployeeListViewController : UIViewController, EmployeeListVCDelegate, Storyboarded {
    
    // Public Properties:
    // - Computed (Getters):
    // -- EmployeeListVCDelegate:
    public var coordinator : MainCoordinator? { return _coordinator }
    
    // Private Properties:    
    // - Presenter:
    private var presenter = EmployeeListVCPresenter()
    // - IB References:
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // - External References:
    private weak var _coordinator : MainCoordinator?
    
    // Overridden Methods:
    override func viewDidLoad() {        
        super.viewDidLoad()
        // Setups the presenter:
        presenter.initialize(delegate: self)
        // Title:
        self.title = "Funcionários"
        coordinator?.navigationController.navigationBar.prefersLargeTitles = true
        // Setups the tableView:
        tableView.delegate = self
        tableView.dataSource = self
        registerTableViewCells()        
    }
    
    // Public Methods:
    public func initialize(coordinator : MainCoordinator) {
        self._coordinator = coordinator
    }
    
    // - EmployeeListVCDelegate Methods:
    func reloadTableViewData() {
        self.tableView.reloadData()
    }
    
    func showActivityIndicator() {
        self.activityIndicator.isHidden = false
    }
    
    func hideActivityIndicator() {
        self.activityIndicator.isHidden = true
    }
                    
}

// Extensions:
// - UITableViewDelegate & UITableViewDataSource:
extension EmployeeListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let employee = presenter.employees[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell") as? EmployeeTableViewCell {
            cell.setEmployee(employee: employee)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        presenter.employeeTapped(presenter.employees[indexPath.row], index: indexPath.row)
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Private Methods:
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "EmployeeTableViewCell", bundle: nil)
        self.tableView.register(textFieldCell, forCellReuseIdentifier: "EmployeeTableViewCell")
    }
                
}

