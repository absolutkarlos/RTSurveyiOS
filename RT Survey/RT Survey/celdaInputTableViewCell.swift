//
//  celdaInputTableViewCell.swift
//  RTSurvey
//
//  Created by Idapps on 2/13/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit

class celdaInputTableViewCell: UITableViewCell {

    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var input: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = g.aux.UIColorFromRGB("f2f2f2", alpha: 1)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
