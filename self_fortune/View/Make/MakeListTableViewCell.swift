//
//  TableViewCell.swift
//  self_fortune
//
//  Created by 辻野竜志 on 2023/05/29.
//

import UIKit

class MakeListTableViewCell: UITableViewCell {

    @IBOutlet weak var fortuneName: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    var bool:Bool = false
    
    @IBOutlet weak var listView: UIView!
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
    //星のオンオフ
    func set(bool:Bool){
        if bool == true {
            checkButton.setTitle("⭐︎", for: .normal)
            self.bool = false
        }else if bool == false {
            checkButton.setTitle("⭐️", for: .normal)
            self.bool = true
        }
    }
    @IBAction func checkButton(_ sender: Any) {
        bool ? set(bool: bool): set(bool: bool)
    }
}
