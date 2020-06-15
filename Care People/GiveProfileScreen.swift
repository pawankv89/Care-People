//
//  GiveProfileScreen.swift
//  Care People
//
//  Created by Pawan kumar on 13/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit
import Foundation

class GiveProfileScreen: UIViewController
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconCodeLabel: UILabel!
    
    @IBOutlet weak var nameFLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    //Location on Map
    @IBOutlet weak var locationOnMapButton: UIButton!
    
    @IBOutlet weak var acceptRequestButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
        
    var user: UserModel!
    
    var needList = [NeedModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.iconImageView.imgAddBorderView(color: UIColor.purple)
    
        //Name
        self.nameFLabel.text = user.firstname + " " + user.lastname
        
        //Name Code
        self.iconCodeLabel.text = user.firstname.prefix(1).uppercased() + user.lastname.prefix(1).uppercased()
            
        //City
        self.addressLabel.text = user.location.address
        
        needList = user.needs
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
                             
        self.tableView.estimatedRowHeight = 80 //Use less when recived data No 0 otherwise not set cell size default
        self.tableView.rowHeight = UITableView.automaticDimension
        
        locationOnMapButton.addCardView()
        acceptRequestButton.addCardView()
    }
    
    //I will Go Back
    @IBAction func backButton(_ button: UIButton) {
       self.navigationController?.popViewController(animated: true)
    }
    
    //I will Go Back
       @IBAction func locationOnMapButton(_ button: UIButton) {
             
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let viewController = storyboard.instantiateViewController(withIdentifier: "MapScreen") as! MapScreen
           viewController.user = user
           self.navigationController?.pushViewController(viewController, animated: true)
       }
    
    //I will Go Back
    @IBAction func acceptRequestButton(_ button: UIButton) {
        
        let alert = UIAlertController(title: "Success!",
                                          message: "Your Request Accepted successfully.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _ in
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "ThanksScreen") as! ThanksScreen
               self.navigationController?.pushViewController(viewController, animated: true)
                
            }))
            
        self.present(alert, animated: true, completion: nil)
    }
}

//#MARK:- TableView DataSource & Delegate

extension GiveProfileScreen: UITableViewDataSource, UITableViewDelegate {
    
    func reload_list() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    //PK-New-Added
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.needList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: NeedListCell? = tableView.dequeueReusableCell(withIdentifier: NeedListCell.identifier) as? NeedListCell
        if (cell == nil)
        {
            let nib: Array = Bundle.main.loadNibNamed(NeedListCell.identifier, owner: self, options: nil)!
                cell = nib[0] as? NeedListCell
        }
        
        //Needs
        let need = self.needList[indexPath.row]
        
        //Name
        cell!.nameLabel.text = "\(indexPath.row + 1)) " + need.name
        
        return cell!
    }
}
