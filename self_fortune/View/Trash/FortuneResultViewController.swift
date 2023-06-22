//
//  FortuneResultViewController.swift
//  self_fortune
//
//  Created by 辻野竜志 on 2023/06/04.
//

import UIKit

class FortuneResultViewController: UIViewController {
    var info:InfoFortune?
    let delegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let date = delegate.info {
            label1.text = date.jobText
            label2.text = date.loveText
            label3.text = date.fortuneName
            label4.text = date.adviceText
            //label5.text = date.affinityText
            
            print(date)
        }

        label1.backgroundColor = UIColor.white
        //label1.layer.cornerRadius = 10
        //label1.layer.masksToBounds = true

        label2.backgroundColor = UIColor.white

        label3.backgroundColor = UIColor.white

        label4.backgroundColor = UIColor.white

        label5.backgroundColor = UIColor.white
    }
}
