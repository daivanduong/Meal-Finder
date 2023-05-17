//
//  HomeVC.swift
//  Meal Finder
//
//  Created by Ocean97 on 12/05/2023.
//

import UIKit
import Alamofire
import HandyJSON
import SDWebImage
import Toast_Swift

class HomeVC: UIViewController {
    
    var arrMeals = [Meals]()
    
    @IBOutlet weak var tfSearch: UITextField!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    func setupView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        tfSearch.setupLeftSideImage(iconName: "iconssearch")
        
        let nib = UINib(nibName: "MealCollectionCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "mealCollectionCell")
        
        let list = ["beef", "fish", "lamb", "chicken", "potato"]
        let random_meal = list.randomElement()!
        getDataAPI(key: random_meal)
        tfSearch.returnKeyType = .search
        tfSearch.delegate = self
        navigationItem.hidesBackButton = true

    }
    
    func getDataAPI(key : String) {
        if let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(key)") {
            AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseJSON { respone in
                //dump(respone)
                if let data = respone.value as? [String: Any]{
                    if let dict = data["meals"] as? [NSDictionary] {
                        if dict.count > 0 {
                            let result = dict.map({ Meals.deserialize(from: $0)! })
                            self.arrMeals = result
                            self.collectionView.reloadData()
                        }
                    }else {
                        self.view.makeToast("Ohh, not found")
                    }
                }
            }
        }
    }
    

}


extension HomeVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let key = textField.text!
        if key != "" {
            getDataAPI(key: key)
        }
        textField.endEditing(true)
        return true
    }
    
    
}

extension UITextField {
    func setupLeftSideImage(iconName: String) {
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = UIImage(named: iconName)
        let imageViewContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
        imageViewContainerView.addSubview(imageView)
        leftView = imageViewContainerView
        leftViewMode = .always
        
        
    }
}


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMeals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mealCollectionCell", for: indexPath) as! MealCollectionCell
        let data = arrMeals[indexPath.row]
        if let url = URL(string: "\(data.strMealThumb)") {
            cell.imgMeal.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (view.frame.width - 20) / 3 // chia so item tren 1 hang
        return CGSize(width: w, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "detailVC") as! DetailVC
        let data = arrMeals[indexPath.row]

        let meal_detail = Meal_Data(strId: 0, strMeal: data.strMeal, strMealThumb: data.strMealThumb, strInstructions: data.strInstructions, strC: data.strCategory, strA: data.strArea, strI1: data.strIngredient1, strI2: data.strIngredient2, strI3: data.strIngredient3, strI4: data.strIngredient4, strI5: data.strIngredient5, strI7: data.strIngredient7, strI9: data.strIngredient9, strI11: data.strIngredient11, strI13: data.strIngredient13, strI15: data.strIngredient15, strI6: data.strIngredient16, strI8: data.strIngredient8, strI10: data.strIngredient10, strI12: data.strIngredient12, strI14: data.strIngredient14, strI16: data.strIngredient16, strI17: data.strIngredient17, strI18: data.strIngredient18, strI19: data.strIngredient19, strI20: data.strIngredient20, strM1: data.strMeasure1, strM2: data.strMeasure2, strM3: data.strMeasure3, strM6: data.strMeasure6, strM9: data.strMeasure9, strM12: data.strMeasure12, strM14: data.strMeasure14, strM16: data.strMeasure16, strM18: data.strMeasure18, strM4: data.strMeasure4, strM7: data.strMeasure7, strM10: data.strMeasure10, strM13: data.strMeasure13, strM15: data.strMeasure15, strM17: data.strMeasure17, strM19: data.strMeasure19, strM5: data.strMeasure5, strM8: data.strMeasure8, strM11: data.strMeasure11, strM20: data.strMeasure20, strYoutube: data.strYoutube)

        vc.meal_detail = meal_detail
        
        //add to history
        arrayMealHistory.append(meal_detail)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(arrayMealHistory), forKey: "MealHistory")
        navigationController?.pushViewController(vc, animated: true)

    }
    
}
