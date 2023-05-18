//
//  DetailVC.swift
//  Meal Finder
//
//  Created by Dương Đại on 29/03/2023.
//

import UIKit
import SDWebImage


class DetailVC: UIViewController {
    
    var meal_detail: Meal_Data?
    
    @IBOutlet weak var imgDetail: UIImageView!
    
    @IBOutlet weak var lbInstructions: UILabel!
    
    @IBOutlet weak var ingredientView: UIView!
    
    @IBOutlet weak var ingSc: UIScrollView!
    
    @IBOutlet weak var btVideo: UIButton!

    var ingredientArr = [Ingredient]()
    
    @IBOutlet weak var ingredientArrTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        
        //ingredientView.layer.cornerRadius = 5
        ingSc.layer.cornerRadius = 8
        let data = meal_detail!
        
        navigationItem.title = data.strMeal

        let check_unique = arrayMealFavorite.contains(where: { MealFavorite in
            MealFavorite.strMeal == meal_detail?.strMeal
        })
        
        if check_unique == false {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "favorite"), style: .plain, target: self, action: #selector(addMealFavoriteToArr))
        }
        
        if let url = URL(string: "\(data.strMealThumb)"){
            imgDetail.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
        }
        
        imgDetail.layer.cornerRadius = 15

        
        let nib = UINib(nibName: "InggredientCell", bundle: nil)
        ingredientArrTable.register(nib, forCellReuseIdentifier: "inggredientCell")
        
        ingredientArrTable.delegate = self
        ingredientArrTable.dataSource = self
        
        ingredientArrTable.layer.cornerRadius = 5
//        ingredientArrTable.separatorStyle = .none
//        ingredientArrTable.showsVerticalScrollIndicator = false
        ingredientArrTable.layer.borderWidth = 1
        ingredientArrTable.layer.borderColor = UIColor.gray.cgColor
        
        if data.strI1.isBlank{
           
            let ingredient1 = Ingredient(strIngredient: data.strI1, strMeasure: data.strM1)
            ingredientArr.append(ingredient1)
        }
        if data.strI2.isBlank == false {
            
            let ingredient2 = Ingredient(strIngredient: data.strI2, strMeasure: data.strM2)
            ingredientArr.append(ingredient2)
            
        }
        if data.strI3.isBlank == false {
            
            let ingredient3 = Ingredient(strIngredient: data.strI3, strMeasure: data.strM3)
            ingredientArr.append(ingredient3)
            
        }
        if data.strI4.isBlank == false {
            
            let ingredient4 = Ingredient(strIngredient: data.strI4, strMeasure: data.strM4)
            ingredientArr.append(ingredient4)
            
        }
        if data.strI5.isBlank == false {
           
            let ingredient5 = Ingredient(strIngredient: data.strI5, strMeasure: data.strM5)
            ingredientArr.append(ingredient5)
            
        }
        if data.strI6.isBlank == false {
            
            let ingredient6 = Ingredient(strIngredient: data.strI6, strMeasure: data.strM6)
            ingredientArr.append(ingredient6)
        }
        if data.strI7.isBlank == false {
            
            let ingredient7 = Ingredient(strIngredient: data.strI7, strMeasure: data.strM7)
            ingredientArr.append(ingredient7)
        }
        if data.strI8.isBlank == false {
            
            let ingredient8 = Ingredient(strIngredient: data.strI8, strMeasure: data.strM8)
            ingredientArr.append(ingredient8)
        }
        if data.strI9.isBlank == false {
            
            let ingredient9 = Ingredient(strIngredient: data.strI9, strMeasure: data.strM9)
            ingredientArr.append(ingredient9)
        }
        if data.strI10.isBlank == false {
           
            let ingredient10 = Ingredient(strIngredient: data.strI10, strMeasure: data.strM10)
            ingredientArr.append(ingredient10)
        }
        if data.strI11.isBlank == false {
            
            let ingredient11 = Ingredient(strIngredient: data.strI11, strMeasure: data.strM11)
            ingredientArr.append(ingredient11)
        }
        if data.strI12.isBlank == false{
           
            let ingredient12 = Ingredient(strIngredient: data.strI12, strMeasure: data.strM12)
            ingredientArr.append(ingredient12)
        }
        if data.strI13.isBlank == false{
           
            let ingredient13 = Ingredient(strIngredient: data.strI13, strMeasure: data.strM13)
            ingredientArr.append(ingredient13)
        }
        if data.strI14.isBlank == false {
            
            let ingredient14 = Ingredient(strIngredient: data.strI14, strMeasure: data.strM14)
            ingredientArr.append(ingredient14)
        }
        if data.strI15.isBlank == false {
           
            let ingredient15 = Ingredient(strIngredient: data.strI15, strMeasure: data.strM15)
            ingredientArr.append(ingredient15)
        }
        if data.strI16.isBlank == false {
           
            let ingredient16 = Ingredient(strIngredient: data.strI16, strMeasure: data.strM16)
            ingredientArr.append(ingredient16)
        }
        if data.strI17.isBlank == false {
            
            let ingredient17 = Ingredient(strIngredient: data.strI17, strMeasure: data.strM17)
            ingredientArr.append(ingredient17)
        }
        if data.strI18.isBlank == false {
            
            let ingredient18 = Ingredient(strIngredient: data.strI18, strMeasure: data.strM18)
            ingredientArr.append(ingredient18)
        }
        if data.strI19.isBlank == false {
            
            let ingredient19 = Ingredient(strIngredient: data.strI19, strMeasure: data.strM19)
            ingredientArr.append(ingredient19)
        }
        if data.strI20.isBlank == false {
            
            let ingredient20 = Ingredient(strIngredient: data.strI20, strMeasure: data.strM20)
            ingredientArr.append(ingredient20)
        }
        
        lbInstructions.text = data.strInstructions
        ingSc.layer.cornerRadius = 5
        ingSc.layer.borderWidth = 1
        ingSc.layer.borderColor = UIColor.gray.cgColor
       
        btVideo.layer.borderWidth = 2
        btVideo.layer.borderColor = UIColor.white.cgColor
        btVideo.layer.cornerRadius = 9
        
        
    }
    
    
    @IBAction func btVideo(_ sender: Any) {
        
        playInYoutube(youtubeId: getYoutubeId(id: meal_detail!.strYoutube ))
    }
    
    // chaỵ youtube trên app hoặc trình duyệt
    func playInYoutube(youtubeId: String) {
        if let youtubeURL = URL(string: "youtube://\(youtubeId)"),
            UIApplication.shared.canOpenURL(youtubeURL) {
            // redirect to app
            UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
        } else if let youtubeURL = URL(string: "https://www.youtube.com/watch?v=\(youtubeId)") {
            // redirect through safari
            UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
        }
    }
    // lay id video
    func getYoutubeId(id: String) -> String {
        var str = id
        let last = str.lastIndex(of: "=")!
        let x = str[...last].count
        let index = str.index(str.startIndex, offsetBy: x)
        str.removeSubrange(str.startIndex..<index)
        return str
    }
    

    @IBAction func swipeBack(_ sender: Any) {
        view.isUserInteractionEnabled = true
        navigationController?.popViewController(animated: true)
    }
    
        
    @objc func addMealFavoriteToArr() {


        let alert = UIAlertController(title: "Add to favorite", message: nil , preferredStyle: .alert)
        let actionYes = UIAlertAction(title: "Yes", style: .default) { action in
            self.addMealFavorite()
        }
        let actionNo = UIAlertAction(title: "No", style: .destructive, handler: nil)
        alert.addAction(actionYes)
        alert.addAction(actionNo)
        present(alert, animated: true, completion: nil)
        
        
    }
    func addMealFavorite() {
        arrayMealFavorite.insert(meal_detail!, at: 0)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(arrayMealFavorite), forKey: "MealFavorite")
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "favoriteVC")
        navigationController?.pushViewController(vc, animated: true)

            
    }

}
//check space
extension String {
  var isBlank: Bool {
    return allSatisfy({ $0.isWhitespace })
  }
}


extension DetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "inggredientCell") as! InggredientCell
        let data = ingredientArr[indexPath.row]
        cell.ingredientLB.text = "\(data.strIngredient): \(data.strMeasure)"
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
}
