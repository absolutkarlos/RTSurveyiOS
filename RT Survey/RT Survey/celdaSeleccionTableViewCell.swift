//
//  celdaSeleccionTableViewCell.swift
//  RTSurvey
//
//  Created by Idapps on 2/13/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit

class celdaSeleccionTableViewCell: UITableViewCell {

    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var seleccion: UISwitch!
    @IBOutlet weak var activado: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = g.aux.UIColorFromRGB("f2f2f2", alpha: 1)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func activo(sender: AnyObject) {
        if seleccion.on {
            activado.text = "Si"
        }
        else {
            activado.text = "No"
        }
    }
}
