//
//  loginViewController.swift
//  RTSurvey
//
//  Created by Idapps on 2/17/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit

class loginViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var usuario: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var recordar: UISwitch!
    @IBOutlet var ingresar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        //self.view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        self.view.endEditing(true)
    }
    
    @IBAction func ingresar(sender: UIButton) {
        
        var parametros : [String:String!]!
        parametros = ["UserName":usuario.text,"Password":password.text,"grant_type":"password"]
        
        g.db.get(g.db.action, callback: {
            json in print(json)
        })
        g.db.post(g.db.login, parametros: parametros, callback: {
            json in
            
            print(json)
            
            let userId = json["userId"] //Long
            let token_type = json["token_type"] //String
            let token = json["access_token"] //String
            let expires_in = json["expires_in"] //Miliseconds
            let issued = json[".issued"] //DateTime
            let expires = json[".expires"] //DateTime
            let remember = json["remember"] //Boolean
            let grant_type = json["grant_type"] //String
            

            
            if(token != nil)
            {
                g.ud.setObject(token.string, forKey: "Token")
                g.ud.setObject(grant_type.string, forKey: "Tipo")
                g.ud.setObject(userId.double, forKey: "userId")
                
                g.db.establecerHeader(token.string!)
                
               
            }

            
        })
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == self.usuario {
            self.password.becomeFirstResponder()
            
        }
        else {
            self.view.endEditing(true)
            return true
        }
        return false
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        animateViewMoving(true, moveValue: 57)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        animateViewMoving(false, moveValue: 57)
    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:NSTimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement)
        UIView.commitAnimations()
        
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
