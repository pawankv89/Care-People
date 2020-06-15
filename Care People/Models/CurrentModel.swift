//
//  CurrentModel.swift
//  Care People
//
//  Created by Pawan kumar on 14/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit
import Foundation

struct CurrentModel {

      var  cloudCeiling: String = ""
      var  cloudCoverPhrase: String = ""
      var  dayOfWeek: String = ""
      var  dayOrNight: String = ""
      var  expirationTimeUtc: String = ""
      var  iconCode: String = ""
      var  iconCodeExtend: String = ""
      var  obsQualifierCode: String = ""
      var  obsQualifierSeverity: String = ""
      var  precip1Hour: String = ""
      var  precip6Hour: String = ""
      var  precip24Hour: String = ""
      var  pressureAltimeter: String = ""
      var  pressureChange: String = ""
      var  pressureMeanSeaLevel: String = ""
      var  pressureTendencyCode: String = ""
      var  pressureTendencyTrend: String = ""
      var  relativeHumidity: String = ""
      var  snow1Hour: String = ""
      var  snow6Hour: String = ""
      var  snow24Hour: String = ""
      var  sunriseTimeLocal: String = ""
      var  sunriseTimeUtc: String = ""
      var  sunsetTimeLocal: String = ""
      var  sunsetTimeUtc: String = ""
      var  temperature: String = ""
      var  temperatureChange24Hour: String = ""
      var  temperatureDewPoint: String = ""
      var  temperatureFeelsLike: String = ""
      var  temperatureHeatIndex: String = ""
      var  temperatureMax24Hour: String = ""
      var  temperatureMaxSince7Am: String = ""
      var  temperatureMin24Hour: String = ""
      var  temperatureWindChill: String = ""
      var  uvDescription: String = ""
      var  uvIndex: String = ""
      var  validTimeLocal: String = ""
      var  validTimeUtc: String = ""
      var  visibility: String = ""
      var  windDirection: String = ""
      var  windDirectionCardinal: String = ""
      var  windGust: String = ""
      var  windSpeed: String = ""
      var  wxPhraseLong: String = ""
      var  wxPhraseMedium: String = ""
      var  wxPhraseShort: String = ""
    
    init?(json: [String: Any]) {
    
        //
        if (json["cloudCeiling"]) != nil
        {
            cloudCeiling = String(describing: json["cloudCeiling"]!)
            cloudCeiling = APIManager.shared.isValidObjectValue(value: cloudCeiling)
        }
        //
        if (json["cloudCoverPhrase"]) != nil
        {
            cloudCoverPhrase = String(describing: json["cloudCoverPhrase"]!)
            cloudCoverPhrase = APIManager.shared.isValidObjectValue(value: cloudCoverPhrase)
        }
        //
        if (json["dayOfWeek"]) != nil
        {
            dayOfWeek = String(describing: json["dayOfWeek"]!)
            dayOfWeek = APIManager.shared.isValidObjectValue(value: dayOfWeek)
        }
        //
        if (json["dayOrNight"]) != nil
        {
            dayOrNight = String(describing: json["dayOrNight"]!)
            dayOrNight = APIManager.shared.isValidObjectValue(value: dayOrNight)
        }
        //
        if (json["expirationTimeUtc"]) != nil
        {
            expirationTimeUtc = String(describing: json["expirationTimeUtc"]!)
            expirationTimeUtc = APIManager.shared.isValidObjectValue(value: expirationTimeUtc)
        }
        //
        if (json["iconCode"]) != nil
        {
            iconCode = String(describing: json["iconCode"]!)
            iconCode = APIManager.shared.isValidObjectValue(value: iconCode)
        }
        //
        if (json["iconCodeExtend"]) != nil
        {
            iconCodeExtend = String(describing: json["iconCodeExtend"]!)
            iconCodeExtend = APIManager.shared.isValidObjectValue(value: iconCodeExtend)
        }
        //
        if (json["obsQualifierCode"]) != nil
        {
            obsQualifierCode = String(describing: json["obsQualifierCode"]!)
            obsQualifierCode = APIManager.shared.isValidObjectValue(value: obsQualifierCode)
        }
        //
        if (json["obsQualifierSeverity"]) != nil
        {
            obsQualifierSeverity = String(describing: json["obsQualifierSeverity"]!)
            obsQualifierSeverity = APIManager.shared.isValidObjectValue(value: obsQualifierSeverity)
        }
        //
        if (json["pressureTendencyTrend"]) != nil
        {
            pressureTendencyTrend = String(describing: json["pressureTendencyTrend"]!)
            pressureTendencyTrend = APIManager.shared.isValidObjectValue(value: pressureTendencyTrend)
        }
        //
        if (json["precip6Hour"]) != nil
        {
            precip6Hour = String(describing: json["precip6Hour"]!)
            precip6Hour = APIManager.shared.isValidObjectValue(value: precip6Hour)
        }
        //
        if (json["precip24Hour"]) != nil
        {
            precip24Hour = String(describing: json["precip24Hour"]!)
            precip24Hour = APIManager.shared.isValidObjectValue(value: precip24Hour)
        }
        //
        if (json["pressureAltimeter"]) != nil
        {
            pressureAltimeter = String(describing: json["pressureAltimeter"]!)
            pressureAltimeter = APIManager.shared.isValidObjectValue(value: pressureAltimeter)
        }
        //
        if (json["pressureChange"]) != nil
        {
            pressureChange = String(describing: json["pressureChange"]!)
            pressureChange = APIManager.shared.isValidObjectValue(value: pressureChange)
        }
        //
        if (json["pressureMeanSeaLevel"]) != nil
        {
            pressureMeanSeaLevel = String(describing: json["pressureMeanSeaLevel"]!)
            pressureMeanSeaLevel = APIManager.shared.isValidObjectValue(value: pressureMeanSeaLevel)
        }
        //
        if (json["pressureTendencyCode"]) != nil
        {
            pressureTendencyCode = String(describing: json["pressureTendencyCode"]!)
            pressureTendencyCode = APIManager.shared.isValidObjectValue(value: pressureTendencyCode)
        }
        //
        if (json["relativeHumidity"]) != nil
        {
            relativeHumidity = String(describing: json["relativeHumidity"]!)
            relativeHumidity = APIManager.shared.isValidObjectValue(value: relativeHumidity)
        }
        //
        if (json["snow1Hour"]) != nil
        {
            snow1Hour = String(describing: json["snow1Hour"]!)
            snow1Hour = APIManager.shared.isValidObjectValue(value: snow1Hour)
        }
        //
        if (json["snow6Hour"]) != nil
        {
            snow6Hour = String(describing: json["snow6Hour"]!)
            snow6Hour = APIManager.shared.isValidObjectValue(value: snow6Hour)
        }
        //
        if (json["snow24Hour"]) != nil
        {
            snow24Hour = String(describing: json["snow24Hour"]!)
            snow24Hour = APIManager.shared.isValidObjectValue(value: snow24Hour)
        }
        //
        if (json["sunriseTimeLocal"]) != nil
        {
            sunriseTimeLocal = String(describing: json["sunriseTimeLocal"]!)
            sunriseTimeLocal = APIManager.shared.isValidObjectValue(value: sunriseTimeLocal)
        }
        //
        if (json["sunriseTimeUtc"]) != nil
        {
            sunriseTimeUtc = String(describing: json["sunriseTimeUtc"]!)
            sunriseTimeUtc = APIManager.shared.isValidObjectValue(value: sunriseTimeUtc)
        }
        //
        if (json["sunsetTimeLocal"]) != nil
        {
            sunsetTimeLocal = String(describing: json["sunsetTimeLocal"]!)
            sunsetTimeLocal = APIManager.shared.isValidObjectValue(value: sunsetTimeLocal)
        }
        //
        if (json["sunsetTimeUtc"]) != nil
        {
            sunsetTimeUtc = String(describing: json["sunsetTimeUtc"]!)
            sunsetTimeUtc = APIManager.shared.isValidObjectValue(value: sunsetTimeUtc)
        }
        //
        if (json["temperature"]) != nil
        {
            temperature = String(describing: json["temperature"]!)
            temperature = APIManager.shared.isValidObjectValue(value: temperature)
        }
        //
        if (json["temperatureChange24Hour"]) != nil
        {
            temperatureChange24Hour = String(describing: json["temperatureChange24Hour"]!)
            temperatureChange24Hour = APIManager.shared.isValidObjectValue(value: temperatureChange24Hour)
        }
        //
        if (json["temperatureDewPoint"]) != nil
        {
            temperatureDewPoint = String(describing: json["temperatureDewPoint"]!)
            temperatureDewPoint = APIManager.shared.isValidObjectValue(value: temperatureDewPoint)
        }
        //
        if (json["temperatureFeelsLike"]) != nil
        {
            temperatureFeelsLike = String(describing: json["temperatureFeelsLike"]!)
            temperatureFeelsLike = APIManager.shared.isValidObjectValue(value: temperatureFeelsLike)
        }
        //
        if (json["temperatureHeatIndex"]) != nil
        {
            temperatureHeatIndex = String(describing: json["temperatureHeatIndex"]!)
            temperatureHeatIndex = APIManager.shared.isValidObjectValue(value: temperatureHeatIndex)
        }
        //
        if (json["temperatureMax24Hour"]) != nil
        {
            temperatureMax24Hour = String(describing: json["temperatureMax24Hour"]!)
            temperatureMax24Hour = APIManager.shared.isValidObjectValue(value: temperatureMax24Hour)
        }
        //
        if (json["temperatureMaxSince7Am"]) != nil
        {
            temperatureMaxSince7Am = String(describing: json["temperatureMaxSince7Am"]!)
            temperatureMaxSince7Am = APIManager.shared.isValidObjectValue(value: temperatureMaxSince7Am)
        }
        //
        if (json["temperatureMin24Hour"]) != nil
        {
            temperatureMin24Hour = String(describing: json["temperatureMin24Hour"]!)
            temperatureMin24Hour = APIManager.shared.isValidObjectValue(value: temperatureMin24Hour)
        }
        //
        if (json["temperatureWindChill"]) != nil
        {
            temperatureWindChill = String(describing: json["temperatureWindChill"]!)
            temperatureWindChill = APIManager.shared.isValidObjectValue(value: temperatureWindChill)
        }
        //
        if (json["uvDescription"]) != nil
        {
            uvDescription = String(describing: json["uvDescription"]!)
            uvDescription = APIManager.shared.isValidObjectValue(value: uvDescription)
        }
        //
        if (json["uvIndex"]) != nil
        {
            uvIndex = String(describing: json["uvIndex"]!)
            uvIndex = APIManager.shared.isValidObjectValue(value: uvIndex)
        }
        //
        if (json["validTimeLocal"]) != nil
        {
            validTimeLocal = String(describing: json["validTimeLocal"]!)
            validTimeLocal = APIManager.shared.isValidObjectValue(value: validTimeLocal)
        }
        //
        if (json["validTimeUtc"]) != nil
        {
            validTimeUtc = String(describing: json["validTimeUtc"]!)
            validTimeUtc = APIManager.shared.isValidObjectValue(value: validTimeUtc)
        }
        //
        if (json["visibility"]) != nil
        {
            visibility = String(describing: json["visibility"]!)
            visibility = APIManager.shared.isValidObjectValue(value: visibility)
        }
        //
        if (json["windDirection"]) != nil
        {
            windDirection = String(describing: json["windDirection"]!)
            windDirection = APIManager.shared.isValidObjectValue(value: windDirection)
        }
        //
        if (json["windDirectionCardinal"]) != nil
        {
            windDirectionCardinal = String(describing: json["windDirectionCardinal"]!)
            windDirectionCardinal = APIManager.shared.isValidObjectValue(value: windDirectionCardinal)
        }
        //
        if (json["windGust"]) != nil
        {
            windGust = String(describing: json["windGust"]!)
            windGust = APIManager.shared.isValidObjectValue(value: windGust)
        }
        //
        if (json["windSpeed"]) != nil
        {
            windSpeed = String(describing: json["windSpeed"]!)
            windSpeed = APIManager.shared.isValidObjectValue(value: windSpeed)
        }
        //
        if (json["wxPhraseLong"]) != nil
        {
            wxPhraseLong = String(describing: json["wxPhraseLong"]!)
            wxPhraseLong = APIManager.shared.isValidObjectValue(value: wxPhraseLong)
        }
        //
        if (json["wxPhraseMedium"]) != nil
        {
            wxPhraseMedium = String(describing: json["wxPhraseMedium"]!)
            wxPhraseMedium = APIManager.shared.isValidObjectValue(value: wxPhraseMedium)
        }
        //
        if (json["wxPhraseShort"]) != nil
        {
            wxPhraseShort = String(describing: json["wxPhraseShort"]!)
            wxPhraseShort = APIManager.shared.isValidObjectValue(value: wxPhraseShort)
        }
    }
}

