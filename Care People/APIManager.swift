//
//  APIManager.swift
//  Care People
//
//  Created by Pawan kumar on 14/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import Foundation
import UIKit

class APIManager {
    
    public enum HTTPMethod: String {
        case OPTIONS = "OPTIONS"
        case GET     = "GET"
        case HEAD    = "HEAD"
        case POST    = "POST"
        case PUT     = "PUT"
        case PATCH   = "PATCH"
        case DELETE  = "DELETE"
        case TRACE   = "TRACE"
        case CONNECT = "CONNECT"
    }
    
    static let shared = APIManager()
    
    //Constructor
    private init() { }
    
    func isValidObjectValue(value: String) -> String {
        
        var isValidString = value
        if isValidString == "null" || isValidString == "<null>" || isValidString == "(null)"  {
            isValidString = ""
        }
        return isValidString
    }
    
    func customCommonHeaders() -> [String : String] {

          var headers: Dictionary <String, String> = [:]
          
          //Fixed Headers Authorization
          headers["Accept"] = "application/json"
          //headers["Content-Type"] = "application/json"
          //headers["Content-Type"] = "application/json; charset=utf-8"
          //headers["Content-Type"] = "application/x-www-form-urlencoded"
          
          return headers
      }
    
    //
       
       func observationsCurrentApi(parameters: Dictionary<String, String>, completionHandler: @escaping (NSDictionary)-> ()) {
           
           let functionName: String = #function
           
           //Check Internet Connection
           if NetworkManager.shared.isConnected == false {
               
               //Toast.shared.showToastMessage(message: "You are not connected to the internet please try later")
               completionHandler([:]) //Go back
               return
           }
        
        let lat: String = parameters["lat"]!
        let lng: String = parameters["lng"]!
        let units: String = parameters["units"]!
        let language: String = parameters["language"]!
        let format: String = parameters["format"]!
        let apiKey: String = parameters["apiKey"]!
         
        // Set up the URL request
        var urlEndpoint: String = "https://api.weather.com/v3/wx/observations/current?geocode=\(lat),\(lng)&units=\(units)&language=\(language)&format=\(format)&apiKey=\(apiKey)"
        
           //Encoaded URL before Request
           urlEndpoint = urlEndpoint.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
           
           //Print
           DLogs.logs(printMessage: "\(functionName) Request", printDetails: urlEndpoint)
           
           //Print
           DLogs.logs(printMessage: "\(functionName) Parameters", printDetails: parameters)
           
           //HTTP REQUEST HERE
           var request = URLRequest(url: URL(string: urlEndpoint)!)
           
           request.httpMethod = HTTPMethod.GET.rawValue
           
           //Add Custom Common Headers
           request.allHTTPHeaderFields = self.customCommonHeaders()
           
           let task = URLSession.shared.dataTask(with: request as URLRequest) {
               (data, response, error) -> Void in
               if let unwrappedData = data {
                   do {
                       
                       let responseObject: Any = try JSONSerialization.jsonObject(with: unwrappedData, options: JSONSerialization.ReadingOptions.mutableContainers)
                       
                       //Print
                       DLogs.logs(printMessage: "\(functionName) Response", printDetails: responseObject)
                       
                       //Check Status Code
                       if let httpStatus = response as? HTTPURLResponse {
                           
                           if  httpStatus.statusCode <= 299  && httpStatus.statusCode >= 200 {
                               //Print
                               DLogs.logs(printMessage: "\(functionName) statusCode should be 200, but is", printDetails: httpStatus.statusCode)
                               
                               if responseObject is NSDictionary {
                              
                                   let resposeList: NSDictionary = responseObject as! NSDictionary
                                   completionHandler(resposeList)
                               }
                               if responseObject is Array<Any> {
                                
                                   //let resposeList: Array<Any> = (responseObject as? Array<Any>)!
                                   //completionHandler(resposeList)
                                   completionHandler([:])
                               }
                           }
                           else{
                               //Wrong Status code here
                           }
                       }
                   }
                   catch {
                       
                       //Got Respomnse here
                       completionHandler([:])
                   }
               }
           }
           task.resume()
       }
    
    func dailyForecast3DayApi(parameters: Dictionary<String, String>, completionHandler: @escaping (NSDictionary)-> ()) {
        
        let functionName: String = #function
        
        //Check Internet Connection
        if NetworkManager.shared.isConnected == false {
            
            //Toast.shared.showToastMessage(message: "You are not connected to the internet please try later")
            completionHandler([:]) //Go back
            return
        }
     
     let lat: String = parameters["lat"]!
     let lng: String = parameters["lng"]!
     let units: String = parameters["units"]!
     let language: String = parameters["language"]!
     let apiKey: String = parameters["apiKey"]!
      
     // Set up the URL request
     var urlEndpoint: String = "https://api.weather.com/v1/geocode/\(lat)/\(lng)/forecast/daily/3day.json?units=\(units)&language=\(language)&apiKey=\(apiKey)"
     
        //Encoaded URL before Request
        urlEndpoint = urlEndpoint.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        //Print
        DLogs.logs(printMessage: "\(functionName) Request", printDetails: urlEndpoint)
        
        //Print
        DLogs.logs(printMessage: "\(functionName) Parameters", printDetails: parameters)
        
        //HTTP REQUEST HERE
        var request = URLRequest(url: URL(string: urlEndpoint)!)
        
        request.httpMethod = HTTPMethod.GET.rawValue
        
        //Add Custom Common Headers
        request.allHTTPHeaderFields = self.customCommonHeaders()
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) -> Void in
            if let unwrappedData = data {
                do {
                    
                    let responseObject: Any = try JSONSerialization.jsonObject(with: unwrappedData, options: JSONSerialization.ReadingOptions.mutableContainers)
                    
                    //Print
                    DLogs.logs(printMessage: "\(functionName) Response", printDetails: responseObject)
                    
                    //Check Status Code
                    if let httpStatus = response as? HTTPURLResponse {
                        
                        if  httpStatus.statusCode <= 299  && httpStatus.statusCode >= 200 {
                            //Print
                            DLogs.logs(printMessage: "\(functionName) statusCode should be 200, but is", printDetails: httpStatus.statusCode)
                            
                            if responseObject is NSDictionary {
                           
                                let resposeList: NSDictionary = responseObject as! NSDictionary
                                completionHandler(resposeList)
                            }
                            if responseObject is Array<Any> {
                             
                                //let resposeList: Array<Any> = (responseObject as? Array<Any>)!
                                //completionHandler(resposeList)
                                completionHandler([:])
                            }
                        }
                        else{
                            //Wrong Status code here
                        }
                    }
                }
                catch {
                    
                    //Got Respomnse here
                    completionHandler([:])
                }
            }
        }
        task.resume()
    }
}
