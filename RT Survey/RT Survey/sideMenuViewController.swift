//
//  sideMenuViewController.swift
//  RTSurvey
//
//  Created by Idapps on 2/9/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit
import QuartzCore

class sideMenuViewController: UIViewController {
    
    @IBOutlet weak var lb1: UILabel!
    @IBOutlet weak var lb2: UILabel!
    @IBOutlet weak var lb3: UILabel!
    @IBOutlet weak var lb4: UILabel!
    @IBOutlet weak var lb5: UILabel!
    @IBOutlet weak var lb6: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = g.aux.UIColorFromRGB("f2f2f2", alpha: 1)
        lb1.backgroundColor = UIColor.blackColor()
        lb2.backgroundColor = g.aux.UIColorFromRGB("b22222", alpha: 1)
        lb3.backgroundColor = g.aux.UIColorFromRGB("ffcc00", alpha: 1)
        lb4.backgroundColor = g.aux.UIColorFromRGB("3366cc", alpha: 1)
        lb5.backgroundColor = g.aux.UIColorFromRGB("99cc33", alpha: 1)
        lb6.backgroundColor = g.aux.UIColorFromRGB("009900", alpha: 1)
       
        lb1.layer.cornerRadius = 5
        lb2.layer.cornerRadius = 5
        lb3.layer.cornerRadius = 5
        lb4.layer.cornerRadius = 5
        lb5.layer.cornerRadius = 5
        lb6.layer.cornerRadius = 5
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
