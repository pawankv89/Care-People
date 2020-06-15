//
//  NeedHelpScreen.swift
//  Care People
//
//  Created by Pawan kumar on 13/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit
import Foundation

class NeedHelpScreen: UIViewController
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var continueView: UIView!
    @IBOutlet weak var continueViewHeightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var continueButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var needList = [NeedModel]()
    var selectedNeedList = [NeedModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.continueView.isHidden = true
        self.continueViewHeightLayoutConstraint.constant = 0
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
                      
        self.tableView.estimatedRowHeight = 80 //Use less when recived data No 0 otherwise not set cell size default
        self.tableView.rowHeight = UITableView.automaticDimension
               
        continueButton.addCardView()
        
        self.getNeedListFromServer()
    }
    
    //I will Go Back
    @IBAction func backButton(_ button: UIButton) {
       self.navigationController?.popViewController(animated: true)
    }
    //I will Go Back
    @IBAction func continueButton(_ button: UIButton) {
     
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NeedProfileScreen") as! NeedProfileScreen
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

//#MARK:- TableView DataSource & Delegate

extension NeedHelpScreen: UITableViewDataSource, UITableViewDelegate {
    
    func getNeedListFromServer() -> Void {
          
          //Read File From Bundle
          
          if let filepath = Bundle.main.path(forResource: "needlist", ofType: "json") {
                           
              do {
                
                // Convert Json File to String
                let contents = try String(contentsOfFile: filepath)
                  
                // Convert String to Json Object
                let data = contents.data(using: .utf8)!
                let json = try? JSONSerialization.jsonObject(with: data)
                
                //Clear Array
                self.needList.removeAll()
                
                let userObject = json as? Dictionary<String, Any>
                let needs: Array<Any> = userObject!["needs"] as! Array<Any>
                
                for index in 0..<needs.count
                {
                    if needs.count > index {
                        
                        if let item = needs[index] as? [String:Any]
                        {
                            if let need = NeedModel(json: item) {
                                //Set Object
                                self.needList.append(need)
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
            
            if self.selectedNeedList.count > 0 {
                self.continueView.isHidden = false
                self.continueViewHeightLayoutConstraint.constant = 60
            } else {
                self.continueView.isHidden = true
                self.continueViewHeightLayoutConstraint.constant = 0
            }
            
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
        
        var cell: NeedCell? = tableView.dequeueReusableCell(withIdentifier: NeedCell.identifier) as? NeedCell
        if (cell == nil)
        {
            let nib: Array = Bundle.main.loadNibNamed(NeedCell.identifier, owner: self, options: nil)!
                cell = nib[0] as? NeedCell
        }
        
        //Card View
        cell!.contentView.addCardView()
        
        //Needs
        let need = self.needList[indexPath.row]
        
        //Name
        cell!.nameLabel.text = need.name
        
        //UnCheck Image
        cell!.iconImageView.image = UIImage(named: "uncheck")
        
        //Default For Selected
        for index in 0 ..< self.selectedNeedList.count {
            let itemFiltered = self.selectedNeedList[index]
            if  (itemFiltered.id == need.id ) {
                // found
                //Check Image
                cell!.iconImageView.image = UIImage(named: "check")
            }
        }

        return cell!
    }
    
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
        //Needs
        let need = self.needList[indexPath.row]
        
        if self.selectedNeedList.contains(where: { $0.id == need.id }) {
            // found
            self.selectedNeedList = self.selectedNeedList.filter(){$0.id != need.id}
        }
        else {
            // not found
            self.selectedNeedList.append(need)
        }
        
        // Refresh List
        self.reload_list()
    }
}
