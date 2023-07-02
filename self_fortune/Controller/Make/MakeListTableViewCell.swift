//
//  TableViewCell.swift
//  self_fortune
//
//  Created by 辻野竜志 on 2023/05/29.
//

import UIKit

class MakeListTableViewCell: UITableViewCell {

    @IBOutlet weak var fortuneName: UILabel!
    var bool:Bool = false
    
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var checkLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(fortuneName:String){
        self.fortuneName.text = fortuneName
    }
}
