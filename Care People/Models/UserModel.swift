//
//  UserModel.swift
//  Care People
//
//  Created by Pawan kumar on 13/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit
import Foundation

struct UserModel
{
    var status: String = ""
    var gender: String = ""
    var firstname: String = ""
    var lastname: String = ""
    var email: String = ""
    var location: LocationModel!
    var needs = [NeedModel]()
    
    init?(json: [String: Any]) {
        
        //status
        if (json["status"]) != nil
        {
            status = String(describing: json["status"]!)
        }
        //gender
        if (json["gender"]) != nil
        {
            gender = String(describing: json["gender"]!)
        }
        //firstname
        if (json["firstname"]) != nil
        {
            firstname = String(describing: json["firstname"]!)
        }
        //lastname
        if (json["lastname"]) != nil
        {
            lastname = String(describing: json["lastname"]!)
        }
        //email
        if (json["email"]) != nil
        {
            email = String(describing: json["email"]!)
        }
        //location
        if (json["location"]) != nil
        {
            location =  LocationModel(json: json["location"] as! [String: Any])
        }
        //needs
        if (json["needs"]) != nil
        {
            let needs: Array<Any> = json["needs"] as! Array<Any>
            
            for index in 0..<needs.count
            {
                if needs.count > index {
                    
                    if let item = needs[index] as? [String:Any]
                    {
                        if let need = NeedModel(json: item) {
                            //Set Object
                            self.needs.append(need)
                        }
                    }
                }
            }
        }
    }
}

struct LocationModel {
 
    var address: String = ""
    var street: String = ""
    var city: String = ""
    var state: String = ""
    var country: String = ""
    var postcode: String = ""
    var coordinates: CoordinatesModel!
    
    init?(json: [String: Any]) {
        
        //address
        if (json["address"]) != nil
        {
            address = String(describing: json["address"]!)
        }
        //street
        if (json["street"]) != nil
        {
            street = String(describing: json["street"]!)
        }
        //city
        if (json["city"]) != nil
        {
            city = String(describing: json["city"]!)
        }
        //state
        if (json["state"]) != nil
        {
            state = String(describing: json["state"]!)
        }
        //country
        if (json["country"]) != nil
        {
            country = String(describing: json["country"]!)
        }
        //postcode
        if (json["postcode"]) != nil
        {
            postcode = String(describing: json["postcode"]!)
        }
        //coordinates
        if (json["coordinates"]) != nil
        {
            coordinates =  CoordinatesModel(json: json["coordinates"] as! [String: Any])
        }
    }
}

struct CoordinatesModel {
    
    var latitude: String = ""
    var longitude: String = ""
    
    init?(json: [String: Any]) {
    
        //latitude
        if (json["latitude"]) != nil
        {
            latitude = String(describing: json["latitude"]!)
        }
         
        //longitude
        if (json["longitude"]) != nil
        {
            longitude = String(describing: json["longitude"]!)
        }
    }
}
