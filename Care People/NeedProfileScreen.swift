//
//  NeedProfileScreen.swift
//  Care People
//
//  Created by Pawan kumar on 13/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit
import Foundation

class NeedProfileScreen: UIViewController
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var contaierView: UIView!
    
    @IBOutlet weak var nameFLabel: UILabel!
    @IBOutlet weak var nameFTextField: UITextField!
    
    @IBOutlet weak var nameLLabel: UILabel!
    @IBOutlet weak var nameLTextField: UITextField!
    
    @IBOutlet weak var addressTitleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var getCurrentLocationButton: UIButton!
    
    @IBOutlet weak var continueButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.nameFTextField.text = "John"
        self.nameLTextField.text = "Smith"
        
        self.addressLabel.text = ""
        self.getCurrentLocationButton.isHidden = false
        self.continueButton.isHidden = true
        
        getCurrentLocationButton.addCardView()
        continueButton.addCardView()
        
        contaierView.addCardView()
    }
    
    //I will Go Back
    @IBAction func backButton(_ button: UIButton) {
       self.navigationController?.popViewController(animated: true)
    }
    
    
    //I will Go Back
    @IBAction func getCurrentLocationButton(_ button: UIButton) {
          
        self.addressLabel.text = "H Block, Sector 62, Noida, Uttar Pradesh 201301"
        self.getCurrentLocationButton.isHidden = true
        self.continueButton.isHidden = false
    }
    
    //I will Go Back
    @IBAction func continueButton(_ button: UIButton) {
        
        let alert = UIAlertController(title: "Success!",
                                          message: "Your Request Sent successfully.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _ in
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "ThanksScreen") as! ThanksScreen
                self.navigationController?.pushViewController(viewController, animated: true)
                 
            }))
            
        self.present(alert, animated: true, completion: nil)
    }
}
