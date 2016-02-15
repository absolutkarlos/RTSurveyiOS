//
//  fotosDetalleViewController.swift
//  RTSurvey
//
//  Created by Idapps on 2/11/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit
import DKImagePickerController

class fotosDetalleViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    
    @IBOutlet weak var fotoGrid: UICollectionView!
    @IBOutlet weak var seleccionarFotos: UIButton!
    @IBOutlet weak var borrarFotos: UIButton!
    
    var fotosSeleccionadas:NSMutableArray = []
    
    let pickerController = DKImagePickerController()
    let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    
    internal var singleSelect = false
    internal var maxSelectableCount = 20
    internal var showsEmptyAlbums = true
    
    /// The type of picker interface to be displayed by the controller.
    internal var assetType: DKImagePickerControllerAssetType = .AllPhotos
    internal var sourceType: DKImagePickerControllerSourceType = .Photo
    internal var allowMultipleTypes = true
    
    /// If YES, and the requested image is not stored on the local device, the Picker downloads the image from iCloud.
    internal var autoDownloadWhenAssetIsInCloud = true
    
    /// Determines whether or not the rotation is enabled.
    internal var allowsLandscape = false
    
    /// The callback block is executed when user pressed the cancel button.
    internal var didCancel: (() -> Void)?
    internal var showsCancelButton = true
    internal var didSelectAssets: ((assets: [DKAsset]) -> Void)?
    internal var defaultSelectedAssets: [DKAsset]?
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let titulo = "Fotos"
        NSNotificationCenter.defaultCenter().postNotificationName("cambiarTituloDNav", object: titulo)
        self.fotoGrid.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fotoGrid.dataSource = self
        fotoGrid.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func borrarSeleccion(sender: UIButton) {
        self.fotosSeleccionadas = []
        fotoGrid.reloadData()
    }
    
    @IBAction func seleccionarFoto(sender: UIButton){
        let alert : UIAlertController = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        alert.addAction(UIAlertAction(title: "Galería", style: UIAlertActionStyle.Default, handler: self.abrirGaleria))
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.Default, handler: nil))
       
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func abrirGaleria(alert: UIAlertAction!){
        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            print("didSelectAssets")
            for asset in assets {
                asset.fetchOriginalImage(true, completeBlock: { image, info in
                    self.fotosSeleccionadas.addObject(UIImagePNGRepresentation(image!)!)
                })
            }
        }
        self.presentViewController(pickerController, animated: true) {}
        
    }
    

    //MARK: - Delegates Collection View
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.fotosSeleccionadas.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("celdaImagenGrid", forIndexPath: indexPath) as! fotoCollectionViewCell
        
        cell.foto.frame.size.width = 165
        cell.foto.frame.size.height = 165
        cell.foto.backgroundColor = UIColor.yellowColor()
        cell.foto.image = UIImage(data: self.fotosSeleccionadas[indexPath.row] as! NSData)
        cell.foto.contentMode = UIViewContentMode.ScaleAspectFill
        return cell
    }
    
    
    
    //Use for size
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
            return CGSize(width: 165, height: 165)
            
    }
    //Use for interspacing

    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
            return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
            return 1
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let myLayout = UICollectionViewFlowLayout()
        
        myLayout.scrollDirection =
            UICollectionViewScrollDirection.Vertical
        
        self.fotoGrid.setCollectionViewLayout(myLayout,
            animated: true)
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
