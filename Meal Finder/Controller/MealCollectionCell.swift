//
//  MealCollectionCell.swift
//  Meal Finder
//
//  Created by Dương Đại on 29/03/2023.
//

import UIKit

class MealCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var viewCollec: UIView!
    
    
    @IBOutlet weak var imgMeal: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgMeal.layer.borderColor = UIColor.white.cgColor
        imgMeal.layer.borderWidth = 1
        imgMeal.layer.cornerRadius = 5

        
    }
    
    

}
