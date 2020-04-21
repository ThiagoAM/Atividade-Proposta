//
//  EditEmployeeViewController.swift
//  Atividade-Proposta
//
//  Created by Thiago Martins on 18/04/20.
//  Copyright © 2020 Thiago Anderson Martins. All rights reserved.
//

import UIKit

class EditEmployeeViewController : UIViewController, EditEmployeeVCDelegate, Storyboarded {
            
    // Public Properties:
    // - Computed (Getters & Setters):
    public var nameTextFieldText : String? {
        get { return nameTextField.text }
        set { nameTextField.text = newValue }
    }
    
    public var salaryTextFieldText : String? {
        get { return salaryTextField.text }
        set { salaryTextField.text = newValue }
    }
    
    // - External References:
    public weak var employeeListVCPresenter : EmployeeListVCPresenter?
    // - IB References:
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var salaryTextField: UITextField!
            
    // Private Properties:
    // - Presenter:
    private var presenter = EditEmployeeVCPresenter()
    // - External References:
    private weak var coordinator : MainCoordinator?
    
    // Overridden Methods:
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initial display data:
        ageLabel.text = "\(presenter.employee.age) anos"
        nameTextField.text = presenter.employee.name
        salaryTextField.text = FormattingHelper().formatToBRL(value: presenter.employee.salary)
        // Navigation Bar:
        updateNavigationBarTitle(presenter.employee.name)
        navigationItem.largeTitleDisplayMode = .never
        // Textfields setup:
        nameTextField.delegate = self
        salaryTextField.delegate = self
        setupSalaryTextFieldAppearance()
        // Keyboard/Scrollview ajustment setup:
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // Public Methods:
    public func initialize(coordinator : MainCoordinator, employee : Employee, employeeListVCPresenter : EmployeeListVCPresenter) {
        self.coordinator = coordinator
        self.employeeListVCPresenter = employeeListVCPresenter
        presenter.initialize(delegate: self, employee: employee)
    }
    
    // - EditEmployeeVCDelegate:
    public func showOkAlert(title: String?, message: String?, completion : (() -> Void)?) {
        self.presentOkAlert(title: title, message: message, completion: completion)
    }
        
    public func updateNavigationBarTitle(_ title : String) {
        self.title = presenter.employee.name
    }
    
    // Private Methods:
    private func setupSalaryTextFieldAppearance() {
        let label = UILabel()
        label.text = " R$"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        salaryTextField.leftViewMode = .always
        salaryTextField.leftView = label
    }
    
    // - Keyboard/Scrollview adjustment methods:
    //   These methods are responsible for the auto-scrolling that should happen when the user taps a UITextField (so that the UITextField doesn't become hidden by the keyboard).
    @objc private func keyboardWillShow(notification : NSNotification) {
        let userInfo = notification.userInfo!
        var keyboardFrame : CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        var contentInset : UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scrollView.contentInset = contentInset
    }

    @objc private func keyboardWillHide() {
        let contentInset : UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
                                    
}

// UITextFieldDelegate Extension:
extension EditEmployeeViewController : UITextFieldDelegate {
            
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField == nameTextField ?
            presenter.validateAndSetName(nameTextField.text) :
            presenter.validateAndSetSalary(salaryTextField.text)
    }
                            
}
