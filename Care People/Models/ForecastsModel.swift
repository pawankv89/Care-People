//
//  ForecastsModel.swift
//  Care People
//
//  Created by Pawan kumar on 15/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit
import Foundation

struct ForecastsModel {

      var  _class: String = ""
      var  expire_time_gmt: String = ""
      var  fcst_valid: String = ""
      var  fcst_valid_local: String = ""
      var  num: String = ""
      var  max_temp: String = ""
      var  min_temp: String = ""
      var  torcon: String = ""
      var  stormcon: String = ""
      var  blurb: String = ""
      var  blurb_author: String = ""
      var  lunar_phase_day: String = ""
      var  dow: String = ""
      var  lunar_phase: String = ""
      var  lunar_phase_code: String = ""
      var  sunrise: String = ""
      var  sunset: String = ""
      var  moonrise: String = ""
      var  qualifier_code: String = ""
      var  qualifier: String = ""
      var  narrative: String = ""
      var  qpf: String = ""
      var  snow_qpf: String = ""
      var  snow_range: String = ""
      var  snow_phrase: String = ""
      var  snow_code: String = ""
      
      var  night: DailyModel!
      var  day: DailyModel!
    
    init?(json: [String: Any]) {
    
        //
        if (json["class"]) != nil
        {
            _class = String(describing: json["class"]!)
            _class = APIManager.shared.isValidObjectValue(value: _class)
        }
        //
        if (json["expire_time_gmt"]) != nil
        {
            expire_time_gmt = String(describing: json["expire_time_gmt"]!)
            expire_time_gmt = APIManager.shared.isValidObjectValue(value: expire_time_gmt)
        }
        //
        if (json["fcst_valid"]) != nil
        {
            fcst_valid = String(describing: json["fcst_valid"]!)
            fcst_valid = APIManager.shared.isValidObjectValue(value: fcst_valid)
        }
        //
        if (json["fcst_valid_local"]) != nil
        {
            fcst_valid_local = String(describing: json["fcst_valid_local"]!)
            fcst_valid_local = APIManager.shared.isValidObjectValue(value: fcst_valid_local)
        }
        //
        if (json["num"]) != nil
        {
            num = String(describing: json["num"]!)
            num = APIManager.shared.isValidObjectValue(value: num)
        }
        //
        if (json["max_temp"]) != nil
        {
            max_temp = String(describing: json["max_temp"]!)
            max_temp = APIManager.shared.isValidObjectValue(value: max_temp)
        }
        //
        if (json["min_temp"]) != nil
        {
            min_temp = String(describing: json["min_temp"]!)
            min_temp = APIManager.shared.isValidObjectValue(value: min_temp)
        }
        //
        if (json["torcon"]) != nil
        {
            torcon = String(describing: json["torcon"]!)
            torcon = APIManager.shared.isValidObjectValue(value: torcon)
        }
        //
        if (json["stormcon"]) != nil
        {
            stormcon = String(describing: json["stormcon"]!)
            stormcon = APIManager.shared.isValidObjectValue(value: stormcon)
        }
        //
        if (json["sunset"]) != nil
        {
            sunset = String(describing: json["sunset"]!)
            sunset = APIManager.shared.isValidObjectValue(value: sunset)
        }
        //
        if (json["blurb_author"]) != nil
        {
            blurb_author = String(describing: json["blurb_author"]!)
            blurb_author = APIManager.shared.isValidObjectValue(value: blurb_author)
        }
        //
        if (json["lunar_phase_day"]) != nil
        {
            lunar_phase_day = String(describing: json["lunar_phase_day"]!)
            lunar_phase_day = APIManager.shared.isValidObjectValue(value: lunar_phase_day)
        }
        //
        if (json["dow"]) != nil
        {
            dow = String(describing: json["dow"]!)
            dow = APIManager.shared.isValidObjectValue(value: dow)
        }
        //
        if (json["lunar_phase"]) != nil
        {
            lunar_phase = String(describing: json["lunar_phase"]!)
            lunar_phase = APIManager.shared.isValidObjectValue(value: lunar_phase)
        }
        //
        if (json["lunar_phase_code"]) != nil
        {
            lunar_phase_code = String(describing: json["lunar_phase_code"]!)
            lunar_phase_code = APIManager.shared.isValidObjectValue(value: lunar_phase_code)
        }
        //
        if (json["sunrise"]) != nil
        {
            sunrise = String(describing: json["sunrise"]!)
            sunrise = APIManager.shared.isValidObjectValue(value: sunrise)
        }
        //
        if (json["moonrise"]) != nil
        {
            moonrise = String(describing: json["moonrise"]!)
            moonrise = APIManager.shared.isValidObjectValue(value: moonrise)
        }
        //
        if (json["qualifier_code"]) != nil
        {
            qualifier_code = String(describing: json["qualifier_code"]!)
            qualifier_code = APIManager.shared.isValidObjectValue(value: qualifier_code)
        }
        //
        if (json["qualifier"]) != nil
        {
            qualifier = String(describing: json["qualifier"]!)
            qualifier = APIManager.shared.isValidObjectValue(value: qualifier)
        }
        //
        if (json["narrative"]) != nil
        {
            narrative = String(describing: json["narrative"]!)
            narrative = APIManager.shared.isValidObjectValue(value: narrative)
        }
        //
        if (json["qpf"]) != nil
        {
            qpf = String(describing: json["qpf"]!)
            qpf = APIManager.shared.isValidObjectValue(value: qpf)
        }
        //
        if (json["snow_qpf"]) != nil
        {
            snow_qpf = String(describing: json["snow_qpf"]!)
            snow_qpf = APIManager.shared.isValidObjectValue(value: snow_qpf)
        }
        //
        if (json["snow_range"]) != nil
        {
            snow_range = String(describing: json["snow_range"]!)
            snow_range = APIManager.shared.isValidObjectValue(value: snow_range)
        }
        //
        if (json["snow_phrase"]) != nil
        {
            snow_phrase = String(describing: json["snow_phrase"]!)
            snow_phrase = APIManager.shared.isValidObjectValue(value: snow_phrase)
        }
        //
        if (json["snow_code"]) != nil
        {
            snow_code = String(describing: json["snow_code"]!)
            snow_code = APIManager.shared.isValidObjectValue(value: snow_code)
        }
        //night
        if (json["night"]) != nil
        {
            night =  DailyModel(json: json["night"] as! [String: Any])
        }
        //day
        if (json["day"]) != nil
        {
            day =  DailyModel(json: json["day"] as! [String: Any])
        }
    }
    
}

