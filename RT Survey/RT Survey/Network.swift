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
    
    var baseURL, login, logout, olvidoPassword, registrar : String!
    
    let url: Url!
    
    
    internal struct Url {
        var login = "/login"
        var logout = "/logout"
        var olvidoPassword = "/olvidoPassword"
        var registrar = "/signup"
        var registrarInfo = "/registroInfoPersonal"
        var subirFotoPerfil = "/subirFotoPerfil"
        var obtenerFotoPerfil = "/obtenerFotoPerfil"
        
    }
    
    override init() {
        let ud = NSUserDefaults.standardUserDefaults()
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForRequest = 60*3 // seconds
        
        self.alamo = Alamofire.Manager(configuration: configuration)
        
        url = Url()
        //baseURL = "http://127.0.0.1:3000/api/v0.0.1"
        
        
        login = "/login"
        logout = "/logout"
        olvidoPassword = "/olvidoPassword"
        registrar = "/signup"
        
        
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
    
    func llamarConDatos(urlS: String,parametros: [String: AnyObject], callback: (JSON)->Void) {
        
        let uri = urlS
        
        let url = NSURL(string: baseURL + uri)
        self.alamo!.request(.POST, url!, headers: header, parameters:parametros, encoding:.JSON).responseJSON { response in
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
                    print("JSON: \(json)")
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func llamar(urlS: String, callback: (JSON)->Void) {
        
        let uri = urlS
        
        let url = NSURL(string: baseURL + uri)
        self.alamo!.request(.POST, url!, headers: header, encoding:.JSON)
            .responseJSON { response in
               /* if(response.result == nil)
                {
                    callback(nil)
                }
                else
                {
                    let resultado = JSON(response.result
                    callback(resultado)
                }*/
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        print("JSON: \(json)")
                    }
                case .Failure(let error):
                    print(error)
                }
        }
    }
    
}