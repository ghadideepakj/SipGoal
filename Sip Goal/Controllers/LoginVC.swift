//
//  LoginVC.swift
//  Sip Goal
//
//  Created by Deepak Ghadi on 30/11/24.
//

import UIKit

@available(iOS 13.0, *)
class LoginVC: UIViewController {

    @IBOutlet weak var outerLayerOfLogo: UIView!
    @IBOutlet weak var signInAppleView: UIView!
    @IBOutlet weak var signInGoogleView: UIView!
    @IBOutlet weak var emailtextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpViews()
    }
    
    func setUpViews() {
        outerLayerOfLogo.layer.cornerRadius = 10.0
        outerLayerOfLogo.layer.shadowColor = UIColor.lightGray.cgColor
        //outerLayerOfLogo.layer.shadowOffset = CGSize(width: 0, height: 0)
        outerLayerOfLogo.layer.shadowRadius = 5.0
        outerLayerOfLogo.layer.shadowOpacity = 0.5
        outerLayerOfLogo.layer.masksToBounds = true
        
        signInAppleView.layer.cornerRadius = 5.0
        signInAppleView.layer.borderWidth = 1.0
        signInAppleView.layer.borderColor = UIColor.black.cgColor
        signInGoogleView.layer.cornerRadius = 5.0
        signInGoogleView.layer.borderWidth = 1.0
        signInGoogleView.layer.borderColor = UIColor.black.cgColor
        
        emailtextfield.layer.cornerRadius = 5.0
        emailtextfield.layer.borderWidth = 1.0
        emailtextfield.layer.borderColor = UIColor.gray.cgColor
        
        emailtextfield.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        
    }
    
    @IBAction func skipBtnPressed(_ sender: UIButton) {
        
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        if let vc = storyboard.instantiateViewController(withIdentifier: "CustomizationVC") as? CustomizationVC {
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}
