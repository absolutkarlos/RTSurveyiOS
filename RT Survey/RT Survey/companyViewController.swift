//
//  companyViewController.swift
//  RTSurvey
//
//  Created by Idapps on 2/9/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit

class companyViewController: UIViewController {

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let titulo = "Company"
        NSNotificationCenter.defaultCenter().postNotificationName("cambiarTituloNav", object: titulo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = g.aux.UIColorFromRGB("f2f2f2", alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
