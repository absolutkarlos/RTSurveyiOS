//
//  celdaContadorTableViewCell.swift
//  RTSurvey
//
//  Created by Idapps on 2/16/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit

class celdaContadorTableViewCell: UITableViewCell {


    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var dia: UILabel!
    @IBOutlet weak var contador: UIStepper!
    
    var valor: Double = 0
    var index: NSIndexPath!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = g.aux.UIColorFromRGB("f2f2f2", alpha: 1)
    }


    @IBAction func contadorDia(sender: UIStepper) {
        self.dia.text = String(format: "%.f Días", contador.value)
        print(String(format: "%.f Días", contador.value))
        NSNotificationCenter.defaultCenter().postNotificationName("actualizarCelda", object: nil)
    }
   
}
