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
//        familyNameTextField1.inputAccessoryView = createToolbar()
//        firstNameTextField1.inputAccessoryView = createToolbar()
        
        yearTextField1.inputAccessoryView = createToolbar(for: yearTextField1)
        monthTextField1.inputAccessoryView = createToolbar(for: monthTextField1)
        dayTextField1.inputAccessoryView = createToolbar(for: dayTextField1)
        
//ツールバーに完了をつけるか🟠
//        familyNameTextField2.inputAccessoryView = createToolbar()
//        firstNameTextField2.inputAccessoryView = createToolbar()
        
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
        SVProgressHUD.show(withStatus: "占い中")
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            SVProgressHUD.dismiss()
            self.performSegue(withIdentifier: "FortuneSegue", sender: sender)
            print("読込み")
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
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([spaceButton, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        return toolbar
    }
    
    @objc func doneButtonTapped(_ sender: UIBarButtonItem) {
        if let textField = view.viewWithTag(currentTextFieldTag + 1) as? UITextField {
                textField.becomeFirstResponder() // 次のテキストフィールドにフォーカスを移動
            } else {
                if let textField = view.viewWithTag(currentTextFieldTag) as? UITextField {
                    textField.resignFirstResponder() // キーボードを閉じる
                }
            }
    }
}
extension FortuneDoViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextFieldTag = textField.tag
        switch textField {
        case yearTextField1:
            yearPickerView1.selectRow(years.firstIndex(of: Int(textField.text ?? "") ?? 2000) ?? 0, inComponent: 0, animated: false)
        case monthTextField1:
            monthPickerView1.selectRow(months.firstIndex(of: Int(textField.text ?? "") ?? 1) ?? 0, inComponent: 0, animated: false)
        case dayTextField1:
            dayPickerView1.selectRow(days.firstIndex(of: Int(textField.text ?? "") ?? 1) ?? 0, inComponent: 0, animated: false)
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 次のTag番号を持っているテキストボックスがあれば、フォーカスする
        let nextTag = textField.tag + 1
        if let nextTextField = self.view.viewWithTag(nextTag) {
            nextTextField.becomeFirstResponder()
        }else {
            textField.resignFirstResponder()
        }
        return true
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
