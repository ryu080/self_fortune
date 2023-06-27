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
    //2人目
    @IBOutlet weak var familyNameTextField2: UITextField!
    @IBOutlet weak var firstNameTextField2: UITextField!
    @IBOutlet weak var yearTextField2: UITextField!
    @IBOutlet weak var monthTextField2: UITextField!
    @IBOutlet weak var dayTextField2: UITextField!
    
    var yearPickerView1: UIPickerView!
    var monthPickerView1: UIPickerView!
    var dayPickerView1: UIPickerView!
    var yearPickerView2: UIPickerView!
    var monthPickerView2: UIPickerView!
    var dayPickerView2: UIPickerView!


    let years = Array(1930...2023) // 年の範囲
    let months = Array(1...12) // 月の範囲
    let days = Array(1...31) // 日の範囲
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // テキストフィールドのデリゲートを設定
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
        
        yearTextField2.inputView = yearPickerView1
        monthTextField2.inputView = monthPickerView1
        dayTextField2.inputView = dayPickerView1
        
        // ツールバーを設定してキーボードに追加
        yearTextField1.inputAccessoryView = createToolbar()
        monthTextField1.inputAccessoryView = createToolbar()
        dayTextField1.inputAccessoryView = createToolbar()
        
        yearTextField2.inputAccessoryView = createToolbar()
        monthTextField2.inputAccessoryView = createToolbar()
        dayTextField2.inputAccessoryView = createToolbar()

    }
    
    @IBAction func fortuneButton(_ sender: Any) {
        SVProgressHUD.show(withStatus: "占い中")
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            SVProgressHUD.dismiss()
            self.performSegue(withIdentifier: "FortuneSegue", sender: sender)
            print("読込み")
        }

    }

    func createToolbar() -> UIToolbar {
            let toolbar = UIToolbar()
            toolbar.barStyle = .default
            toolbar.isTranslucent = true
            toolbar.tintColor = .systemBlue
            toolbar.sizeToFit()
            
            let doneButton = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(doneButtonTapped))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([spaceButton, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        return toolbar
    }
    
    @objc func doneButtonTapped() {
        view.endEditing(true) // キーボードを非表示にする
    }
}
extension FortuneDoViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
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
            yearTextField1.text = String(years[row])
        case monthPickerView1:
            monthTextField1.text = String(months[row])
        case dayPickerView1:
            dayTextField1.text = String(days[row])
        case yearPickerView2:
            yearTextField2.text = String(years[row])
        case monthPickerView2:
            monthTextField2.text = String(months[row])
        case dayPickerView2:
            dayTextField2.text = String(days[row])
        default:
            break
        }
    }
}
