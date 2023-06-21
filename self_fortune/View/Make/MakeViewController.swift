//
//  MakeViewController.swift
//  self_fortune
//
//  Created by 辻野竜志 on 2023/05/12.
//

import UIKit

class MakeViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var fortuneSegment: UISegmentedControl!
    let delegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //どこかをタッチすると実行されるメソッド
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //キーボードを閉じる
            self.view.endEditing(true)
        }
    @IBAction func didTapButton(_ sender: Any) {
        
        switch fortuneSegment.selectedSegmentIndex {
        case 0 : textView.text = "あなたには明るい未来が待っています。\n今までの努力と忍耐が実を結び、成功への道が開けるでしょう。\n自分自身への自信を持ち、前向きな姿勢を守ることが重要です。\n困難立ち向かう勇気と決断力を持って結果をください。\n運命の流れがあなたに味方しているため、思い切って行動したと良いが得られるでしょう。\nまた、人間関係においても良い変化が訪れます。\n 新しい友人やパートナーとの出会いがあり、あなたの人生に新たな喜びや成長をもたらします。\n他人との協力やチームワークが重要になりますので、思いやりとコミュニケーション能力を大切にしてください。\nさらに、健康面ではバランスの取れた生活を心掛けることが重要です。\n 適度な運動や健康食事、十分な休息をとることで体調を整えましょう。\n良い未来を迎えることができるでしょう。\nただし、や運命の未来は常に変化するものです。\n自分の行動や選択によって結果が左右されることを忘れずに、自分自身を信じながら進んでください。"
            
        case 1 : textView.text = "あなたの未来には、幸福や喜びが訪れるでしょう。\n周囲の人々との関係は良好で、愛や友情に恵まれます。また、あなたの才能や能力が認められ、成功や成果を得るチャンスがあります健康面でも、バランスの取れた生活で、元気で活力に満ちた日々を過ごすことができます。\nさらに、新たな経験や冒険に積極的に挑戦することで、人生に喜びと充実をポジティブなエネルギーを持ちながら、目標に向かって進んでいくことが重要です。"
        case 2 : textView.text = "現在、仕事や学業において困難や挫折が訪れているようです。予期しない問題や障害が出ているかもしれません。でも、このような逆境は成長の機会でもあります。大切なのは、挫折を乗り越えるためのポジティブなアプローチです。\nこの困難な状況を乗り越えるためには、自己評価や自己信頼を高める必要があります。まずは、自分の強みや達成したい目標を明確にしましょう。 、柔軟な対応策を見つけ努力しましょう。\nさらに、支えとなる人々に助けを求めることも重要です。信頼できる友人や家族とのコミュニケーションを大切に、励ましやアドバイスを受けることで、困難な場面での気持ちの持ち方や解決策を見つける手助けになるでしょう。\n困難な時期は一時的なものであり、今後の全てを決定するものではありません。自分自身を信じ、前向きな行動を続けることで、新たなチャンスや成功へ道が開けるでしょう。 「内に強さと成長のポテンシャルを持っています。困難を乗り越えた先に、より良い未来が待っていることを信じてください。"
            
        default:assertionFailure("selectedSegmentIndex is invalid")
            
        }
    }
    
    @IBAction func fixedButton(_ sender: Any) {
        
        delegate.text = textView.text
    }
    
}
