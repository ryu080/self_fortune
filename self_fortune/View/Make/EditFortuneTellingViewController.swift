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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1") as? EditFortuneTellingTableViewCell {
                // cellの背景を透過
                cell.backgroundColor = UIColor.clear
                // cell内のcontentViewの背景を透過
                cell.contentView.backgroundColor = UIColor.clear
                cell.isUserInteractionEnabled = false
                return cell
            }
            
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as? EditFortuneTellingTableViewCell {
                // cellの背景を透過
                cell.backgroundColor = UIColor.clear
                // cell内のcontentViewの背景を透過
                cell.contentView.backgroundColor = UIColor.clear
                
                var cellSelectedBgView = UIView()
                cellSelectedBgView.backgroundColor = UIColor.clear
                cell.selectedBackgroundView = cellSelectedBgView
//                cell.isUserInteractionEnabled = false
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3") as? EditFortuneTellingTableViewCell {
                // cellの背景を透過
                cell.backgroundColor = UIColor.clear
                // cell内のcontentViewの背景を透過
                cell.contentView.backgroundColor = UIColor.clear
                
                var cellSelectedBgView = UIView()
                cellSelectedBgView.backgroundColor = UIColor.clear
                cell.selectedBackgroundView = cellSelectedBgView
//                cell.isUserInteractionEnabled = false
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell4") as? EditFortuneTellingTableViewCell {
                // cellの背景を透過
                cell.backgroundColor = UIColor.clear
                // cell内のcontentViewの背景を透過
                cell.contentView.backgroundColor = UIColor.clear
                
                var cellSelectedBgView = UIView()
                cellSelectedBgView.backgroundColor = UIColor.clear
                cell.selectedBackgroundView = cellSelectedBgView
//                cell.isUserInteractionEnabled = false
                return cell
            }
        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell5") as? EditFortuneTellingTableViewCell {
                // cellの背景を透過
                cell.backgroundColor = UIColor.clear
                // cell内のcontentViewの背景を透過
                cell.contentView.backgroundColor = UIColor.clear
                
                var cellSelectedBgView = UIView()
                cellSelectedBgView.backgroundColor = UIColor.clear
                cell.selectedBackgroundView = cellSelectedBgView
//                cell.isUserInteractionEnabled = false
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
