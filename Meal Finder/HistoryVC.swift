//
//  HistoryVC.swift
//  Meal Finder
//
//  Created by Ocean97 on 12/05/2023.
//

import UIKit
import SDWebImage

var arrayMealHistory = [Meal_Data]()

class HistoryVC: UIViewController {
    
    @IBOutlet weak var tableViewCell: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
        
        if let data_history = UserDefaults.standard.data(forKey: "MealHistory") {
            arrayMealHistory = try! PropertyListDecoder().decode([Meal_Data].self, from: data_history)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        //UserDefaults.standard.removeObject(forKey: "MealHistory")
        UserDefaults.standard.set(try? PropertyListEncoder().encode(arrayMealHistory), forKey: "MealHistory")

        tableViewCell.reloadData()

    }
    
    func setupView() {
        tableViewCell.delegate = self
        tableViewCell.dataSource = self
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableViewCell.register(nib, forCellReuseIdentifier: "tableViewCell")
        
        tableViewCell.layer.cornerRadius = 10
        tableViewCell.separatorStyle = .none
        tableViewCell.showsVerticalScrollIndicator = false
        
    }

}

extension HistoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMealHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TableViewCell
        let data = arrayMealHistory.reversed()[indexPath.row]
        if let url = URL(string: "\(data.strMealThumb)") {
            cell.img_meal.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
        }
        cell.name_meal.text = "Name: \(data.strMeal)"
        cell.category.text = "Category: \(data.strC)"
        cell.area.text = "Area: \(data.strA)"

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "detailVC") as! DetailVC
        let data = arrayMealHistory.reversed()[indexPath.row]
        let meal_history = Meal_Data(strId: 0, strMeal: data.strMeal, strMealThumb: data.strMealThumb, strInstructions: data.strInstructions, strC: data.strC, strA: data.strA, strI1: data.strI1, strI2: data.strI2, strI3: data.strI3, strI4: data.strI4, strI5: data.strI5, strI7: data.strI7, strI9: data.strI9, strI11: data.strI11, strI13: data.strI13, strI15: data.strI15, strI6: data.strI16, strI8: data.strI8, strI10: data.strI10, strI12: data.strI12, strI14: data.strI14, strI16: data.strI16, strI17: data.strI17, strI18: data.strI18, strI19: data.strI19, strI20: data.strI20, strM1: data.strM1, strM2: data.strM2, strM3: data.strM3, strM6: data.strM6, strM9: data.strM9, strM12: data.strM12, strM14: data.strM14, strM16: data.strM16, strM18: data.strM18, strM4: data.strM4, strM7: data.strM7, strM10: data.strM10, strM13: data.strM13, strM15: data.strM15, strM17: data.strM17, strM19: data.strM19, strM5: data.strM5, strM8: data.strM8, strM11: data.strM11, strM20: data.strM20, strYoutube: data.strYoutube)
        
        vc.meal_detail = meal_history

        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return .delete
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            arrayMealHistory.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)

            UserDefaults.standard.removeObject(forKey: "MealHistory")
            UserDefaults.standard.set(try? PropertyListEncoder().encode(arrayMealHistory), forKey: "MealHistory")
            tableView.endUpdates()
        }
    }

}
