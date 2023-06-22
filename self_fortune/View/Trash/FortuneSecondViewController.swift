//
//  FortuneSecondViewController.swift
//  self_fortune
//
//  Created by 辻野竜志 on 2023/05/12.
//

import UIKit

class FortuneSecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var fortuneLabel: UILabel!
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var name = ""
    let birthday = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "\(name)さん\nの占い結果"
        fortuneLabel.text = delegate.text
        fortuneLabel.numberOfLines = 0
        fortuneLabel.sizeToFit()
    }
}
