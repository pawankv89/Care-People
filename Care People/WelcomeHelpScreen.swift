//
//  WelcomeHelpScreen.swift
//  Care People
//
//  Created by Pawan kumar on 12/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit
import Foundation

class WelcomeHelpScreen: UIViewController
{
    //Earth Image
    @IBOutlet weak var earthImageView: UIImageView!
    
    //I will give hepl
    @IBOutlet weak var giveHelpView: UIView!
    @IBOutlet weak var giveHelpButton: UIButton!
    
     //I need help
    @IBOutlet weak var needHelpView: UIView!
    @IBOutlet weak var needHelpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //layer of View
        giveHelpView.layer.cornerRadius = 10
        giveHelpView.layer.borderWidth = 1
        giveHelpView.layer.borderColor = UIColor.green.cgColor
        
        needHelpView.layer.cornerRadius = 10
        needHelpView.layer.borderWidth = 1
        needHelpView.layer.borderColor = UIColor.green.cgColor
        
        giveHelpView.addCardView()
        needHelpView.addCardView()
    }
    
    //I will give hepl
    @IBAction func giveHelpButton(_ button: UIButton) {
        moveToGiveHelpScreen()
    }
    
    //I need help
    @IBAction func needHelpButton(_ button: UIButton) {
       moveToNeedHelpScreen()
    }
    
    @objc func moveToGiveHelpScreen() -> () {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GiveHelpScreen") as! GiveHelpScreen
        self.navigationController?.pushViewController(viewController, animated: true)

    }
    
    @objc func moveToNeedHelpScreen() -> () {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NeedHelpScreen") as! NeedHelpScreen
        self.navigationController?.pushViewController(viewController, animated: true)

    }
}

