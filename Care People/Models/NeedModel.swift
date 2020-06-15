//
//  NeedModel.swift
//  Care People
//
//  Created by Pawan kumar on 13/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit
import Foundation

struct NeedModel {
    
    var id: String = ""
    var name: String = ""
    
    init?(json: [String: Any]) {
    
        //id
        if (json["id"]) != nil
        {
            id = String(describing: json["id"]!)
        }
         
        //name
        if (json["name"]) != nil
        {
            name = String(describing: json["name"]!)
        }
    }
}
