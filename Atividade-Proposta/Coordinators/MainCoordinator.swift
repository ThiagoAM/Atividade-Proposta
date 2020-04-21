//
//  MainCoordinator.swift
//  Atividade-Proposta
//
//  Created by Thiago Martins on 18/04/20.
//  Copyright © 2020 Thiago Anderson Martins. All rights reserved.
//

import UIKit

class MainCoordinator : Coordinator {
    
    // Properties:
    // - Coordinator Protocol:
    var navigationController: UINavigationController
    
    // Initialization:
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
        
    // Coordinator Protocol Methods:
    func start() {
        let employeeListVC = EmployeeListViewController.instantiate()
        employeeListVC.initialize(coordinator: self)
        navigationController.pushViewController(employeeListVC, animated: false)
    }
    
    // Public Methods:
    // - Navigation Methods:
    public func presentEditEmployeeVC(employee : Employee, employeeListVCPresenter : EmployeeListVCPresenter) {
        let editEmployeeVC = EditEmployeeViewController.instantiate()
        editEmployeeVC.initialize(coordinator: self, employee: employee, employeeListVCPresenter: employeeListVCPresenter)
        navigationController.pushViewController(editEmployeeVC, animated: true)
    }
                
}
