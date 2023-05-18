//
//  TableViewCell.swift
//  Meal Finder
//
//  Created by Ocean97 on 11/05/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

   
    @IBOutlet weak var view_table: UIView!
    @IBOutlet weak var img_meal: UIImageView!
    
    @IBOutlet weak var name_meal: UILabel!
    
    @IBOutlet weak var category: UILabel!
    
    @IBOutlet weak var area: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        view_table.layer.cornerRadius = 10
        img_meal.layer.cornerRadius = 5
        
    }
    
}
