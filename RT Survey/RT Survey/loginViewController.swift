//
//  loginViewController.swift
//  RTSurvey
//
//  Created by Idapps on 2/17/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    
    @IBOutlet var usuario: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var recordar: UISwitch!
    @IBOutlet var ingresar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ingresar(sender: UIButton) {
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
