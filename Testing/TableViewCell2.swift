//
//  TableViewCell2.swift
//  Testing
//
//  Created by Fahmi Salman Nurfikri on 4/9/17.
//  Copyright © 2017 Fahmi Salman Nurfikri. All rights reserved.
//

import UIKit

class TableViewCell2: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var bandLabel: UILabel!
    @IBOutlet weak var stageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
