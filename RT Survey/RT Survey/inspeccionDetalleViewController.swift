//
//  inspeccionDetalleViewController.swift
//  RTSurvey
//
//  Created by Idapps on 2/11/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit

class inspeccionDetalleViewController: UIViewController {

    @IBOutlet var contenedor: UIView!
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let titulo = "Inspección"
        NSNotificationCenter.defaultCenter().postNotificationName("cambiarTituloDNav", object: titulo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = g.aux.UIColorFromRGB("f2f2f2", alpha: 1)
        contenedor.backgroundColor = g.aux.UIColorFromRGB("f2f2f2", alpha: 1)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        self.view.endEditing(true)
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
