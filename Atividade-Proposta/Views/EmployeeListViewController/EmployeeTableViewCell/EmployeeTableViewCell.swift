//
//  EmployeeTableViewCell.swift
//  Atividade-Proposta
//
//  Created by Thiago Martins on 18/04/20.
//  Copyright © 2020 Thiago Anderson Martins. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    // IB Properties:
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
        
    // Overridden Methods:    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)        
    }
    
    // Public Methods:
    public func setEmployee(employee : Employee) {
        nameLabel.text = employee.name
        ageLabel.text = "\(employee.age) anos"
//        salaryLabel.text = "R$ \(employee.salary)"
        salaryLabel.text = FormattingHelper().formatToBRL(value: employee.salary, hasPrefix: true)
    }
    
}
