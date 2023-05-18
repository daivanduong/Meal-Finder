//
//  Checkbox.swift
//  Meal Finder
//
//  Created by Ocean97 on 18/05/2023.
//

import UIKit

class Checkbox: UIButton {

    // set images
       let checkedImage = UIImage(named: "checkbox")! as UIImage
       let uncheckedImage = UIImage(named: "uncheckbox")! as UIImage

       var isChecked: Bool = false {
           didSet{
               if isChecked == true {
                   self.setImage(checkedImage, for: .normal)
               } else {
                   self.setImage(uncheckedImage, for: .normal)
               }
           }
       }

       override func awakeFromNib() {
           self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
           self.isChecked = false
       }

      @objc func buttonClicked(sender: UIButton) {
           if sender == self {
               isChecked = !isChecked
           }
       }

}
