//
//  celdasPrincipalTableViewCell.swift
//  RTSurvey
//
//  Created by Idapps on 2/9/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit

class celdasPrincipalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var vistaCelda: UIView!
    @IBOutlet weak var colorIndicador: UILabel!
    @IBOutlet weak var tituloCelda: UILabel!
    @IBOutlet weak var ubicacionCelda: UILabel!
    @IBOutlet weak var fechaCelda: UILabel!
    @IBOutlet weak var fondoCelda: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clearColor()

        tituloCelda.tintColor = g.aux.UIColorFromRGB("333333", alpha: 1)
        ubicacionCelda.tintColor = g.aux.UIColorFromRGB("333333", alpha: 1)
        fechaCelda.tintColor = g.aux.UIColorFromRGB("333333", alpha: 1)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
