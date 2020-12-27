//
//  ViewController.swift
//  passwordUnlockEricApp1
//
//  Created by user on 2020/9/12.
//

import UIKit

class ViewController: UIViewController {
    
    var PassWordTyped = ""
    
    @IBOutlet weak var FirstPassword: UIImageView! //第1個隱藏數字的圖形
    @IBOutlet weak var SecondPassword: UIImageView! //第2個隱藏數字的圖形
    @IBOutlet weak var ThirdPassword: UIImageView! //第3個隱藏數字的圖形
    @IBOutlet weak var FourthPassword: UIImageView! //第4個隱藏數字的圖形
    @IBOutlet weak var collectView: UIView! // 做震動效果的 View
    @IBOutlet weak var FivethCharacter: UILabel! // 第1個顯示數字的 label
    @IBOutlet weak var SixCharacter: UILabel! // 第2個顯示數字的 label
    
    // 判斷輸入數字的顯示 與 密碼圖片 的呈現。重點在於 利用 isHighted 的屬性
    func ShowPasswordCount (){
        if PassWordTyped.count == 0 {
            FirstPassword.isHighlighted = false
            SecondPassword.isHighlighted = false
            ThirdPassword.isHighlighted = false
            FourthPassword.isHighlighted = false
        } else if PassWordTyped.count == 1{
            // 以下是將 String 取出 數值字元 並放入 text 屬性的方法 ！！！我自己想出來的招喔 ！呵呵 ！
            let c1 = PassWordTyped.index(PassWordTyped.startIndex, offsetBy: 0)
            FivethCharacter.text = "\(PassWordTyped[c1])"
         
            FirstPassword.isHighlighted = false
            SecondPassword.isHighlighted = false
            ThirdPassword.isHighlighted = false
            FourthPassword.isHighlighted = false
        } else if PassWordTyped.count == 2{
            let c1 = PassWordTyped.index(PassWordTyped.startIndex, offsetBy: 0)
            FivethCharacter.text = "\(PassWordTyped[c1])"
            
            let c2 = PassWordTyped.index(PassWordTyped.startIndex, offsetBy: 1)
            SixCharacter.text = "\(PassWordTyped[c2])"
            
            FirstPassword.isHighlighted = false
            SecondPassword.isHighlighted = false
            ThirdPassword.isHighlighted = false
            FourthPassword.isHighlighted = false
        } else if PassWordTyped.count == 3{
            let c1 = PassWordTyped.index(PassWordTyped.startIndex, offsetBy: 0)
            FivethCharacter.text = "\(PassWordTyped[c1])"
            
            let c2 = PassWordTyped.index(PassWordTyped.startIndex, offsetBy: 1)
            SixCharacter.text = "\(PassWordTyped[c2])"
            
            FirstPassword.isHighlighted = true
            SecondPassword.isHighlighted = false
            ThirdPassword.isHighlighted = false
            FourthPassword.isHighlighted = false
        }else if PassWordTyped.count == 4{
            
            let c1 = PassWordTyped.index(PassWordTyped.startIndex, offsetBy: 0)
            FivethCharacter.text = "\(PassWordTyped[c1])"
            
            let c2 = PassWordTyped.index(PassWordTyped.startIndex, offsetBy: 1)
            SixCharacter.text = "\(PassWordTyped[c2])"
            
            FirstPassword.isHighlighted = true
            SecondPassword.isHighlighted = true
            ThirdPassword.isHighlighted = false
            FourthPassword.isHighlighted = false
            //CorrectWrong()
        }
        else if PassWordTyped.count == 5{
            
            let c1 = PassWordTyped.index(PassWordTyped.startIndex, offsetBy: 0)
            FivethCharacter.text = "\(PassWordTyped[c1])"
            
            let c2 = PassWordTyped.index(PassWordTyped.startIndex, offsetBy: 1)
            SixCharacter.text = "\(PassWordTyped[c2])"
            
            FirstPassword.isHighlighted = true
            SecondPassword.isHighlighted = true
            ThirdPassword.isHighlighted = true
            FourthPassword.isHighlighted = false
            
            
            //CorrectWrong()
        }
        else if PassWordTyped.count == 6{
            
            let c1 = PassWordTyped.index(PassWordTyped.startIndex, offsetBy: 0)
            FivethCharacter.text = "\(PassWordTyped[c1])"
            
            let c2 = PassWordTyped.index(PassWordTyped.startIndex, offsetBy: 1)
            SixCharacter.text = "\(PassWordTyped[c2])"
            
            FirstPassword.isHighlighted = true
            SecondPassword.isHighlighted = true
            ThirdPassword.isHighlighted = true
            FourthPassword.isHighlighted = true
            
            CorrectWrong()
        }
        
    }
    
    // 以下為 清空 密碼 的 func
    func Clearpassword (){
        FivethCharacter.text = ""
        SixCharacter.text = ""
        FirstPassword.isHighlighted = false
        SecondPassword.isHighlighted = false
        ThirdPassword.isHighlighted = false
        FourthPassword.isHighlighted = false
        PassWordTyped = ""
    }
    
    // 以下為判斷密碼是否正確的 func
    func CorrectWrong (){
        if PassWordTyped == "123698" {
            let alert = UIAlertController(title: "太好了", message: "密碼輸入正確", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: false, completion: Clearpassword)
        }else{
            let alert = UIAlertController(title: "抱歉", message: "密碼不正確，請重新輸入 ！", preferredStyle: .alert)
            let action = UIAlertAction(title: "再試一次", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: false, completion: Clearpassword)
            
            // 密碼錯誤的 view 震動 的方式 ！
            let codeShake = CABasicAnimation(keyPath: "position")
            codeShake.duration = 0.085
            codeShake.repeatCount = 3
            codeShake.fromValue = NSValue(cgPoint: CGPoint(x: collectView.center.x - 10, y: collectView.center.y))
            codeShake.toValue = NSValue(cgPoint: CGPoint(x: collectView.center.x + 10, y: collectView.center.y))
            collectView.layer.add(codeShake, forKey: "position")
            
        }
    }
    
    // 以下是 按鍵 點選數值後。利用 String.append 變成 String 的方法 ！ 數值變 String , 反之亦然 ！要貫通此道 ！
    @IBAction func typePassword(_ sender: UIButton) {
       
        if let Inputtext = sender.titleLabel?.text
        {
            PassWordTyped.append(Inputtext)
       
            print(PassWordTyped)
            ShowPasswordCount()
        }
    }
    
    // 刪除輸入數值
    @IBAction func deletepassword(_ sender: UIButton) {
        if PassWordTyped.count >= 0 {
            PassWordTyped = String(PassWordTyped.dropLast(1))
            print(PassWordTyped)
            ShowPasswordCount()
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

