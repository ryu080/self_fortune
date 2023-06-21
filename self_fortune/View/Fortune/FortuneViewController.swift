//
//  FortuneViewController.swift
//  self_fortune
//
//  Created by 辻野竜志 on 2023/05/12.
//

import UIKit
import SVProgressHUD
import GoogleMobileAds

class FortuneViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    var datePicker = UIDatePicker()
    let formatter = DateFormatter()
    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField1.placeholder = "名前を入力して下さい"
        textField2.placeholder = "生年月日 yyyy/mm/dd"
        
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        addBannerViewToView(bannerView)
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
    
    @IBAction func textFieldAction(_ sender: Any) {
        configurePicker()
    }
    func configurePicker() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0,    width:view.frame.size.width, height: 50))
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(doneDatePicker))
        toolBar.setItems([spaceItem,doneItem], animated: true)
        formatter.dateFormat = "yyyy年 M月d日"
        formatter.calendar = Calendar(identifier: .gregorian)
        textField2.text = formatter.string(from: Date())
        datePicker.datePickerMode = .date
        datePicker.minimumDate = formatter.date(from: "1930年 1月 1日")
        datePicker.maximumDate = Date()
        datePicker.preferredDatePickerStyle = .wheels
        textField2.inputView = datePicker
        textField2.inputAccessoryView = toolBar
    }
    @objc func doneDatePicker() {
        formatter.dateFormat = "yyyy年 M月d日"
        textField2.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FortuneSegue" {
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //textField1.text = ""
        //textField2.text = ""
    }
    
    @IBAction func fortuneButton(_ sender: Any) {
        SVProgressHUD.show(withStatus: "占い中")
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            SVProgressHUD.dismiss()
            self.performSegue(withIdentifier: "FortuneSegue", sender: sender)
            print("読込み")
        }

    }
    
    @IBAction func exit(segue:UIStoryboardSegue){
        textField1.text = ""
        textField2.text = ""
    }
}
extension FortuneViewController: UITextFieldDelegate {

}
