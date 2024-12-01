//
//  CustomizationVC.swift
//  Sip Goal
//
//  Created by Deepak Ghadi on 30/11/24.
//

import UIKit

@available(iOS 13.0, *)
class CustomizationVC: UIViewController {
    
    @IBOutlet weak var weightOuterView: UIView!
    @IBOutlet weak var waterOuterView: UIView!
    
    @IBOutlet weak var weightLable: UILabel!
    @IBOutlet weak var waterLabel: UILabel!
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var waterConsumptionSlider: UISlider!
    
    @IBOutlet weak var doneBtnOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpViews()
        
        weightSlider.minimumValue = 10
        weightSlider.maximumValue = 200
        waterConsumptionSlider.minimumValue = 10
        waterConsumptionSlider.maximumValue = 9000
        doneBtnOutlet.layer.cornerRadius = 15.0
        
        weightSlider.value = 70
        waterConsumptionSlider.value = 2450
                
        //doneBtnOutlet.addTarget(self, action: #selector(openTabBar), for: .touchUpInside)

    }
    
    func setUpViews() {
        weightOuterView.layer.cornerRadius = 10.0
        waterOuterView.layer.cornerRadius = 10.0
        weightOuterView.layer.borderWidth = 2.0
        weightOuterView.layer.borderColor = UIColor.lightGray.cgColor
        waterOuterView.layer.borderWidth = 2.0
        waterOuterView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func weightChanged(_ sender: UISlider) {
        
        updateWaterConsumption()
    }
    
    @IBAction func waterConsuptionChanged(_ sender: Any) {
        waterLabel.text = "\(Int(waterConsumptionSlider.value)) ml"
    }
    
        func updateWaterConsumption() {
            let weight = Int(weightSlider.value)
            let waterConsumption = waterConsumption(for: weight)
            
            weightLable.text = "\(weight) kg"
            waterConsumptionSlider.value = Float(waterConsumption)
            waterLabel.text = "\(waterConsumption) ml"
        }
    
    func waterConsumption(for weight:Int) -> Int {
        let waterPerKg = 35
        let water = weight * waterPerKg
                
        return min(max(water, 10), 9000)
    }
    
//    @objc private func openTabBar() {
//            let customTabBarController = LandingPageVC()
//            customTabBarController.modalPresentationStyle = .fullScreen
//            self.present(customTabBarController, animated: true, completion: nil)
//        }
    
    @IBAction func doneBtnAction(_ sender: UIButton) {
        
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        if let vc = storyboard.instantiateViewController(withIdentifier: "LandingPageVC") as? LandingPageVC {
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
