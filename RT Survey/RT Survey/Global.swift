//
//  Global.swift
//  RT Survey
//
//  Created by Idapps on 2/8/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import Foundation

class Global {
    
    let aux: Auxiliares!
    let db: Network!
    let c : Cache!
    let ud = NSUserDefaults.standardUserDefaults()
    
    
    static var instance: Global!
    // SHARED INSTANCE
    class func sharedInstance() -> Global {
        self.instance = (self.instance ?? Global())
        return self.instance
    }
    
    init()
    {
        self.aux = Auxiliares()
        self.db = Network()
        self.c = Cache()
    }
}


let g = Global.sharedInstance()