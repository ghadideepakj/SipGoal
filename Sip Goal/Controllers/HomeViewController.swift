//
//  HomeViewController.swift
//  Sip Goal
//
//  Created by Deepak Ghadi on 01/12/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var drinkLabel: UILabel!
    @IBOutlet weak var indicatorLabel: UILabel!
    @IBOutlet weak var addWaterBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addWaterBtn.layer.cornerRadius = 10.0
    }
    

}
