//
//  InfoS.swift
//  Testing
//
//  Created by Fahmi Salman Nurfikri on 4/16/17.
//  Copyright © 2017 Fahmi Salman Nurfikri. All rights reserved.
//

import UIKit

class InfoS: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var labelBand: UILabel!
    @IBOutlet weak var descText: UITextView!
    
    var band = String()
    var desc = String()
    var image = UIImage()
    
    override func viewDidLoad() {
//        super.viewDidLoad()
//        print (band)
        labelBand.text = band
        descText.text = desc
        imgView.image = image

        // Do any additional setup after loading the view.
    }

}
