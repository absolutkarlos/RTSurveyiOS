//
//  fotosDetalleViewController.swift
//  RTSurvey
//
//  Created by Idapps on 2/11/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit

class fotosDetalleViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var fotoGrid: UICollectionView!
    @IBOutlet weak var seleccionarFotos: UIButton!
    @IBOutlet weak var borrarFotos: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let titulo = "Fotos"
        NSNotificationCenter.defaultCenter().postNotificationName("cambiarTituloDNav", object: titulo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func seleccionarFoto(sender: UIButton){
        let alert : UIAlertController = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        alert.addAction(UIAlertAction(title: "Galería", style: UIAlertActionStyle.Default, handler: self.abrirGaleria))
        //alert.addAction(UIAlertAction(title: "Tomar Foto", style: UIAlertActionStyle.Default, handler: self.tomarFoto))
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.Default, handler: nil))
        
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func abrirGaleria(alert: UIAlertAction!){
        if UIImagePickerController.availableMediaTypesForSourceType(.PhotoLibrary) != nil {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            presentViewController(imagePicker, animated: true, completion: nil)
        } else {
            noCamera()
        }
        
    }
    func noCamera(){
        let alertVC = UIAlertController(title: "No Camera", message: "Sorry, Gallery is not accessible.", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style:.Default, handler: nil)
        alertVC.addAction(okAction)
        presentViewController(alertVC, animated: true, completion: nil)
    }
    
    //MARK: - Delegates
    //What to do when the picker returns with a photo
    

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //var chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        //myImageView.contentMode = .ScaleAspectFit //3
        //myImageView.image = chosenImage //4
        dismissViewControllerAnimated(true, completion: nil) //5
    }
    
    //What to do if the image picker cancels.
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
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
