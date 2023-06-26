//
//  FortuneDoViewController.swift
//  self_fortune
//
//  Created by 辻野竜志 on 2023/06/22.
//

import UIKit
import SVProgressHUD

class FortuneDoViewController: UIViewController {
    
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var dayTextField: UITextField!
    
    var yearPickerView: UIPickerView!
    var monthPickerView: UIPickerView!
    var dayPickerView: UIPickerView!
    
    let years = Array(1930...2023) // 年の範囲
    let months = Array(1...12) // 月の範囲
    let days = Array(1...31) // 日の範囲
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // テキストフィールドのデリゲートを設定
        yearTextField.delegate = self
        monthTextField.delegate = self
        dayTextField.delegate = self
        
        // ピッカービューの作成
        yearPickerView = UIPickerView()
        monthPickerView = UIPickerView()
        dayPickerView = UIPickerView()
        
        // データソースとデリゲートを設定
        yearPickerView.dataSource = self
        yearPickerView.delegate = self
        monthPickerView.dataSource = self
        monthPickerView.delegate = self
        dayPickerView.dataSource = self
        dayPickerView.delegate = self
        
        // テキストフィールドのキーボードをピッカービューに置き換える
        yearTextField.inputView = yearPickerView
        monthTextField.inputView = monthPickerView
        dayTextField.inputView = dayPickerView
        
        // ツールバーを設定してキーボードに追加
        yearTextField.inputAccessoryView = createToolbar()
        monthTextField.inputAccessoryView = createToolbar()
        dayTextField.inputAccessoryView = createToolbar()
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
        case yearTextField:
            yearPickerView.selectRow(years.firstIndex(of: Int(textField.text ?? "") ?? 1930) ?? 0, inComponent: 0, animated: false)
        case monthTextField:
            monthPickerView.selectRow(months.firstIndex(of: Int(textField.text ?? "") ?? 1) ?? 0, inComponent: 0, animated: false)
        case dayTextField:
            dayPickerView.selectRow(days.firstIndex(of: Int(textField.text ?? "") ?? 1) ?? 0, inComponent: 0, animated: false)
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
        case yearPickerView:
            return years.count
        case monthPickerView:
            return months.count
        case dayPickerView:
            return days.count
        default:
            return 0
        }
    }
    
    
}
extension FortuneDoViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case yearPickerView:
            return String(years[row])
        case monthPickerView:
            return String(months[row])
        case dayPickerView:
            return String(days[row])
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case yearPickerView:
            yearTextField.text = String(years[row])
        case monthPickerView:
            monthTextField.text = String(months[row])
        case dayPickerView:
            dayTextField.text = String(days[row])
        default:
            break
        }
    }
}
