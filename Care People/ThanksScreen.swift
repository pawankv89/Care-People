//
//  ThanksScreen.swift
//  Care People
//
//  Created by Pawan kumar on 13/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit
import Foundation

class ThanksScreen: UIViewController
{
    
    @IBOutlet weak var welcomButton: UIButton!
    @IBOutlet weak var contaierView: UIView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        contaierView.addCardView()
        welcomButton.addCardView()
    }
    
    //I will Go Back
    @IBAction func welcomButton(_ button: UIButton) {
          
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let initialViewController = storyboard.instantiateViewController(withIdentifier: "Navigation")
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window?.rootViewController = initialViewController
    appDelegate.window?.makeKeyAndVisible()
    
    }
}
