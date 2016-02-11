//
//  Cache.swift
//  RT Survey
//
//  Created by Idapps on 2/8/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import Foundation

class Cache: NSObject {
    
    var cache : NSCache!
    
    override init() {
        cache = NSCache()
    }
    
    func guardar(llave : String, valor : AnyObject)
    {
        self.cache.setObject(valor, forKey: llave)
    }
    
    /*func guardarJSON(llave : String, valor : JSON)
    {
        self.cache.setObject(valor.object , forKey: llave)
    }*/
    
    func borrarTodo()
    {
        self.cache.removeAllObjects()
    }
    
    func borrarLlave(llave: String)
    {
        self.cache.removeObjectForKey(llave)
    }
    
    func existe(llave: String) -> Bool
    {
        if((self.cache.objectForKey(llave)) != nil)
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func cFotoPerfil() -> String
    {
        if(self.existe("FotoPerfil"))
        {
            return self.cache.objectForKey("FotoPerfil") as! String
        }
        else
        {
            return ""
        }
    }
    
   
    func string(s: String) -> String {
        if(self.existe(s))
        {
            return self.cache.objectForKey(s) as! String!
        }
        else
        {
            return ""
        }
    }
}