//
//  MealClass.swift
//  Meal Finder
//
//  Created by Dương Đại on 29/03/2023.
//

import Foundation
import HandyJSON

class APIMeal: HandyJSON {
    var meal = [Meals]()
    required init() {}
    
    
}

class Meals: HandyJSON, Codable {
    var idMeal = ""
    var strMeal = ""
    var strDrinkAlternate = ""
    var strCategory = ""
    var strArea = ""
    var strInstructions = ""
    var strMealThumb = ""
    var strTags = ""
    var strYoutube = ""
//    var strIngredient = [StrIngredient]()
    var strIngredient1 = ""
    var strIngredient2 = ""
    var strIngredient3 = ""
    var strIngredient4 = ""
    var strIngredient5 = ""
    var strIngredient6 = ""
    var strIngredient7 = ""
    var strIngredient8 = ""
    var strIngredient9 = ""
    var strIngredient10 = ""
    var strIngredient11 = ""
    var strIngredient12 = ""
    var strIngredient13 = ""
    var strIngredient14 = ""
    var strIngredient15 = ""
    var strIngredient16 = ""
    var strIngredient17 = ""
    var strIngredient18 = ""
    var strIngredient19 = ""
    var strIngredient20 = ""
//    var strMeasure = [StrMeasure]()
    var strMeasure1 = ""
    var strMeasure2 = ""
    var strMeasure3 = ""
    var strMeasure4 = ""
    var strMeasure5 = ""
    var strMeasure6 = ""
    var strMeasure7 = ""
    var strMeasure8 = ""
    var strMeasure9 = ""
    var strMeasure10 = ""
    var strMeasure11 = ""
    var strMeasure12 = ""
    var strMeasure13 = ""
    var strMeasure14 = ""
    var strMeasure15 = ""
    var strMeasure16 = ""
    var strMeasure17 = ""
    var strMeasure18 = ""
    var strMeasure19 = ""
    var strMeasure20 = ""
    
    var strSource = ""
    var strImageSource = ""
    var strCreativeCommonsConfirmed = ""
    var dateModified = ""
    
    required init() {}
}


//class StrMeasure: HandyJSON, Codable {
//    var strMeasure1 = ""
//    var strMeasure2 = ""
//    var strMeasure3 = ""
//    var strMeasure4 = ""
//    var strMeasure5 = ""
//    var strMeasure6 = ""
//    var strMeasure7 = ""
//    var strMeasure8 = ""
//    var strMeasure9 = ""
//    var strMeasure10 = ""
//    var strMeasure11 = ""
//    var strMeasure12 = ""
//    var strMeasure13 = ""
//    var strMeasure14 = ""
//    var strMeasure15 = ""
//    var strMeasure16 = ""
//    var strMeasure17 = ""
//    var strMeasure18 = ""
//    var strMeasure19 = ""
//    var strMeasure20 = ""
//
//    required init() {}
//}


//class StrIngredient: HandyJSON, Codable {
//    var strIngredient1 = ""
//    var strIngredient2 = ""
//    var strIngredient3 = ""
//    var strIngredient4 = ""
//    var strIngredient5 = ""
//    var strIngredient6 = ""
//    var strIngredient7 = ""
//    var strIngredient8 = ""
//    var strIngredient9 = ""
//    var strIngredient10 = ""
//    var strIngredient11 = ""
//    var strIngredient12 = ""
//    var strIngredient13 = ""
//    var strIngredient14 = ""
//    var strIngredient15 = ""
//    var strIngredient16 = ""
//    var strIngredient17 = ""
//    var strIngredient18 = ""
//    var strIngredient19 = ""
//    var strIngredient20 = ""
//    required init() {}
//}




class Meal_Data: HandyJSON, Codable {
    
    var strId = 0
    var strMeal = ""
    var strMealThumb = ""
    var strInstructions = ""
    var strC = ""
    var strA = ""
    var strI1 = ""
    var strI2 = ""
    var strI3 = ""
    var strI4 = ""
    var strI5 = ""
    var strI6 = ""
    var strI7 = ""
    var strI8 = ""
    var strI9 = ""
    var strI10 = ""
    var strI11 = ""
    var strI12 = ""
    var strI13 = ""
    var strI14 = ""
    var strI15 = ""
    var strI16 = ""
    var strI17 = ""
    var strI18 = ""
    var strI19 = ""
    var strI20 = ""
    var strM1 = ""
    var strM2 = ""
    var strM3 = ""
    var strM4 = ""
    var strM5 = ""
    var strM6 = ""
    var strM7 = ""
    var strM8 = ""
    var strM9 = ""
    var strM10 = ""
    var strM11 = ""
    var strM12 = ""
    var strM13 = ""
    var strM14 = ""
    var strM15 = ""
    var strM16 = ""
    var strM17 = ""
    var strM18 = ""
    var strM19 = ""
    var strM20 = ""
    var strYoutube = ""
    
    init(strId: Int, strMeal:String, strMealThumb:String, strInstructions:String,strC: String, strA: String, strI1:String, strI2:String, strI3:String, strI4:String, strI5:String, strI7:String, strI9:String, strI11:String, strI13:String, strI15:String, strI6:String, strI8:String, strI10:String, strI12:String, strI14:String, strI16:String, strI17:String, strI18:String, strI19:String, strI20:String, strM1:String, strM2:String, strM3:String, strM6:String, strM9:String, strM12:String, strM14:String, strM16:String, strM18:String, strM4:String, strM7:String, strM10:String, strM13:String, strM15:String, strM17:String, strM19:String, strM5:String, strM8:String, strM11:String, strM20:String, strYoutube:String) {
        self.strId = strId
        self.strMeal = strMeal
        self.strMealThumb = strMealThumb
        self.strInstructions = strInstructions
        self.strC = strC
        self.strA = strA
        self.strI1 = strI1
        self.strI2 = strI2
        self.strI3 = strI3
        self.strI4 = strI4
        self.strI5 = strI5
        self.strI6 = strI6
        self.strI7 = strI7
        self.strI8 = strI8
        self.strI9 = strI9
        self.strI10 = strI10
        self.strI11 = strI11
        self.strI12 = strI12
        self.strI13 = strI13
        self.strI14 = strI14
        self.strI15 = strI15
        self.strI16 = strI16
        self.strI17 = strI17
        self.strI18 = strI18
        self.strI19 = strI19
        self.strI20 = strI20
        self.strM1 = strM1
        self.strM2 = strM2
        self.strM3 = strM3
        self.strM4 = strM4
        self.strM5 = strM5
        self.strM6 = strM6
        self.strM7 = strM7
        self.strM8 = strM8
        self.strM9 = strM8
        self.strM10 = strM10
        self.strM11 = strM11
        self.strM12 = strM12
        self.strM13 = strM13
        self.strM14 = strM14
        self.strM15 = strM15
        self.strM16 = strM16
        self.strM17 = strM17
        self.strM18 = strM18
        self.strM19 = strM19
        self.strM20 = strM20
        self.strYoutube = strYoutube

    }
    required init() {}
    
}


class Ingredient: HandyJSON, Codable {
    var strMeasure = ""
    var strIngredient = ""
    
    init(strIngredient: String, strMeasure: String) {
        self.strIngredient = strIngredient
        self.strMeasure = strMeasure
    }
    
    required init() {}
}
