//
//  FortuneDoViewController.swift
//  self_fortune
//
//  Created by 辻野竜志 on 2023/06/22.
//

import UIKit
import SVProgressHUD

class FortuneDoViewController: UIViewController {
    
    //1人目
    @IBOutlet weak var familyNameTextField1: UITextField!
    @IBOutlet weak var firstNameTextField1: UITextField!
    @IBOutlet weak var yearTextField1: UITextField!
    @IBOutlet weak var monthTextField1: UITextField!
    @IBOutlet weak var dayTextField1: UITextField!
    
    var yearPickerView1: UIPickerView!
    var monthPickerView1: UIPickerView!
    var dayPickerView1: UIPickerView!
    
    //2人目
    @IBOutlet weak var familyNameTextField2: UITextField!
    @IBOutlet weak var firstNameTextField2: UITextField!
    @IBOutlet weak var yearTextField2: UITextField!
    @IBOutlet weak var monthTextField2: UITextField!
    @IBOutlet weak var dayTextField2: UITextField!
    
    var yearPickerView2: UIPickerView!
    var monthPickerView2: UIPickerView!
    var dayPickerView2: UIPickerView!
    
    
    let years = Array(1930...2023) // 年の範囲
    let months = Array(1...12) // 月の範囲
    let days = Array(1...31) // 日の範囲
    
    var currentTextFieldTag: Int = 0
    var keyboardHeight: CGFloat = 0.0
    var currentTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初期値の設定
        yearTextField1.text = "2000年"
        yearTextField1.textColor = .systemBlue
        yearTextField1.tintColor = UIColor.clear
        monthTextField1.text = "1月"
        monthTextField1.textColor = .systemBlue
        monthTextField1.tintColor = UIColor.clear
        dayTextField1.text = "1日"
        dayTextField1.textColor = .systemBlue
        dayTextField1.tintColor = UIColor.clear
        yearTextField2.text = "2000年"
        yearTextField2.textColor = .systemBlue
        yearTextField2.tintColor = UIColor.clear
        monthTextField2.text = "1月"
        monthTextField2.textColor = .systemBlue
        monthTextField2.tintColor = UIColor.clear
        dayTextField2.text = "1日"
        dayTextField2.textColor = .systemBlue
        dayTextField2.tintColor = UIColor.clear
        
        // テキストフィールドのデリゲートを設定
        familyNameTextField1.delegate = self
        familyNameTextField2.delegate = self
        firstNameTextField1.delegate = self
        firstNameTextField2.delegate = self
        yearTextField1.delegate = self
        yearTextField2.delegate = self
        monthTextField1.delegate = self
        monthTextField2.delegate = self
        dayTextField1.delegate = self
        dayTextField2.delegate = self
        
        // ピッカービューの作成
        yearPickerView1 = UIPickerView()
        monthPickerView1 = UIPickerView()
        dayPickerView1 = UIPickerView()
        yearPickerView2 = UIPickerView()
        monthPickerView2 = UIPickerView()
        dayPickerView2 = UIPickerView()
        
        
        // データソースとデリゲートを設定
        yearPickerView1.dataSource = self
        yearPickerView1.delegate = self
        monthPickerView1.dataSource = self
        monthPickerView1.delegate = self
        dayPickerView1.dataSource = self
        dayPickerView1.delegate = self
        
        // データソースとデリゲートを設定
        yearPickerView2.dataSource = self
        yearPickerView2.delegate = self
        monthPickerView2.dataSource = self
        monthPickerView2.delegate = self
        dayPickerView2.dataSource = self
        dayPickerView2.delegate = self
        
        // テキストフィールドのキーボードをピッカービューに置き換える
        yearTextField1.inputView = yearPickerView1
        monthTextField1.inputView = monthPickerView1
        dayTextField1.inputView = dayPickerView1
        
        yearTextField2.inputView = yearPickerView2
        monthTextField2.inputView = monthPickerView2
        dayTextField2.inputView = dayPickerView2
        
        // ツールバーを設定してキーボードに追加
        //ツールバーに完了をつけるか🟠
        familyNameTextField1.inputAccessoryView = createToolbar(for: familyNameTextField1)
        firstNameTextField1.inputAccessoryView = createToolbar(for: firstNameTextField1)
        
        yearTextField1.inputAccessoryView = createToolbar(for: yearTextField1)
        monthTextField1.inputAccessoryView = createToolbar(for: monthTextField1)
        dayTextField1.inputAccessoryView = createToolbar(for: dayTextField1)
        //ツールバーに完了をつけるか🟠
        familyNameTextField2.inputAccessoryView = createToolbar(for: familyNameTextField2)
        firstNameTextField2.inputAccessoryView = createToolbar(for: firstNameTextField2)
        
        yearTextField2.inputAccessoryView = createToolbar(for: yearTextField2)
        monthTextField2.inputAccessoryView = createToolbar(for: monthTextField2)
        dayTextField2.inputAccessoryView = createToolbar(for: dayTextField2)
        
        //タップでキーボードを下げる
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(doneButtonTapped))
        self.view.addGestureRecognizer(tapGesture)
        //下にスワイプでキーボードを下げる
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(doneButtonTapped))
        swipeDownGesture.direction = .down
        self.view.addGestureRecognizer(swipeDownGesture)
    }
    
    @IBAction func fortuneButton(_ sender: Any) {
        if let familyName1 = familyNameTextField1.text, !familyName1.isEmpty,
           let firstName1 = firstNameTextField1.text, !firstName1.isEmpty,
           let familyName2 = familyNameTextField2.text, !familyName2.isEmpty,
           let firstName2 = firstNameTextField2.text, !firstName2.isEmpty{
            SVProgressHUD.show(withStatus: "占い中")
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "FortuneSegue", sender: sender)
                print("読込み")
            }
        }else {
            if familyNameTextField1.text == ""{
                familyNameTextField1.backgroundColor = UIColor(red: 0.95, green: 0.8, blue: 0.8, alpha: 1.0)
                familyNameTextField1.attributedPlaceholder = NSAttributedString(string: "姓が未入力です",
                                                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])            }
            if firstNameTextField1.text == ""{
                firstNameTextField1.backgroundColor = UIColor(red: 0.95, green: 0.8, blue: 0.8, alpha: 1.0)
                firstNameTextField1.attributedPlaceholder = NSAttributedString(string: "名が未入力です",
                                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            }
            if familyNameTextField2.text == "" {
                familyNameTextField2.backgroundColor = UIColor(red: 0.95, green: 0.8, blue: 0.8, alpha: 1.0)
                familyNameTextField2.attributedPlaceholder = NSAttributedString(string: "姓が未入力です",
                                                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])            }
            if firstNameTextField2.text == "" {
                firstNameTextField2.backgroundColor = UIColor(red: 0.95, green: 0.8, blue: 0.8, alpha: 1.0)
                firstNameTextField2.attributedPlaceholder = NSAttributedString(string: "名が未入力です",
                                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FortuneSegue" {
            if let editFortuneTellingViewController = segue.destination as? EditFortuneTellingViewController {
                editFortuneTellingViewController.familyName1 = familyNameTextField1.text
                editFortuneTellingViewController.firstName1 = firstNameTextField1.text
                editFortuneTellingViewController.familyName2 = familyNameTextField2.text
                editFortuneTellingViewController.firstName2 = firstNameTextField2.text
            }
        }
    }
    
    func createToolbar(for textField: UITextField) -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.tintColor = .systemBlue
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(doneButtonTapped(_:)))
        doneButton.tag = textField.tag // テキストフィールドのタグをボタンのタグとして設定
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        // 「chevron.down」アイコンを使った上ボタンを作成
        let upButton = UIBarButtonItem(image: UIImage(systemName: "chevron.up"), style: .plain, target: self, action: #selector(upButtonTapped(_:)))
        upButton.tag = textField.tag // テキストフィールドのタグをボタンのタグとして設定
        
        // 「chevron.down」アイコンを使った下ボタンを作成
        let downButton = UIBarButtonItem(image: UIImage(systemName: "chevron.down"), style: .plain, target: self, action: #selector(downButtonTapped(_:)))
        downButton.tag = textField.tag // テキストフィールドのタグをボタンのタグとして設定
        
        if textField == familyNameTextField1{
            upButton.isEnabled = false
        }else if textField == dayTextField2 {
            downButton.isEnabled = false
        }
        toolbar.setItems([upButton, downButton, flexibleSpace, doneButton], animated: false)
        
        return toolbar
    }
    
    @objc func upButtonTapped(_ sender: UIBarButtonItem) {
        // 上ボタンがタップされたときの処理
        // タグを使ってテキストフィールドを特定し、上の項目を選択する処理を実装
        if let textField = view.viewWithTag(currentTextFieldTag - 1) as? UITextField {
            textField.becomeFirstResponder() // 次のテキストフィールドにフォーカスを移動
        } else {
            if view.viewWithTag(currentTextFieldTag) is UITextField {
                
            }
        }
    }
    
    @objc func downButtonTapped(_ sender: UIBarButtonItem) {
        // 下ボタンがタップされたときの処理
        // タグを使ってテキストフィールドを特定し、下の項目を選択する処理を実装
        if let textField = view.viewWithTag(currentTextFieldTag + 1) as? UITextField {
            textField.becomeFirstResponder() // 次のテキストフィールドにフォーカスを移動
        } else {
            if view.viewWithTag(currentTextFieldTag) is UITextField {
                
            }
        }
    }
    @objc func doneButtonTapped(_ sender: UIBarButtonItem) {
        view.endEditing(true)
    }
}
extension FortuneDoViewController: UITextFieldDelegate {
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField = textField
        currentTextFieldTag = textField.tag
        currentTextField = textField
        // テキストフィールドがキーボードによって隠れる場合には、画面をスクロールする
        if let scrollView = self.view as? UIScrollView {
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardHeight, right: 0.0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
            
            var rect = self.view.frame
            rect.size.height -= keyboardHeight
            
            if !rect.contains(textField.frame.origin) {
                scrollView.scrollRectToVisible(textField.frame, animated: true)
            }
        }
        switch textField {
        case familyNameTextField1:
            familyNameTextField1.backgroundColor = .white
            familyNameTextField1.placeholder = ""
        case firstNameTextField1:
            firstNameTextField1.backgroundColor = .white
            firstNameTextField1.placeholder = ""
        case yearTextField1:
            yearPickerView1.selectRow(years.firstIndex(of: Int(textField.text ?? "") ?? 2000) ?? 0, inComponent: 0, animated: false)
        case monthTextField1:
            monthPickerView1.selectRow(months.firstIndex(of: Int(textField.text ?? "") ?? 1) ?? 0, inComponent: 0, animated: false)
        case dayTextField1:
            dayPickerView1.selectRow(days.firstIndex(of: Int(textField.text ?? "") ?? 1) ?? 0, inComponent: 0, animated: false)
        case familyNameTextField2:
            familyNameTextField2.backgroundColor = .white
            familyNameTextField2.placeholder = ""
        case firstNameTextField2:
            firstNameTextField2.backgroundColor = .white
            firstNameTextField2.placeholder = ""
        case yearTextField2:
            yearPickerView2.selectRow(years.firstIndex(of: Int(textField.text ?? "") ?? 2000) ?? 0, inComponent: 0, animated: false)
        case monthTextField2:
            monthPickerView2.selectRow(months.firstIndex(of: Int(textField.text ?? "") ?? 1) ?? 0, inComponent: 0, animated: false)
        case dayTextField2:
            dayPickerView2.selectRow(days.firstIndex(of: Int(textField.text ?? "") ?? 1) ?? 0, inComponent: 0, animated: false)
        default:
            break
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
           let currentTextField = currentTextField {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            let textFieldOrigin = currentTextField.convert(currentTextField.bounds.origin, to: self.view)
            let textFieldBottom = textFieldOrigin.y + currentTextField.bounds.height
            let keyboardOverlap = textFieldBottom - (self.view.bounds.height - keyboardHeight)
            
            if keyboardOverlap > 0 {
                UIView.animate(withDuration: 0.3) {
                    self.view.transform = CGAffineTransform(translationX: 0, y: -keyboardOverlap)
                }
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.view.transform = CGAffineTransform.identity
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

extension FortuneDoViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case yearPickerView1:
            return years.count
        case monthPickerView1:
            return months.count
        case dayPickerView1:
            return days.count
        case yearPickerView2:
            return years.count
        case monthPickerView2:
            return months.count
        case dayPickerView2:
            return days.count
        default:
            return 0
        }
    }
    
    
}
extension FortuneDoViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case yearPickerView1:
            return String(years[row])
        case monthPickerView1:
            return String(months[row])
        case dayPickerView1:
            return String(days[row])
        case yearPickerView2:
            return String(years[row])
        case monthPickerView2:
            return String(months[row])
        case dayPickerView2:
            return String(days[row])
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case yearPickerView1:
            yearTextField1.text = "\(years[row])年"
            //            yearTextField1.textColor = .black
        case monthPickerView1:
            monthTextField1.text = "\(months[row])月"
            //            monthTextField1.textColor = .black
        case dayPickerView1:
            dayTextField1.text = "\(days[row])日"
            //            dayTextField1.textColor = .black
        case yearPickerView2:
            yearTextField2.text = "\(years[row])年"
            //            yearTextField2.textColor = .black
        case monthPickerView2:
            monthTextField2.text = "\(months[row])月"
            //            monthTextField2.textColor = .black
        case dayPickerView2:
            dayTextField2.text = "\(days[row])日"
            //            dayTextField2.textColor = .black
        default:
            break
        }
    }
}
