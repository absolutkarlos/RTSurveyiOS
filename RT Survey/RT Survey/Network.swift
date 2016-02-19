//
//  Network.swift
//  RT Survey
//
//  Created by Idapps on 2/8/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class Network: NSObject {
    
    var header : [String:String]!
    var token : String!
    var alamo : Alamofire.Manager?
    
    var baseURL, login, logout, action, olvidoPassword : String!
    
    
    override init() {
        let ud = NSUserDefaults.standardUserDefaults()
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForRequest = 60*3 // seconds
        
        self.alamo = Alamofire.Manager(configuration: configuration)
        
        baseURL = "http://rtsurvey.golddata.net/service"
        
        
        login = "/token"
        action = "/api/action"
        logout = "/logout"
        olvidoPassword = "/olvidoPassword"

        
        
        if (ud.stringForKey("Token") != nil)
        {
            header = ["Authorization": ud.stringForKey("Token")!, "Content-Type":"application/json"]
        }
        else
        {
            header = ["Content-Type":"application/json"]
        }
    }
    
    
    
    func regresarHeaderInicial()
    {
        header = ["Content-Type":"application/json"]
    }
    
    func establecerHeader(h : String){
        header = ["Authorization": h, "Content-Type":"application/json"]
    }
    
    func post(uri: String,parametros: [String: AnyObject], callback: (JSON)->Void)
    {
        let url = NSURL(string: baseURL)
        print(parametros,header)
        
        self.alamo!.request(.POST, (url?.URLByAppendingPathComponent(uri))!, headers: header, parameters:parametros, encoding:.URL).responseJSON { response in
            /*   if(response.result == nil)
            {
            callback(nil)
            }
            else
            {
            let resultado = JSON(response.result)
            callback(resultado)
            }*/
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    callback(json)
                    print("JSON: \(json)")
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func put(uri: String,parametros: [String: AnyObject], callback: (JSON)->Void)
    {
        let url = NSURL(string: baseURL + uri)
        self.alamo!.request(.PUT, url!, headers: header, parameters:parametros, encoding:.JSON).responseJSON { response in
            /*   if(response.result == nil)
            {
            callback(nil)
            }
            else
            {
            let resultado = JSON(response.result)
            callback(resultado)
            }*/
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    callback(json)
                    print("JSON: \(json)")
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func delete(uri: String,parametros: [String: AnyObject], callback: (JSON)->Void)
    {
        let url = NSURL(string: baseURL + uri)
        self.alamo!.request(.DELETE, url!, headers: header, parameters:parametros, encoding:.JSON).responseJSON { response in
            /*   if(response.result == nil)
            {
            callback(nil)
            }
            else
            {
            let resultado = JSON(response.result)
            callback(resultado)
            }*/
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    callback(json)
                    print("JSON: \(json)")
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func getParametros(uri: String,parametros: [String: AnyObject], callback: (JSON)->Void)
    {
        let url = NSURL(string: baseURL + uri)
        self.alamo!.request(.GET, url!, headers: header, parameters:parametros, encoding:.JSON).responseJSON { response in
            /*   if(response.result == nil)
            {
            callback(nil)
            }
            else
            {
            let resultado = JSON(response.result)
            callback(resultado)
            }*/
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    callback(json)
                    print("JSON: \(json)")
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func get(uri: String, callback: (JSON)->Void)
    {
        let url = NSURL(string: baseURL)
        self.alamo?.request(.GET, (url?.URLByAppendingPathComponent(uri))!, headers:header, encoding: .JSON).responseJSON(completionHandler: {
            response in
            /*   if(response.result == nil)
            {
            callback(nil)
            }
            else
            {
            let resultado = JSON(response.result)
            callback(resultado)
            }*/
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    callback(json)
                    print("JSON: \(json)")
                }
            case .Failure(let error):
                print(error)
            }
        })
    }
    
}