//
//  ViewController.swift
//  Meal Finder
//
//  Created by Dương Đại on 29/03/2023.
//

import UIKit
import Alamofire
import HandyJSON
import SDWebImage

var timerSecond: Timer?
var timerShow = 0

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timerSecond = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(showSecondScreen), userInfo: nil, repeats: true)
    }
    @objc func showSecondScreen() {
        timerShow += 1
        if timerShow == 2 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "tabBarController")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true, completion: nil)
            
        }
    }
    
}






