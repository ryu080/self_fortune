//
//  TestViewController.swift
//  self_fortune
//
//  Created by 辻野竜志 on 2023/05/30.
//

import UIKit
import GoogleMobileAds

class TestViewController: UIViewController {

    @IBOutlet weak var makeResultTableView: UITableView!
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeResultTableView.backgroundColor = UIColor.clear
        if let data = delegate.info {
        }else {
            delegate.info = InfoFortune(fortuneName: "サンプル", fortune: "サンプル", fortuneRate: 0, jobText: "サンプル", jobRate: 0, loveText: "サンプル", loveRate: 0, healthText: "サンプル", healthRate: 0, adviceText: "サンプル") //, affinityText: "サンプル")
        }
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        addBannerViewToView(bannerView)
    }
    
    func rateCount(rate:Int, label1:String, label2:String) -> String {
        switch rate {
        case 1: return label1 + label2 + label2 + label2 + label2
        case 2: return label1 + label1 + label2 + label2 + label2
        case 3: return label1 + label1 + label1 + label2 + label2
        case 4: return label1 + label1 + label1 + label1 + label2
        case 5: return label1 + label1 + label1 + label1 + label1
        default:return label2 + label2 + label2 + label2 + label2
        }
    }

    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(
                item: bannerView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: view.safeAreaLayoutGuide,
                attribute: .bottom,
                multiplier: 1,
                constant: 0),
             NSLayoutConstraint(
                item: bannerView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: 0)])
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
extension TestViewController: UITableViewDelegate {
    
}

extension TestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1") as? MakeResultTableViewCell {
                if let date = delegate.info {
                    cell.label1.text = date.fortune
                    cell.rateLabel1.text = rateCount(rate: date.fortuneRate, label1: "⭐️", label2: "⭐︎")
                    // cellの背景を透過
                    cell.backgroundColor = UIColor.clear
                    // cell内のcontentViewの背景を透過
                    cell.contentView.backgroundColor = UIColor.clear
                }
                cell.isUserInteractionEnabled = false
                return cell
            }
                
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as? MakeResultTableViewCell {
                if let date = delegate.info {
                    cell.label2.text = date.jobText
                    cell.rateLabel2.text = rateCount(rate: date.jobRate, label1: "⭐️", label2: "⭐︎")
                    // cellの背景を透過
                    cell.backgroundColor = UIColor.clear
                    // cell内のcontentViewの背景を透過
                    cell.contentView.backgroundColor = UIColor.clear
                }
                cell.isUserInteractionEnabled = false
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3") as? MakeResultTableViewCell {
                if let date = delegate.info {
                    cell.label3.text = date.loveText
                    cell.rateLabel3.text = rateCount(rate: date.loveRate, label1: "🩷", label2: "♡")
                    // cellの背景を透過
                    cell.backgroundColor = UIColor.clear
                    // cell内のcontentViewの背景を透過
                    cell.contentView.backgroundColor = UIColor.clear
                }
                cell.isUserInteractionEnabled = false
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell4") as? MakeResultTableViewCell {
                if let date = delegate.info {
                    cell.label4.text = date.healthText
                    cell.rateLabel4.text = rateCount(rate: date.healthRate, label1: "⭐️", label2: "⭐︎")
                    // cellの背景を透過
                    cell.backgroundColor = UIColor.clear
                    // cell内のcontentViewの背景を透過
                    cell.contentView.backgroundColor = UIColor.clear
                }
                cell.isUserInteractionEnabled = false
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell5") as? MakeResultTableViewCell {
                if let date = delegate.info {
                    cell.label5.text = date.adviceText
                    // cellの背景を透過
                    cell.backgroundColor = UIColor.clear
                    // cell内のcontentViewの背景を透過
                    cell.contentView.backgroundColor = UIColor.clear
                }
                cell.isUserInteractionEnabled = false
                return cell
            }
        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell6") as? MakeResultTableViewCell {
                // cellの背景を透過
                cell.backgroundColor = UIColor.clear
                // cell内のcontentViewの背景を透過
                cell.contentView.backgroundColor = UIColor.clear
                return cell
            }
        }
        return MakeListTableViewCell()
    }
}
