//
//  Auxiliares.swift
//  RT Survey
//
//  Created by Idapps on 2/8/16.
//  Copyright © 2016 Idapps. All rights reserved.
//


import UIKit
import Foundation

class Auxiliares: NSObject {
    
    func UIColorFromRGB(colorCode: String, alpha: Float = 1.0) -> UIColor {
        let scanner = NSScanner(string:colorCode)
        var color:UInt32 = 0;
        scanner.scanHexInt(&color)
        
        let mask = 0x000000FF
        let r = CGFloat(Float(Int(color >> 16) & mask)/255.0)
        let g = CGFloat(Float(Int(color >> 8) & mask)/255.0)
        let b = CGFloat(Float(Int(color) & mask)/255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
    
    func alertar(titulo: String, mensaje: String) -> UIAlertController {
        let alert : UIAlertController = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        return alert
    }
    
    
    
    func reducirSizeFoto(imagen: UIImage) -> NSData
    {
        let x : UIImage = UIImage(data: UIImageJPEGRepresentation(imagen, 0.0)!)!
        let datax = UIImagePNGRepresentation(x)
        return datax!
    }
    
    func aBase64(imagen: NSData) -> String
    {
        if(imagen != "")
        {
            let b64 = imagen.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
            return b64
        }
        else
        {
            return ""
        }
        
    }
    
    func tb64aImagen(b64: String) -> UIImage
    {
        if(b64 != "")
        {
            let decodedData = NSData(base64EncodedString: b64, options: NSDataBase64DecodingOptions(rawValue: 0))
            let decodedimage = UIImage(data: decodedData!)!
            return decodedimage as UIImage
        }
        else
        {
            return UIImage()
        }
        
    }
}