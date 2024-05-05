//
//  UniversityListTableViewCell.swift
//  UniversitiesApp
//
//  Created by Abanoub Nabil on 05/05/2024.
//

import UIKit

class UniversityListTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var stateLabel: UILabel!
    
    //MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    //MARK: - ConfigureCell
    func configureCell(model: UniversityUIModel?) {
        guard let model = model else {return}
        nameLabel.text = model.name
        stateLabel.text = model.state
    }
    
}
