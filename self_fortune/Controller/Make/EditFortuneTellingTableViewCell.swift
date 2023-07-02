//
//  EditFortuneTellingTableViewCell.swift
//  self_fortune
//
//  Created by 辻野竜志 on 2023/06/23.
//

import UIKit

class EditFortuneTellingTableViewCell: UITableViewCell{

    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var showPercentLabel: UILabel!
    @IBOutlet weak var affinity: UILabel!
    @IBOutlet weak var affinityText: UILabel!
    @IBOutlet weak var adviceText: UILabel!
    @IBOutlet weak var exitButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
