//
//  InggredientCell.swift
//  Meal Finder
//
//  Created by Ocean97 on 16/05/2023.
//

import UIKit

class InggredientCell: UITableViewCell {

    
    @IBOutlet weak var ingredientLB: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        ingredientLB.layer.cornerRadius = 3
    }
    
}
