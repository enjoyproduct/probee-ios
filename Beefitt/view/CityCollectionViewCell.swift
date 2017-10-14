//
//  CityCollectionViewCell.swift
//  Beefitt
//
//  Created by Admin on 10/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var ivSelected: UIImageView!
    @IBOutlet weak var lblAbbreviation: UILabel!
    @IBOutlet weak var lblCityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
