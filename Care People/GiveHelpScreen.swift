//
//  GiveHelpScreen.swift
//  Care People
//
//  Created by Pawan kumar on 13/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit
import Foundation

class GiveHelpScreen: UIViewController
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var userList = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
                      
        self.tableView.estimatedRowHeight = 80 //Use less when recived data No 0 otherwise not set cell size default
        self.tableView.rowHeight = UITableView.automaticDimension
               
        self.getUserListFromServer()
    }
    
    //I will Go Back
     @IBAction func backButton(_ button: UIButton) {
        self.navigationController?.popViewController(animated: true)
     }
}

 
//#MARK:- TableView DataSource & Delegate

extension GiveHelpScreen: UITableViewDataSource, UITableViewDelegate {
    
    func getUserListFromServer() -> Void {
          
          //Read File From Bundle
          
          if let filepath = Bundle.main.path(forResource: "userlist", ofType: "json") {
                           
              do {
                
                // Convert Json File to String
                let contents = try String(contentsOfFile: filepath)
                  
                // Convert String to Json Object
                let data = contents.data(using: .utf8)!
                let json = try? JSONSerialization.jsonObject(with: data)
                
                //Clear Array
                self.userList.removeAll()
                
                let userObject = json as? Dictionary<String, Any>
                let users: Array<Any> = userObject!["users"] as! Array<Any>
                
                for index in 0..<users.count
                {
                    if users.count > index {
                        
                        if let item = users[index] as? [String:Any]
                        {
                            if let user = UserModel(json: item) {
                                //Set Object
                                self.userList.append(user)
                            }
                        }
                    }
                }
                            
                // Reload List
                self.reload_list()
              
              } catch {
                  // contents could not be loaded
              
              }
          } else {
              
              // example.txt not found!
          }
      }
      
    
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
        return self.userList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UserCell? = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier) as? UserCell
        if (cell == nil)
        {
            let nib: Array = Bundle.main.loadNibNamed(UserCell.identifier, owner: self, options: nil)!
            cell = nib[0] as? UserCell
        }
        
        //Card View
        cell!.contentView.addCardView()
        cell!.iconImageView.imgAddBorderView(color: UIColor.purple)
    
        //User
        let user = self.userList[indexPath.row]
            
        //Name
        cell!.nameLabel.text = user.firstname + " " + user.lastname
        
        //Name Code
        cell!.iconCodeLabel.text = user.firstname.prefix(1).uppercased() + user.lastname.prefix(1).uppercased()
        
        //City
        cell!.addressLabel.text = user.location.address
        
        //Status
        cell!.statusLabel.text = "Status: " + user.status
        
        cell!.mapButtonPressed = {
            
            print("mapButtonPressed")
            self.moveToMapScreen(user: user)
        }
        
        return cell!
    }
    
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
        //User
        let user = self.userList[indexPath.row]
        self.moveToGiveProfileScreen(user: user)
    }
    
    func moveToGiveProfileScreen(user: UserModel) -> () {
        
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let viewController = storyboard.instantiateViewController(withIdentifier: "GiveProfileScreen") as! GiveProfileScreen
         viewController.user = user
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func moveToMapScreen(user: UserModel) -> () {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MapScreen") as! MapScreen
        viewController.user = user
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

