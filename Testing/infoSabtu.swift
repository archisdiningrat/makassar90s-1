//
//  infoSabtu.swift
//  Testing
//
//  Created by Fahmi Salman Nurfikri on 4/16/17.
//  Copyright © 2017 Fahmi Salman Nurfikri. All rights reserved.
//

import UIKit

class infoSabtu: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var bandLabel: UILabel!
    @IBOutlet weak var desc: UITextView!
    
    var labelText = String()
    
    override func viewDidLoad() {
        
        bandLabel.text = labelText

    }

    
}
