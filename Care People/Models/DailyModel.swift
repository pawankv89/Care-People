//
//  DailyModel.swift
//  Care People
//
//  Created by Pawan kumar on 15/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//


import UIKit
import Foundation

struct DailyModel {
    
        var  fcst_valid: String = ""
        var  fcst_valid_local: String = ""
        var  day_ind: String = ""
        var  thunder_enum: String = ""
        var  daypart_name: String = ""
        var  long_daypart_name: String = ""
        var  alt_daypart_name: String = ""
        var  thunder_enum_phrase: String = ""
        var  num: String = ""
        var  temp: String = ""
        var  hi: String = ""
        var  wc: String = ""
        var  pop: String = ""
        var  icon_extd: String = ""
        var  icon_code: String = ""
        var  wxman: String = ""
        var  phrase_12char: String = ""
        var  phrase_22char: String = ""
        var  phrase_32char: String = ""
        var  subphrase_pt1: String = ""
        var  subphrase_pt2: String = ""
        var  subphrase_pt3: String = ""
        var  precip_type: String = ""
        var  rh: String = ""
        var  wspd: String = ""
        var  wdir: String = ""
        var  wdir_cardinal: String = ""
        var  clds: String = ""
        var  pop_phrase: String = ""
        var  temp_phrase: String = ""
        var  accumulation_phrase: String = ""
        var  wind_phrase: String = ""
        var  shortcast: String = ""
        var  narrative: String = ""
        var  qpf: String = ""
        var  snow_qpf: String = ""
        var  snow_range: String = ""
        var  snow_code: String = ""
        var  vocal_key: String = ""
        var  qualifier_code: String = ""
        var  qualifier: String = ""
        var  uv_index_raw: String = ""
        var  uv_warning: String = ""
        var  uv_desc: String = ""
        var  golf_index: String = ""
        var  golf_category: String = ""
      
      init?(json: [String: Any]) {
      
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
          if (json["day_ind"]) != nil
          {
              day_ind = String(describing: json["day_ind"]!)
              day_ind = APIManager.shared.isValidObjectValue(value: day_ind)
          }
          //
          if (json["thunder_enum"]) != nil
          {
              thunder_enum = String(describing: json["thunder_enum"]!)
              thunder_enum = APIManager.shared.isValidObjectValue(value: thunder_enum)
          }
          //
          if (json["daypart_name"]) != nil
          {
              daypart_name = String(describing: json["daypart_name"]!)
              daypart_name = APIManager.shared.isValidObjectValue(value: daypart_name)
          }
          //
          if (json["long_daypart_name"]) != nil
          {
              long_daypart_name = String(describing: json["long_daypart_name"]!)
              long_daypart_name = APIManager.shared.isValidObjectValue(value: long_daypart_name)
          }
          //
          if (json["alt_daypart_name"]) != nil
          {
              alt_daypart_name = String(describing: json["alt_daypart_name"]!)
              alt_daypart_name = APIManager.shared.isValidObjectValue(value: alt_daypart_name)
          }
          //
          if (json["thunder_enum_phrase"]) != nil
          {
              thunder_enum_phrase = String(describing: json["thunder_enum_phrase"]!)
              thunder_enum_phrase = APIManager.shared.isValidObjectValue(value: thunder_enum_phrase)
          }
          //
          if (json["num"]) != nil
          {
              num = String(describing: json["num"]!)
              num = APIManager.shared.isValidObjectValue(value: num)
          }
          //
          if (json["phrase_12char"]) != nil
          {
              phrase_12char = String(describing: json["phrase_12char"]!)
              phrase_12char = APIManager.shared.isValidObjectValue(value: phrase_12char)
          }
          //
          if (json["hi"]) != nil
          {
              hi = String(describing: json["hi"]!)
              hi = APIManager.shared.isValidObjectValue(value: hi)
          }
          //
          if (json["wc"]) != nil
          {
              wc = String(describing: json["wc"]!)
              wc = APIManager.shared.isValidObjectValue(value: wc)
          }
          //
          if (json["pop"]) != nil
          {
              pop = String(describing: json["pop"]!)
              pop = APIManager.shared.isValidObjectValue(value: pop)
          }
          //
          if (json["icon_extd"]) != nil
          {
              icon_extd = String(describing: json["icon_extd"]!)
              icon_extd = APIManager.shared.isValidObjectValue(value: icon_extd)
          }
          //
          if (json["icon_code"]) != nil
          {
              icon_code = String(describing: json["icon_code"]!)
              icon_code = APIManager.shared.isValidObjectValue(value: icon_code)
          }
          //
          if (json["wxman"]) != nil
          {
              wxman = String(describing: json["wxman"]!)
              wxman = APIManager.shared.isValidObjectValue(value: wxman)
          }
          //
          if (json["phrase_22char"]) != nil
          {
              phrase_22char = String(describing: json["phrase_22char"]!)
              phrase_22char = APIManager.shared.isValidObjectValue(value: phrase_22char)
          }
          //
          if (json["phrase_32char"]) != nil
          {
              phrase_32char = String(describing: json["phrase_32char"]!)
              phrase_32char = APIManager.shared.isValidObjectValue(value: phrase_32char)
          }
          //
          if (json["subphrase_pt1"]) != nil
          {
              subphrase_pt1 = String(describing: json["subphrase_pt1"]!)
              subphrase_pt1 = APIManager.shared.isValidObjectValue(value: subphrase_pt1)
          }
          //
          if (json["subphrase_pt2"]) != nil
          {
              subphrase_pt2 = String(describing: json["subphrase_pt2"]!)
              subphrase_pt2 = APIManager.shared.isValidObjectValue(value: subphrase_pt2)
          }
          //
          if (json["subphrase_pt3"]) != nil
          {
              subphrase_pt3 = String(describing: json["subphrase_pt3"]!)
              subphrase_pt3 = APIManager.shared.isValidObjectValue(value: subphrase_pt3)
          }
          //
          if (json["precip_type"]) != nil
          {
              precip_type = String(describing: json["precip_type"]!)
              precip_type = APIManager.shared.isValidObjectValue(value: precip_type)
          }
          //
          if (json["rh"]) != nil
          {
              rh = String(describing: json["rh"]!)
              rh = APIManager.shared.isValidObjectValue(value: rh)
          }
          //
          if (json["wspd"]) != nil
          {
              wspd = String(describing: json["wspd"]!)
              wspd = APIManager.shared.isValidObjectValue(value: wspd)
          }
          //
          if (json["wdir"]) != nil
          {
              wdir = String(describing: json["wdir"]!)
              wdir = APIManager.shared.isValidObjectValue(value: wdir)
          }
          //
          if (json["wdir_cardinal"]) != nil
          {
              wdir_cardinal = String(describing: json["wdir_cardinal"]!)
              wdir_cardinal = APIManager.shared.isValidObjectValue(value: wdir_cardinal)
          }
          //
          if (json["clds"]) != nil
          {
              clds = String(describing: json["clds"]!)
              clds = APIManager.shared.isValidObjectValue(value: clds)
          }
          //
          if (json["pop_phrase"]) != nil
          {
              pop_phrase = String(describing: json["pop_phrase"]!)
              pop_phrase = APIManager.shared.isValidObjectValue(value: pop_phrase)
          }
          //
          if (json["temp_phrase"]) != nil
          {
              temp_phrase = String(describing: json["temp_phrase"]!)
              temp_phrase = APIManager.shared.isValidObjectValue(value: temp_phrase)
          }
          //
          if (json["accumulation_phrase"]) != nil
          {
              accumulation_phrase = String(describing: json["accumulation_phrase"]!)
              accumulation_phrase = APIManager.shared.isValidObjectValue(value: accumulation_phrase)
          }
          //
          if (json["wind_phrase"]) != nil
          {
              wind_phrase = String(describing: json["wind_phrase"]!)
              wind_phrase = APIManager.shared.isValidObjectValue(value: wind_phrase)
          }
          //
          if (json["shortcast"]) != nil
          {
              shortcast = String(describing: json["shortcast"]!)
              shortcast = APIManager.shared.isValidObjectValue(value: shortcast)
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
          if (json["snow_code"]) != nil
          {
              snow_code = String(describing: json["snow_code"]!)
              snow_code = APIManager.shared.isValidObjectValue(value: snow_code)
          }
          //
          if (json["vocal_key"]) != nil
          {
              vocal_key = String(describing: json["vocal_key"]!)
              vocal_key = APIManager.shared.isValidObjectValue(value: vocal_key)
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
          if (json["uv_index_raw"]) != nil
          {
              uv_index_raw = String(describing: json["uv_index_raw"]!)
              uv_index_raw = APIManager.shared.isValidObjectValue(value: uv_index_raw)
          }
          //
          if (json["uv_warning"]) != nil
          {
              uv_warning = String(describing: json["uv_warning"]!)
              uv_warning = APIManager.shared.isValidObjectValue(value: uv_warning)
          }
          //
          if (json["uv_desc"]) != nil
          {
              uv_desc = String(describing: json["uv_desc"]!)
              uv_desc = APIManager.shared.isValidObjectValue(value: uv_desc)
          }
          //
          if (json["golf_index"]) != nil
          {
              golf_index = String(describing: json["golf_index"]!)
              golf_index = APIManager.shared.isValidObjectValue(value: golf_index)
          }
          //
          if (json["golf_category"]) != nil
          {
              golf_category = String(describing: json["golf_category"]!)
              golf_category = APIManager.shared.isValidObjectValue(value: golf_category)
          }
      }
}


