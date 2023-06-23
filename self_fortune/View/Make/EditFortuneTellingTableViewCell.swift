//
//  EditFortuneTellingTableViewCell.swift
//  self_fortune
//
//  Created by 辻野竜志 on 2023/06/23.
//

import UIKit

class EditFortuneTellingTableViewCell: UITableViewCell{

    @IBOutlet weak var showPercentLabel: UILabel!
    @IBOutlet weak var affinityTextField: UITextField!
    @IBOutlet weak var percentSlider: UISlider!
    @IBOutlet weak var affinityTextView: UITextView!
    @IBOutlet weak var templateButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func templateActionButton(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureTextView()
    }
    
    func configureTextView() {
        affinityTextView.isScrollEnabled = false
        affinityTextView.textContainerInset = UIEdgeInsets.zero
        affinityTextView.textContainer.lineFragmentPadding = 0
        affinityTextView.delegate = self
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension EditFortuneTellingTableViewCell: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
            adjustTextViewHeight()
        }
        
    func adjustTextViewHeight() {
        let fixedWidth = affinityTextView.frame.size.width
        let newSize = affinityTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        affinityTextView.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
    }
}
