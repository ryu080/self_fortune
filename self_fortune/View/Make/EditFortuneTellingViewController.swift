//
//  EditFortuneTellingViewController.swift
//  self_fortune
//
//  Created by 辻野竜志 on 2023/06/23.
//

import UIKit

class EditFortuneTellingViewController: UIViewController {
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var editTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        configureTableView()
        editTableView.backgroundColor = UIColor.clear
        if let data = delegate.info {
            let valueToSave = delegate.info
            let encoder = JSONEncoder()
            if let encodedValue = try? encoder.encode(valueToSave) {
                UserDefaults.standard.set(encodedValue, forKey: "InfoFortune")
            }
        }else {
            if let savedValue = UserDefaults.standard.data(forKey: "InfoFortune") {
                let decoder = JSONDecoder()
                if let value = try? decoder.decode(InfoFortune.self, from: savedValue) {
                    print(value)
                    print("j")// User(name: "capibara", age: 20)
                    delegate.info = value
                }
            }else {
                
            }
        }
    }
    
    func configureTableView() {
        editTableView.delegate = self
        editTableView.dataSource = self
        editTableView.rowHeight = UITableView.automaticDimension
        editTableView.estimatedRowHeight = 50
    }
}

extension EditFortuneTellingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1") as? EditFortuneTellingTableViewCell {
                if let date = delegate.info {
                    cell.label1.text = "segueで1人目の名前を送る"
                    cell.label2.text = "segueで2人目の名前を送る"
                    // cellの背景を透過
                    cell.backgroundColor = UIColor.clear
                    // cell内のcontentViewの背景を透過
                    cell.contentView.backgroundColor = UIColor.clear
                }
                cell.isUserInteractionEnabled = false
                return cell
            }
            
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as? EditFortuneTellingTableViewCell {
                if let date = delegate.info {
                    cell.showPercentLabel.text = "\(date.percent)%"
                    // cellの背景を透過
                    cell.backgroundColor = UIColor.clear
                    // cell内のcontentViewの背景を透過
                    cell.contentView.backgroundColor = UIColor.clear
                }
                cell.isUserInteractionEnabled = false
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3") as? EditFortuneTellingTableViewCell {
                if let date = delegate.info {
                    cell.affinity.text = date.affinity
                    // cellの背景を透過
                    cell.backgroundColor = UIColor.clear
                    // cell内のcontentViewの背景を透過
                    cell.contentView.backgroundColor = UIColor.clear
                }
                cell.isUserInteractionEnabled = false
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell4") as? EditFortuneTellingTableViewCell {
                if let date = delegate.info {
                    cell.affinityText.text = date.affinityText
                    // cellの背景を透過
                    cell.backgroundColor = UIColor.clear
                    // cell内のcontentViewの背景を透過
                    cell.contentView.backgroundColor = UIColor.clear
                }
                cell.isUserInteractionEnabled = false
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell5") as? EditFortuneTellingTableViewCell {
                if let date = delegate.info {
                    cell.adviceText.text = date.adviceText
                    // cellの背景を透過
                    cell.backgroundColor = UIColor.clear
                    // cell内のcontentViewの背景を透過
                    cell.contentView.backgroundColor = UIColor.clear
                }
                cell.isUserInteractionEnabled = false
                return cell
            }
        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell6") as? EditFortuneTellingTableViewCell {
                if let date = delegate.info {
                    // cellの背景を透過
                    cell.backgroundColor = UIColor.clear
                    // cell内のcontentViewの背景を透過
                    cell.contentView.backgroundColor = UIColor.clear
                }
                return cell
            }
        }
        return UITableViewCell()
    }
}
extension EditFortuneTellingViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return UITableView.automaticDimension
//        }
}
