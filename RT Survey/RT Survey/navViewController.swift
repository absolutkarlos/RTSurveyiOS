//
//  navViewController.swift
//  RTSurvey
//
//  Created by Idapps on 2/9/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit

class navViewController: UINavigationController {
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.backgroundColor = g.aux.UIColorFromRGB("333333", alpha: 1)
        self.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Compact)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.translucent = true
        self.navigationBar.tintColor = g.aux.UIColorFromRGB("f2f2f2", alpha: 1)
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: g.aux.UIColorFromRGB("f2f2f2", alpha: 1)]
        //self.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Quadon-UltraBold", size: 18)!,NSForegroundColorAttributeName: g.aux.UIColorFromRGB("221f20", alpha: 1)]
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
