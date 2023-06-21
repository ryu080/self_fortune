//
//  MakeResultTableViewCell.swift
//  self_fortune
//
//  Created by 辻野竜志 on 2023/05/30.
//

import UIKit

class MakeResultTableViewCell: UITableViewCell {
    

    @IBOutlet weak var rateLabel1: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var rateLabel2: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var rateLabel3: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var rateLabel4: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
