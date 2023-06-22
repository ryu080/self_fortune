//
//  MakeListViewController.swift
//  self_fortune
//
//  Created by 辻野竜志 on 2023/05/29.
//

import UIKit
import GoogleMobileAds
struct InfoFortune: Codable {
    let fortuneName:String
    let fortune:String
    let fortuneRate:Int
    let jobText:String
    let jobRate:Int
    let loveText:String
    let loveRate:Int
    let healthText:String
    let healthRate:Int
    let adviceText:String
    //let affinityText:String
    //var completed:Bool
}

struct FortuneList: Codable {
    var items:[InfoFortune]
}
    //todolistを保存するクラス
class FortuneListController {
    
    var fortuneList:FortuneList
    
    init() {
        let defaults = UserDefaults.standard
        if let saveDate = defaults.data(forKey: "fortuneList"), let saveList = try? JSONDecoder().decode(FortuneList.self, from: saveDate) {
            fortuneList = saveList
        }else {
            fortuneList = FortuneList(items: [InfoFortune(fortuneName: "サンプル",fortune: "最高の1年",fortuneRate: 3, jobText: "何をやってもうまく行くでしょう。この機会に新しい挑戦をするのも良い",jobRate: 4, loveText: "近々最高のパートナーの出会うでしょう。ドラマチックな出会いをするでしょう",loveRate: 5, healthText: "心身ともに健康で今年は何も心配することはないでしょう",healthRate: 3, adviceText: "")])//, affinityText: "")]) //,completed: false
        }
    }
    var fortuneItems:[InfoFortune] {
        return fortuneList.items
    }
    //セルを追加
    func addItem(data:InfoFortune) {
        fortuneList.items.append(data)
        save()
    }
    //セルを削除
    func removeItem(at index: Int) {
        fortuneList.items.remove(at: index)
        save()
    }
    //達成フラグを反転
    func toggleCompleted(at index: Int) {
        //fortuneList.items[index].completed.toggle()
    }
    //データ保持
    func save() {
        let defaults = UserDefaults.standard
        if let encodeList = try? JSONEncoder().encode(fortuneList) {
            defaults.setValue(encodeList, forKey: "fortuneList")
        }
    }
}
class MakeListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    @IBOutlet weak var Button: UIButton!
    var fortuneListController = FortuneListController()
    var selectedIndex: Int = 0 //最初が選択なしの場合　Int? = nilに変更
    var selectedIndexPath: Int?
    var bannerView: GADBannerView!
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    //let infoList:Array<InfoFortune> = [InfoFortune(fortuneName: "サンプル",fortune: "最高の1年",fortuneRate: 3, jobText: "何をやってもうまく行くでしょう。この機会に新しい挑戦をするのも良い",jobRate: 4, loveText: "近々最高のパートナーの出会うでしょう。ドラマチックな出会いをするでしょう",loveRate: 5, healthText: "心身ともに健康で今年は何も心配することはないでしょう",healthRate: 3, adviceText: "", affinityText: "")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.backgroundColor = UIColor.clear
        listTableView.register(UINib(nibName: "MakeListTableViewCell", bundle: nil), forCellReuseIdentifier: "makeListTableViewCell")
        
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        addBannerViewToView(bannerView)
        self.listTableView.allowsMultipleSelection = false
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSegue" {
            if let makeResultViewController = segue.destination as? MakeResultViewController,
               //受け取ったsenderをdateに入れる↓
               let date = sender as? InfoFortune {
                makeResultViewController.info = date
                makeResultViewController.addFortune = false
            }
            
         if segue.identifier == "makeSegue" {
                if let makeResultViewController = segue.destination as? MakeResultViewController {
                    makeResultViewController.initialize()
                    makeResultViewController.addFortune = true
                    /*
                     makeResultViewController.fortuneTextView.text = ""
                     makeResultViewController.jobTextView.text = ""
                     makeResultViewController.loveTextView.text = ""
                     makeResultViewController.healthTextView.text = ""
                     makeResultViewController.adviceTextView.text = ""
                     makeResultViewController.affinityTextView.text = ""
                     */
                }
            }
        }
    }
    
    @IBAction func ceate(_ sender: Any) {
        self.performSegue(withIdentifier: "makeSegue", sender: sender)
    }
    
    
    @IBAction func exitMake(segue:UIStoryboardSegue) {
    }
    //占いを追加exit
    @IBAction func createExit(segue:UIStoryboardSegue) {
        if let makeResultViewController = segue.source as? MakeResultViewController,
           let data = makeResultViewController.info{
            fortuneListController.addItem(data: data)
            fortuneListController.save()
//            fortuneListController.fortuneList.items.append(data)
        }
        self.listTableView.reloadData()
    }
    //占いを編集exit
    @IBAction func editExit(segue:UIStoryboardSegue){
        if let makeResultViewController = segue.source as? MakeResultViewController,
           let data = makeResultViewController.info{
               //ここに占いを変更後、上書き保存する🔴
            fortuneListController.fortuneList.items[selectedIndexPath!] = data
            fortuneListController.save()
        }
        self.listTableView.reloadData()
    }
}

extension MakeListViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
//        return false
//
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let date = fortuneListController.fortuneItems[indexPath.row]
        if selectedIndexPath == indexPath.row {
                // 2回目のタップで画面遷移する処理を実装する
            
            self.performSegue(withIdentifier: "editSegue", sender: date)
            tableView.deselectRow(at: indexPath, animated: true)
            print("2回目")
            //fortuneListController.toggleCompleted(at: indexPath.row)
//                performSegue(withIdentifier: "yourSegueIdentifier", sender: indexPath)
            } else {
                // タップされたセルの選択状態を反転する
                selectedIndexPath = indexPath.row //selectIndexPathとまとめても良いかも
                delegate.info = date
//                selectedIndex = indexPath.row //

                print("1回目")
            }
    //        tableView.reloadData()
        
            tableView.reloadData()
    }
}
    
extension MakeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fortuneListController.fortuneItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "makeListTableViewCell", for: indexPath) as? MakeListTableViewCell {
            let date = fortuneListController.fortuneItems[indexPath.row]
            cell.setup(fortuneName: date.fortuneName)
            cell.listView.backgroundColor = UIColor.clear
            if indexPath.row == selectedIndexPath {
                cell.checkLabel.text = "⭐️"
            }else {
                cell.checkLabel.text = "⭐︎"
            }
            //cell.accessoryType = indexPath.row == selectedIndexPath ? .checkmark : .none
            return cell
        }
        return MakeListTableViewCell()
    }
    //スワイプで削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            fortuneListController.removeItem(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
