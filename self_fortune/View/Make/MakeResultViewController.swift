//
//  MakeResultViewController.swift
//  self_fortune
//
//  Created by 辻野竜志 on 2023/05/29.
//

import UIKit
import GoogleMobileAds
class MakeResultViewController: UIViewController {
    
    var info:InfoFortune?
    var addFortune = true
    let textView = UITextView()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var bannerView: GADBannerView!
    @IBOutlet weak var segument: UISegmentedControl!
    
    @IBOutlet weak var exitButton: UIButton!
    @IBAction func templateButton(_ sender: Any) {
        switch segument.selectedSegmentIndex {
        case 0: templet(text1: "大吉", rate1: 5, text2: "良いでしょう", rate2: 5, text3: "", rate3: 5, text4: "", rate4: 5, text5: "", text6: "")
        case 1: templet(text1: "中吉", rate1: 4, text2: "", rate2: 4, text3: "", rate3: 4, text4: "", rate4: 4, text5: "", text6: "")
        case 2: templet(text1: "吉", rate1: 3, text2: "", rate2: 3, text3: "", rate3: 3, text4: "", rate4: 3, text5: "", text6: "")
        case 3: templet(text1: "凶", rate1: 2, text2: "", rate2: 2, text3: "", rate3: 2, text4: "", rate4: 2, text5: "", text6: "")
        case 4: templet(text1: "大凶", rate1: 1, text2: "", rate2: 1, text3: "", rate3: 1, text4: "", rate4: 1, text5: "", text6: "")
        default: return
        }
    }
    func templet(text1:String,rate1:Int,text2:String,rate2:Int,text3:String,rate3:Int,text4:String,rate4:Int,text5:String,text6:String){
        fortuneTextView.text = text1
        fortuneCount = rate1
        jobTextView.text = text2
        jobCount = rate2
        loveTextView.text = text3
        loveCount = rate3
        healthTextView.text = text4
        healthCount = rate4
        adviceTextView.text = text5
       // affinityTextView.text = text6
    }
    
    @IBOutlet weak var fortuneTextView: UITextView!{
        didSet {
            fortuneTextView.delegate = self
            fortuneTextView.text = ""
            //textViewのtextの量に応じて、textViewの高さを決める
            fortuneTextView.translatesAutoresizingMaskIntoConstraints = true
        }
    }
    @IBOutlet weak var fortuneButton1: UIButton!
    @IBOutlet weak var fortuneButton2: UIButton!
    @IBOutlet weak var fortuneButton3: UIButton!
    @IBOutlet weak var fortuneButton4: UIButton!
    @IBOutlet weak var fortuneButton5: UIButton!
    var fortuneBool = [false,false,false,false,false]
    var fortuneCount = 0
    
   @IBOutlet weak var jobTextView: UITextView!//{
//        didSet {
//            jobTextView.delegate = self
//            jobTextView.text = ""
//            //textViewのtextの量に応じて、textViewの高さを決める
//            jobTextView.translatesAutoresizingMaskIntoConstraints = true
//        }
//    }
    @IBOutlet weak var jobButton1: UIButton!
    @IBOutlet weak var jobButton2: UIButton!
    @IBOutlet weak var jobButton3: UIButton!
    @IBOutlet weak var jobButton4: UIButton!
    @IBOutlet weak var jobButton5: UIButton!
    var jobBool = [false,false,false,false,false]
    var jobCount = 0
    
    @IBOutlet weak var loveTextView: UITextView!//{
//        didSet {
//            loveTextView.delegate = self
//            loveTextView.text = ""
//            //textViewのtextの量に応じて、textViewの高さを決める
//            loveTextView.translatesAutoresizingMaskIntoConstraints = true
//        }
//    }
    @IBOutlet weak var loveButton1: UIButton!
    @IBOutlet weak var loveButton2: UIButton!
    @IBOutlet weak var loveButton3: UIButton!
    @IBOutlet weak var loveButton4: UIButton!
    @IBOutlet weak var loveButton5: UIButton!
    var loveBool = [false,false,false,false,false]
    var loveCount = 0
    
    @IBOutlet weak var healthTextView: UITextView!//{
//        didSet {
//            healthTextView.delegate = self
//            healthTextView.text = ""
//            //textViewのtextの量に応じて、textViewの高さを決める
//            healthTextView.translatesAutoresizingMaskIntoConstraints = true
//        }
//    }
    @IBOutlet weak var healthButton1: UIButton!
    @IBOutlet weak var healthButton2: UIButton!
    @IBOutlet weak var healthButton3: UIButton!
    @IBOutlet weak var healthButton4: UIButton!
    @IBOutlet weak var healthButton5: UIButton!
    var healthBool = [false,false,false,false,false]
    var healthCount = 0
    
    @IBOutlet weak var adviceTextView: UITextView!//{
//        didSet {
//            adviceTextView.delegate = self
//            adviceTextView.text = ""
//            //textViewのtextの量に応じて、textViewの高さを決める
//            adviceTextView.translatesAutoresizingMaskIntoConstraints = true
//        }
//    }
    @IBOutlet weak var affinityTextView: UITextView!//{
//        didSet {
//            affinityTextView.delegate = self
//            affinityTextView.text = ""
//            //textViewのtextの量に応じて、textViewの高さを決める
//            affinityTextView.translatesAutoresizingMaskIntoConstraints = true
//        }
//    }
    
    @IBAction func createButton(_ sender: Any) {
        if addFortune == true{
            //情報をMakeListcontrollerに返す
            var textFieldOnAlert = UITextField()
            
            let alert = UIAlertController(title: "タイトルを入力",
                                          message: nil,
                                          preferredStyle: .alert)
            alert.addTextField { textField in
                textFieldOnAlert = textField
                textFieldOnAlert.returnKeyType = .done
            }
            
            let doneAction = UIAlertAction(title: "保存", style: .default) { _ in
                guard let title = textFieldOnAlert.text, !title.isEmpty else {return}
                
                self.performSegue(withIdentifier: "createExitSegue", sender: title)
            }
            
            let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel)
            
            alert.addAction(doneAction)
            alert.addAction(cancelAction)
            present(alert, animated: true)
        }else {
            let alert = UIAlertController(title: "編集を終了しますか？",
                                          message: nil,
                                          preferredStyle: .alert)
            
            let doneAction = UIAlertAction(title: "上書き保存", style: .default) { _ in
                self.performSegue(withIdentifier: "editExitSegue", sender: sender)
            }
            let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel)
            
            alert.addAction(doneAction)
            alert.addAction(cancelAction)
            present(alert, animated: true)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createExitSegue" {
            let title = sender as! String
            info = InfoFortune(fortuneName: title, fortune: fortuneTextView.text, fortuneRate: fortuneCount, jobText: jobTextView.text, jobRate: jobCount, loveText: loveTextView.text, loveRate: loveCount, healthText: healthTextView.text, healthRate: healthCount, adviceText: adviceTextView.text )//, affinityText: affinityTextView.text)
        }else if segue.identifier == "editExitSegue" {
            var title = ""
            if let date = info{
                 title = date.fortuneName
            }
            info = InfoFortune(fortuneName: title, fortune: fortuneTextView.text, fortuneRate: fortuneCount, jobText: jobTextView.text, jobRate: jobCount, loveText: loveTextView.text, loveRate: loveCount, healthText: healthTextView.text, healthRate: healthCount, adviceText: adviceTextView.text )//, affinityText: affinityTextView.text)
            delegate.info = info
        }
    }
    func initialize(){
        fortuneTextView.text = ""
        jobTextView.text = ""
        loveTextView.text = ""
        healthTextView.text = ""
        adviceTextView.text = ""
        affinityTextView.text = ""
    }
    
    @objc func kbDoneTaped(sender:UIButton){

      //キーボードを閉じる
      view.endEditing(true)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if addFortune == true {
            exitButton.setTitle("保存", for: .normal)
        }else {
            exitButton.setTitle("上書き保存", for: .normal)
        }
        keyboard()
        
        if let date = info {
            fortuneTextView.text = date.fortune
            fortuneCount = date.fortuneRate
            jobTextView.text = date.jobText
            jobCount = date.jobRate
            loveTextView.text = date.loveText
            loveCount = date.loveRate
            healthTextView.text = date.healthText
            healthCount = date.healthRate
            adviceTextView.text = date.adviceText
//            affinityTextView.text = date.affinityText
            
            //fortuneの評価
            rate(int: fortuneCount, button1: fortuneButton1, button2: fortuneButton2, button3: fortuneButton3, button4: fortuneButton4, button5: fortuneButton5,item:"⭐️")
            //jobの評価
            rate(int: jobCount, button1: jobButton1, button2: jobButton2, button3: jobButton3, button4: jobButton4, button5: jobButton5, item: "⭐️")
            //loveの評価
            rate(int: loveCount, button1: loveButton1, button2: loveButton2, button3: loveButton3, button4: loveButton4, button5: loveButton5, item: "🩷")
            //healthの評価
            rate(int: healthCount, button1: healthButton1, button2: healthButton2, button3: healthButton3, button4: healthButton4, button5: healthButton5, item: "⭐️")
            
            boolCount(fortuneRate: fortuneCount, jobRate: jobCount, loveRate: loveCount, healthRate: healthCount)
        }
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
//    // キーボードが表示される際に呼ばれるメソッド
//    @objc private func keyboardWillShow(_ notification: Notification) {
//        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
//            return
//        }
//
//        // キーボードの高さを取得し、UITextViewの表示領域を調整する
//        let keyboardHeight = keyboardFrame.height
//        textView.contentInset.bottom = keyboardHeight
//        textView.verticalScrollIndicatorInsets.bottom = keyboardHeight
//    }
//
//    // キーボードが非表示になる際に呼ばれるメソッド
//    @objc private func keyboardWillHide(_ notification: Notification) {
//        // UITextViewの表示領域を元に戻す
//        textView.contentInset = .zero
//        textView.verticalScrollIndicatorInsets = .zero
//    }
    
//    override func viewDidAppear(_ animated: Bool) {
//      super.viewDidAppear(animated)
//
//      let notification = NotificationCenter.default
//
//      //キーボードの表示に合わせて通知を受け取りメソッドを実行する設定
//      notification.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//      //キーボードが消えるのに合わせて通知を受け取りメソッドを実行する設定
//      notification.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//
//    }
//
//
//    //キーボード画面ずらし　キーボードが現れた時に、view全体をずらす
//    @objc func keyboardWillShow(notification: Notification?){
//
//      //アクティブになっているViewを特定して格納
//      var activeView:UIView?
//
//      for sub in view.subviews {
//        if sub.isFirstResponder {
//          activeView = sub
//        }
//      }
//
//      //キーボードの高さを調べる
//      let userInfo = notification?.userInfo!
//      let keyboardScreenEndFrame = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//
//      //アクティブなViewの下辺の位置を調べる
//      guard let actView = activeView else { return }
//
//      //アクティブなViewの下端を計算
//      let txtLimit = actView.frame.origin.y + actView.frame.height
//      //キーボードの上端を計算
//      let kbLimit = view.bounds.height - keyboardScreenEndFrame.size.height
//
//      print("viewの下端=",txtLimit,"キーボードの上端=",kbLimit)
//      //オフセット量を計算(マージン 10)
//      let offset = kbLimit - (txtLimit + 10)
//
//      //キーボードが被らない場合はメソッドから抜けてオフセットしない
//      if offset > 0 {
//        print("キーボードは被らない")
//        return
//
//      }
//
//      print("画面のオフセット量\(offset)")
//
//      //アニメーションさせる時間を取得
//      let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
//      UIView.animate(withDuration: duration!, animations: { () in
//
//        //画面のずらし量を設定
//        let transform = CGAffineTransform(translationX: 0, y: offset)
//        //viewをずらすアニメーション実行
//        self.view.transform = transform
//      })
//    }
//
//
//    //キーボード画面ずらし　キーボードが消えた時に、画面を戻す
//    @objc func keyboardWillHide(notification: Notification?) {
//
//      //アニメーションさせる時間を取得
//      let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double
//      UIView.animate(withDuration: duration!, animations: { () in
//        //元に戻すアニメーションの実行
//        self.view.transform = CGAffineTransform.identity
//      })
//    }


    
    
    //キーボードの設定
    func keyboard() {
        textView.delegate = self
        textView.text = "TextView"
        let kbToolbar = UIToolbar()
        kbToolbar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40)
        //ボタンを右寄せにするためのスペーサー
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        //編集終了ボタン
        let kbDoneButton = UIBarButtonItem(title:"完了",style: .done, target: self, action: #selector(kbDoneTaped))
        
        //スペーサーとボタンをツールバーに追加
        kbToolbar.items = [spacer,kbDoneButton]


        //textViewのキーボードのinputAccessoryViewに作成したツールバーを設定
        fortuneTextView.inputAccessoryView = kbToolbar
        jobTextView.inputAccessoryView = kbToolbar
        loveTextView.inputAccessoryView = kbToolbar
        healthTextView.inputAccessoryView = kbToolbar
        adviceTextView.inputAccessoryView = kbToolbar
//        affinityTextView.inputAccessoryView = kbToolbar
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//
    }
    
    func rate(int: Int, button1: UIButton, button2: UIButton, button3: UIButton, button4: UIButton, button5: UIButton,item:String) {
        switch int {
        case 1: button1.setTitle(item, for: .normal)
        case 2: button1.setTitle(item, for: .normal)
                button2.setTitle(item, for: .normal)
        case 3: button1.setTitle(item, for: .normal)
                button2.setTitle(item, for: .normal)
                button3.setTitle(item, for: .normal)
        case 4: button1.setTitle(item, for: .normal)
                button2.setTitle(item, for: .normal)
                button3.setTitle(item, for: .normal)
                button4.setTitle(item, for: .normal)
        case 5: button1.setTitle(item, for: .normal)
                button2.setTitle(item, for: .normal)
                button3.setTitle(item, for: .normal)
                button4.setTitle(item, for: .normal)
                button5.setTitle(item, for: .normal)
        default: return
            
        }
    }
    
    func boolCount(fortuneRate:Int, jobRate:Int, loveRate:Int, healthRate:Int){
        switch fortuneRate {
        case 1: fortuneBool[0] = true
        case 2: fortuneBool[0...1] = [true,true]
        case 3: fortuneBool[0...2] = [true,true,true]
        case 4: fortuneBool[0...3] = [true,true,true,true]
        case 5: fortuneBool[0...4] = [true,true,true,true,true]
        default: return
        }
        switch jobRate {
        case 1: jobBool[0] = true
        case 2: jobBool[0...1] = [true,true]
        case 3: jobBool[0...2] = [true,true,true]
        case 4: jobBool[0...3] = [true,true,true,true]
        case 5: jobBool[0...4] = [true,true,true,true,true]
        default: return
        }
        switch loveRate {
        case 1: loveBool[0] = true
        case 2: loveBool[0...1] = [true,true]
        case 3: loveBool[0...2] = [true,true,true]
        case 4: loveBool[0...3] = [true,true,true,true]
        case 5: loveBool[0...4] = [true,true,true,true,true]
        default: return
        }
        switch healthRate {
        case 1: healthBool[0] = true
        case 2: healthBool[0...1] = [true,true]
        case 3: healthBool[0...2] = [true,true,true]
        case 4: healthBool[0...3] = [true,true,true,true]
        case 5: healthBool[0...4] = [true,true,true,true,true]
        default: return
        }
    }
    
    func boolButton(bool:[Bool]) -> Int{
        var count = 0
        if bool == [false,false,false,false,false]{
            count = 0
        }else if bool == [true,false,false,false,false]{
            count = 1
        }else if bool == [true,true,false,false,false]{
            count = 2
        }else if bool == [true,true,true,false,false]{
            count = 3
        }else if bool == [true,true,true,true,false]{
            count = 4
        }else if bool == [true,true,true,true,true]{
            count = 5
        }
        return count
    }
    
    //starButton
    func starButton(i: Int, button: UIButton){
        if fortuneBool[i] == true {
            button.setTitle("☆", for: .normal)
            fortuneBool[i] = false
        }else {
            button.setTitle("⭐️", for: .normal)
            fortuneBool[i] = true
        }
    }
    
    func starOffBool(i: Int, button: UIButton) {
        if fortuneBool[i] == true {
            button.setTitle("☆", for: .normal)
            fortuneBool[i] = false
        }
    }
    func starOnBool(i: Int, button: UIButton) {
        if fortuneBool[i] == false {
            button.setTitle("⭐️", for: .normal)
            fortuneBool[i] = true
        }
    }
    @IBAction func starButton1(_ sender: Any) {
        starButton(i: 0, button: fortuneButton1)
        starOffBool(i: 1, button: fortuneButton2)
        starOffBool(i: 2, button: fortuneButton3)
        starOffBool(i: 3, button: fortuneButton4)
        starOffBool(i: 4, button: fortuneButton5)
        fortuneCount = boolButton(bool: fortuneBool)
    }
    @IBAction func starButton2(_ sender: Any) {
        starOnBool(i: 0, button: fortuneButton1)
        starButton(i: 1, button: fortuneButton2)
        starOffBool(i: 2, button: fortuneButton3)
        starOffBool(i: 3, button: fortuneButton4)
        starOffBool(i: 4, button: fortuneButton5)
        fortuneCount = boolButton(bool: fortuneBool)
    }
    @IBAction func starButton3(_ sender: Any) {
        starOnBool(i: 0, button: fortuneButton1)
        starOnBool(i: 1, button: fortuneButton2)
        starButton(i: 2, button: fortuneButton3)
        starOffBool(i: 3, button: fortuneButton4)
        starOffBool(i: 4, button: fortuneButton5)
        fortuneCount = boolButton(bool: fortuneBool)
    }
    @IBAction func starButton4(_ sender: Any) {
        starOnBool(i: 0, button: fortuneButton1)
        starOnBool(i: 1, button: fortuneButton2)
        starOnBool(i: 2, button: fortuneButton3)
        starButton(i: 3, button: fortuneButton4)
        starOffBool(i: 4, button: fortuneButton5)
        fortuneCount = boolButton(bool: fortuneBool)
    }
    @IBAction func starButton5(_ sender: Any) {
        starOnBool(i: 0, button: fortuneButton1)
        starOnBool(i: 1, button: fortuneButton2)
        starOnBool(i: 2, button: fortuneButton3)
        starOnBool(i: 3, button: fortuneButton4)
        starButton(i: 4, button: fortuneButton5)
        fortuneCount = boolButton(bool: fortuneBool)
    }
    
    //jobButton
    func jobButton(i: Int, button: UIButton){
        if jobBool[i] == true {
            button.setTitle("☆", for: .normal)
            jobBool[i] = false
        }else {
            button.setTitle("⭐️", for: .normal)
            jobBool[i] = true
        }
    }
    
    func jobOffBool(i: Int, button: UIButton) {
        if jobBool[i] == true {
            button.setTitle("☆", for: .normal)
            jobBool[i] = false
        }
    }
    func jobOnBool(i: Int, button: UIButton) {
        if jobBool[i] == false {
            button.setTitle("⭐️", for: .normal)
            jobBool[i] = true
        }
    }
    @IBAction func jobButton1(_ sender: Any) {
        jobButton(i: 0, button: jobButton1)
        jobOffBool(i: 1, button: jobButton2)
        jobOffBool(i: 2, button: jobButton3)
        jobOffBool(i: 3, button: jobButton4)
        jobOffBool(i: 4, button: jobButton5)
        jobCount = boolButton(bool: jobBool)
    }
    
    @IBAction func jobButton2(_ sender: Any) {
        jobOnBool(i: 0, button: jobButton1)
        jobButton(i: 1, button: jobButton2)
        jobOffBool(i: 2, button: jobButton3)
        jobOffBool(i: 3, button: jobButton4)
        jobOffBool(i: 4, button: jobButton5)
        jobCount = boolButton(bool: jobBool)
    }
    
    @IBAction func jobButton3(_ sender: Any) {
        jobOnBool(i: 0, button: jobButton1)
        jobOnBool(i: 1, button: jobButton2)
        jobButton(i: 2, button: jobButton3)
        jobOffBool(i: 3, button: jobButton4)
        jobOffBool(i: 4, button: jobButton5)
        jobCount = boolButton(bool: jobBool)
    }
    
    @IBAction func jobButton4(_ sender: Any) {
        jobOnBool(i: 0, button: jobButton1)
        jobOnBool(i: 1, button: jobButton2)
        jobOnBool(i: 2, button: jobButton3)
        jobButton(i: 3, button: jobButton4)
        jobOffBool(i: 4, button: jobButton5)
        jobCount = boolButton(bool: jobBool)
    }
    
    @IBAction func jobButton5(_ sender: Any) {
        jobOnBool(i: 0, button: jobButton1)
        jobOnBool(i: 1, button: jobButton2)
        jobOnBool(i: 2, button: jobButton3)
        jobOnBool(i: 3, button: jobButton4)
        jobButton(i: 4, button: jobButton5)
        jobCount = boolButton(bool: jobBool)
    }
    
    //loveButton
    func loveButton(i: Int, button: UIButton){
        if loveBool[i] == true {
            button.setTitle("♡", for: .normal)
            loveBool[i] = false
        }else {
            button.setTitle("🩷", for: .normal)
            loveBool[i] = true
        }
    }
    
    func loveOffBool(i: Int, button: UIButton) {
        if loveBool[i] == true {
            button.setTitle("♡", for: .normal)
            loveBool[i] = false
        }
    }
    func loveOnBool(i: Int, button: UIButton) {
        if loveBool[i] == false {
            button.setTitle("🩷", for: .normal)
            loveBool[i] = true
        }
    }

    @IBAction func loveButton1(_ sender: Any) {
        loveButton(i: 0, button: loveButton1)
        loveOffBool(i: 1, button: loveButton2)
        loveOffBool(i: 2, button: loveButton3)
        loveOffBool(i: 3, button: loveButton4)
        loveOffBool(i: 4, button: loveButton5)
        loveCount = boolButton(bool: loveBool)
    }
    
    @IBAction func loveButton2(_ sender: Any) {
        loveOnBool(i: 0, button: loveButton1)
        loveButton(i: 1, button: loveButton2)
        loveOffBool(i: 2, button: loveButton3)
        loveOffBool(i: 3, button: loveButton4)
        loveOffBool(i: 4, button: loveButton5)
        loveCount = boolButton(bool: loveBool)
    }
    
    @IBAction func loveButton3(_ sender: Any) {
        loveOnBool(i: 0, button: loveButton1)
        loveOnBool(i: 1, button: loveButton2)
        loveButton(i: 2, button: loveButton3)
        loveOffBool(i: 3, button: loveButton4)
        loveOffBool(i: 4, button: loveButton5)
        loveCount = boolButton(bool: loveBool)
    }
    
    @IBAction func loveButton4(_ sender: Any) {
        loveOnBool(i: 0, button: loveButton1)
        loveOnBool(i: 1, button: loveButton2)
        loveOnBool(i: 2, button: loveButton3)
        loveButton(i: 3, button: loveButton4)
        loveOffBool(i: 4, button: loveButton5)
        loveCount = boolButton(bool: loveBool)
    }
    
    @IBAction func loveButton5(_ sender: Any) {
        loveOnBool(i: 0, button: loveButton1)
        loveOnBool(i: 1, button: loveButton2)
        loveOnBool(i: 2, button: loveButton3)
        loveOnBool(i: 3, button: loveButton4)
        loveButton(i: 4, button: loveButton5)
        loveCount = boolButton(bool: loveBool)
    }
    //healthButton
    func healthButton(i: Int, button: UIButton){
        if healthBool[i] == true {
            button.setTitle("☆", for: .normal)
            healthBool[i] = false
        }else {
            button.setTitle("⭐️", for: .normal)
            healthBool[i] = true
        }
    }
    
    func healthOffBool(i: Int, button: UIButton) {
        if healthBool[i] == true {
            button.setTitle("☆", for: .normal)
            healthBool[i] = false
        }
    }
    func healthOnBool(i: Int, button: UIButton) {
        if healthBool[i] == false {
            button.setTitle("⭐️", for: .normal)
            healthBool[i] = true
        }
    }
    @IBAction func healthButton1(_ sender: Any) {
        healthButton(i: 0, button: healthButton1)
        healthOffBool(i: 1, button: healthButton2)
        healthOffBool(i: 2, button: healthButton3)
        healthOffBool(i: 3, button: healthButton4)
        healthOffBool(i: 4, button: healthButton5)
        healthCount = boolButton(bool: healthBool)
    }
    
    @IBAction func healthButton2(_ sender: Any) {
        healthOnBool(i: 0, button: healthButton1)
        healthButton(i: 1, button: healthButton2)
        healthOffBool(i: 2, button: healthButton3)
        healthOffBool(i: 3, button: healthButton4)
        healthOffBool(i: 4, button: healthButton5)
        healthCount = boolButton(bool: healthBool)
    }
    
    @IBAction func healthButton3(_ sender: Any) {
        healthOnBool(i: 0, button: healthButton1)
        healthOnBool(i: 1, button: healthButton2)
        healthButton(i: 2, button: healthButton3)
        healthOffBool(i: 3, button: healthButton4)
        healthOffBool(i: 4, button: healthButton5)
        healthCount = boolButton(bool: healthBool)
    }
    
    @IBAction func healthButton4(_ sender: Any) {
        healthOnBool(i: 0, button: healthButton1)
        healthOnBool(i: 1, button: healthButton2)
        healthOnBool(i: 2, button: healthButton3)
        healthButton(i: 3, button: healthButton4)
        healthOffBool(i: 4, button: healthButton5)
        healthCount = boolButton(bool: healthBool)
    }
    
    @IBAction func healthButton5(_ sender: Any) {
        healthOnBool(i: 0, button: healthButton1)
        healthOnBool(i: 1, button: healthButton2)
        healthOnBool(i: 2, button: healthButton3)
        healthOnBool(i: 3, button: healthButton4)
        healthButton(i: 4, button: healthButton5)
        healthCount = boolButton(bool: healthBool)
    }
}

extension MakeResultViewController:UITextViewDelegate {
    
//    func textViewDidEndEditing(_ textView: UITextView) {
//        fortuneTextView.resignFirstResponder()
//        jobTextView.resignFirstResponder()
//        loveTextView.resignFirstResponder()
//        healthTextView.resignFirstResponder()
//        adviceTextView.resignFirstResponder()
//        affinityTextView.resignFirstResponder()
//    }
//
}
