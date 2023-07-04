//
//  MakeFortuneViewController.swift
//  self_fortune
//
//  Created by 辻野竜志 on 2023/06/24.
//

import UIKit

class MakeFortuneViewController: UIViewController {
    
    @IBOutlet weak var showPercentLabel: UILabel!
    @IBOutlet weak var affinityTextField: UITextField!
    @IBOutlet weak var percentSlider: UISlider!
    @IBOutlet weak var affinityTextView: UITextView!
    @IBOutlet weak var adviceTextView: UITextView!
    @IBOutlet weak var templateButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    private let placeholder1 = "相性の説明文を入力してください"
    private let placeholder2 = "アドバイスの説明文を入力してください"
    private let textLength = 420
    private let textView = UITextView()
    var addFortune = true
    var info: InfoFortune?
    private let delegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var scrollView: UIScrollView!
    
    func initialize(){
        affinityTextField.text = ""
        affinityTextView.text = ""
        adviceTextView.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        affinityTextView.delegate = self
        adviceTextView.delegate = self
        affinityTextField.placeholder = "2人の相性"
        affinityTextView.text = placeholder1
        adviceTextView.text = placeholder2
        //タップでキーボードを下げる
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        //下にスワイプでキーボードを下げる
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        swipeDownGesture.direction = .down
        self.view.addGestureRecognizer(swipeDownGesture)
        if let date = info {
            showPercentLabel.text = "\(date.percent)"
            percentSlider.value = Float(date.percent)
            affinityTextField.text = date.affinity
            affinityTextView.text = date.affinityText
            adviceTextView.text = date.adviceText
        }
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    //キーボードの設定
    func keyboard() {
        textView.delegate = self
        textView.text = "TextView"
        let kbToolbar = UIToolbar()
        kbToolbar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40)
        //ボタンを右寄せにするためのスペーサー
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        //編集終了ボタン
        let kbDoneButton = UIBarButtonItem(title:"完了",style: .done, target: self, action: #selector(dismissKeyboard))
        
        //スペーサーとボタンをツールバーに追加
        kbToolbar.items = [spacer,kbDoneButton]
        
        //textViewのキーボードのinputAccessoryViewに作成したツールバーを設定
        affinityTextView.inputAccessoryView = kbToolbar
        adviceTextView.inputAccessoryView = kbToolbar
    }
    @IBAction func sliderChanged(_ sender: UISlider) {
        let percent = Int(sender.value)
        showPercentLabel.text = "\(percent)"
    }
    
    @IBAction func templateButton(_ sender: Any) {
        switch percentSlider.value {
        case 0:
            affinityTextField.text = "〜相性最悪〜"
            affinityTextView.text = "2人の関係は極めて困難で、互いに理解し合うことができず、感情的な距離が大きい状態です。\n意見の相違やコミュニケーションの欠如が頻繁に起こり、関係を維持することがほぼ不可能に近い状態です。"
            adviceTextView.text = "関わらないのが身のためです"
        case 1...20:
            affinityTextField.text = "〜犬猿の仲〜"
            affinityTextView.text = "2人の関係は常に緊張が走り、互いに対立することが多いです。\n相手の性格や行動に対して理解が難しく、意見が衝突しやすい関係です。\nお互いにストレスや不満を抱えがちで、和解するのが難しい状態です。"
            adviceTextView.text = "無理をして付き合う必要はないでしょう"
        case 21...40:
            affinityTextField.text = "〜価値観不一致〜"
            affinityTextView.text = "2人の関係にはいくつかの課題や意見の相違がありますが、それにもかかわらず、まだ関係を修復する余地があります。\nお互いに対話し、解決策を見つけるための努力が必要です。"
            adviceTextView.text = "お互いに寄り添い合えば可能性はあります"
        case 41...60:
            affinityTextField.text = "〜普通〜"
            affinityTextView.text = "2人の関係は平穏で特に大きな問題はありませんが、特別な絆や深い理解も感じられません。\nお互いに興味や共通の関心事を持っているかもしれませんが、関係を発展させるためにはさらなる努力が必要です。"
            adviceTextView.text = "お互いに関心を持ちましょう"
        case 61...80:
            affinityTextField.text = "〜一緒にいて疲れない〜"
            affinityTextView.text = "2人の関係はおおむね良好で、お互いに理解し合い、楽しい時間を過ごすことができます。\nしかし、まだ改善の余地があり、一部の課題に取り組む必要があります。"
            adviceTextView.text = "共通の課題に取り組むとさらに関係がよくなるでしょう"
        case 81...99:
            affinityTextField.text = "〜相性最高〜"
            affinityTextView.text = "2人の関係はおおむね良好です。\nお互いに支え合い幸せな時間を共有できます。\n相手を尊重し思いやりを持ち、関係をさらに深めるための努力を惜しまないです。"
            adviceTextView.text = "良い思い出をたくさん作り共有することで二人の絆は誰にも断ち切れないでしょう"
        default:
            affinityTextField.text = "〜運命の相手〜"
            affinityTextView.text = "2人の関係は完璧です。\nお互いに欠かせない存在です。\n深い絆と信頼があり、お互いの強みを活かし合いながら良いコミュニケーションと協力関係を築いています。\n共通の目標や夢を持ち、互いを支えながら成長していく関係です。"
            adviceTextView.text = "変わりなどいません一生大切にしましょう"
        }
        // スクロールを一番上に移動
                scrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
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
            info = InfoFortune(fortuneName: title, percent: Int(percentSlider.value), affinity: affinityTextField.text ?? "", affinityText: affinityTextView.text, adviceText: adviceTextView.text)
            delegate.info = info
        }else if segue.identifier == "editExitSegue" {
            var title = ""
            if let date = info{
                title = date.fortuneName
            }
            info = InfoFortune(fortuneName: title, percent: Int(percentSlider.value), affinity: affinityTextField.text ?? "", affinityText: affinityTextView.text, adviceText: adviceTextView.text)
            delegate.info = info
        }
    }
    
    
}

extension MakeFortuneViewController: UITextViewDelegate {
    // 文字数制限＆行数制限
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        //既に存在する改行数
        let existingLines = textView.text.components(separatedBy: .newlines)
        //新規改行数
        let newLines = text.components(separatedBy: .newlines)
        //最終改行数。-1は編集したら必ず1改行としてカウントされるから。
        let linesAfterChange = existingLines.count + newLines.count - 1

        return linesAfterChange <= 20 && textView.text.count + (text.count - range.length) <= textLength
    }

    // TextViewの内容が変わるたびに実行される
    func textViewDidChange(_ textView: UITextView) {
        //既に存在する改行数
        let existingLines = textView.text.components(separatedBy: .newlines)
        if existingLines.count <= 20 {
        }
    }
    
    // 入力開始時にプレースホルダーの内容が入っていたら空にする
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholder1 {
            textView.text = nil
            textView.textColor = .white
        }
        if textView.text == placeholder2 {
            textView.text = nil
            textView.textColor = .white
        }
    }
    
    // 入力終了後に文字が入力されていなかったらプレースホルダー表示
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            if textView == affinityTextView {
                textView.text = placeholder1
            }
            if textView == adviceTextView {
                textView.text = placeholder2
            }
            textView.textColor = .white
        }
    }
}
