//
//  fotosDetalleViewController.swift
//  RTSurvey
//
//  Created by Idapps on 2/11/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit

class fotosDetalleViewController: UIViewController {

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let titulo = "Fotos"
        NSNotificationCenter.defaultCenter().postNotificationName("cambiarTituloDNav", object: titulo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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