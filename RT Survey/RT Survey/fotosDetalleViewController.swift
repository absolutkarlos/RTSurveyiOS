//
//  fotosDetalleViewController.swift
//  RTSurvey
//
//  Created by Idapps on 2/11/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit
import DKImagePickerController

class fotosDetalleViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var fotoGrid: UICollectionView!
    @IBOutlet weak var seleccionarFotos: UIButton!
    @IBOutlet weak var borrarFotos: UIButton!
    
    let pickerController = DKImagePickerController()
    
    /// Forces selection of tapped image immediatly.
    internal var singleSelect = false
    
    internal var maxSelectableCount = 999
    
   
    /// Set the showsEmptyAlbums to specify whether or not the empty albums is shown in the picker.
    internal var showsEmptyAlbums = true
    
    /// The type of picker interface to be displayed by the controller.
    internal var assetType: DKImagePickerControllerAssetType = .AllAssets
    
    /// If sourceType is Camera will cause the assetType & maxSelectableCount & allowMultipleTypes & defaultSelectedAssets to be ignored.
    internal var sourceType: DKImagePickerControllerSourceType = [.Camera, .Photo]
    
    /// Whether allows to select photos and videos at the same time.
    internal var allowMultipleTypes = true
    
    /// If YES, and the requested image is not stored on the local device, the Picker downloads the image from iCloud.
    internal var autoDownloadWhenAssetIsInCloud = true
    
    /// Determines whether or not the rotation is enabled.
    internal var allowsLandscape = false
    
    /// The callback block is executed when user pressed the cancel button.
    internal var didCancel: (() -> Void)?
    internal var showsCancelButton = false
    
    /// The callback block is executed when user pressed the select button.
    internal var didSelectAssets: ((assets: [DKAsset]) -> Void)?
    
    /// It will have selected the specific assets.
    internal var defaultSelectedAssets: [DKAsset]?
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let titulo = "Fotos"
        NSNotificationCenter.defaultCenter().postNotificationName("cambiarTituloDNav", object: titulo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            print("didSelectAssets")
            print(assets)
        }
        
        self.presentViewController(pickerController, animated: true) {}
        
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
