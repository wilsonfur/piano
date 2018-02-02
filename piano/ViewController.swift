//
//  ViewController.swift
//  piano
//
//  Created by wilson on 2018/1/25.
//  Copyright © 2018年 wilson. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
   
    @IBOutlet weak var IntroduceView: UIVisualEffectView!
    @IBAction func ExitIntroduceView(_ sender: Any) {
         IntroduceView.alpha = 0
    }
    @IBAction func IntroduceButton(_ sender: Any) {
        IntroduceView.alpha = 1
    }
    @IBOutlet weak var InputCountTilteLabel: UILabel!
    @IBOutlet weak var InputCountLabel: UILabel!
    @IBOutlet weak var DoUI: UIButton!
    @IBOutlet weak var ReUI: UIButton!
    @IBOutlet weak var MiUI: UIButton!
    @IBOutlet weak var FaUI: UIButton!
    @IBOutlet weak var SolUI: UIButton!
    @IBOutlet weak var LaUI: UIButton!
    @IBOutlet weak var SiUI: UIButton!
    @IBAction func TipsSwitch(_ sender: UISwitch) {
        if (sender.isOn == true){
            TipsImageView.alpha = 1
            InputCountLabel.alpha = 1
            InputCountTilteLabel.alpha = 1
        }else{
            TipsImageView.alpha = 0
            InputCountLabel.alpha = 0
            InputCountTilteLabel.alpha = 0
        }
    }
    @IBAction func KeySwitch(_ sender: UISwitch) {
        if (sender.isOn == true){
            ShowOn()
        }else{
            ShowOff()
        }
    }
    
    @IBAction func KeyDo(_ sender: Any) {
        playSound(soundName:"pianoC")
        SpectrumArray.append(1)
        KeyCount()
        keyCal()
        ShowNext()
        Tips()
    }
    @IBAction func KeyRe(_ sender: Any) {
        playSound(soundName:"pianoD")
        SpectrumArray.append(2)
        KeyCount()
        keyCal()
        ShowNext()
        Tips()
    }
    @IBAction func KeyMi(_ sender: Any) {
        playSound(soundName:"pianoE")
        SpectrumArray.append(3)
        KeyCount()
        keyCal()
        ShowNext()
        Tips()
    }
    @IBAction func KeyFa(_ sender: Any) {
        playSound(soundName:"pianoF")
        SpectrumArray.append(4)
        KeyCount()
        keyCal()
        ShowNext()
        Tips()
    }
    @IBOutlet weak var TipsImageView: UIImageView!
    @IBAction func KeySol(_ sender: Any) {
        playSound(soundName:"pianoG")
        SpectrumArray.append(5)
        KeyCount()
        keyCal()
        ShowNext()
        Tips()
    }
    @IBAction func KeyLa(_ sender: Any) {
        playSound(soundName:"pianoA")
        SpectrumArray.append(6)
        KeyCount()
        keyCal()
        ShowNext()
        Tips()
    }
    @IBAction func KeySi(_ sender: Any) {
        playSound(soundName:"pianoB")
        SpectrumArray.append(7)
        KeyCount()
        keyCal()
        ShowNext()
        Tips()
    }
    
    func Tips (){
        TipsImageView.image = UIImage(named:"\(RightSpectrumArray[KeycountTotal])")
        
    }
    func ShowOn(){
        DoUI.setTitleColor(UIColor.black, for: UIControlState.normal)
        ReUI.setTitleColor(UIColor.black, for: UIControlState.normal)
        MiUI.setTitleColor(UIColor.black, for: UIControlState.normal)
        FaUI.setTitleColor(UIColor.black, for: UIControlState.normal)
        SolUI.setTitleColor(UIColor.black, for: UIControlState.normal)
        LaUI.setTitleColor(UIColor.black, for: UIControlState.normal)
        SiUI.setTitleColor(UIColor.black, for: UIControlState.normal)
    }
    
    func ShowOff(){
        DoUI.setTitleColor(UIColor.white, for: UIControlState.normal)
        ReUI.setTitleColor(UIColor.white, for: UIControlState.normal)
        MiUI.setTitleColor(UIColor.white, for: UIControlState.normal)
        FaUI.setTitleColor(UIColor.white, for: UIControlState.normal)
        SolUI.setTitleColor(UIColor.white, for: UIControlState.normal)
        LaUI.setTitleColor(UIColor.white, for: UIControlState.normal)
        SiUI.setTitleColor(UIColor.white, for: UIControlState.normal)
    }
    
    func KeyCount() {
        if (41 - KeycountTotal) == 0{
            for i in 0...41{
                if SpectrumArray[i] == RightSpectrumArray[i] {
                    Scores += 1
                }
            }
            if case 0...5 = Scores {
                InputCountTilteLabel.text = "再加油喔！你得到一隻青蛙～"
                InputCountLabel.text = "🐸"
            } else if case 6...20 = Scores {
                InputCountTilteLabel.text = "還可以啦～你得到兩隻猴子！"
                InputCountLabel.text = "🐵 🐵"
            } else if case 21...30 = Scores {
                InputCountTilteLabel.text = "還不錯喔，你得到三隻狐狸！"
                InputCountLabel.text = "🦊 🦊 🦊"
            } else if case 31...41 = Scores {
                InputCountTilteLabel.text = "很厲害喔～你得到四隻狗狗！"
                InputCountLabel.text = "🐶🐶🐶🐶"
            } else {
                InputCountTilteLabel.text = "太威了，你得到五隻老虎"
                InputCountLabel.text = "🐯 🐯 🐯 🐯 🐯"
            }
        }else{
            InputCountLabel.text = "\(41 - KeycountTotal)"
            InputCountTilteLabel.text = "剩餘鍵數"
        }
    }
    
    func ShowNext(){
        if RightSpectrumArray[KeycountTotal] == 1 {
            DoUI.setTitleColor(UIColor.red, for: UIControlState.normal)
        }else{
            DoUI.setTitleColor(UIColor.black, for: UIControlState.normal)
        }
        if RightSpectrumArray[KeycountTotal] == 2 {
            ReUI.setTitleColor(UIColor.red, for: UIControlState.normal)
        }else{
            ReUI.setTitleColor(UIColor.black, for: UIControlState.normal)
        }
        if RightSpectrumArray[KeycountTotal] == 3 {
            MiUI.setTitleColor(UIColor.red, for: UIControlState.normal)
        }else{
            MiUI.setTitleColor(UIColor.black, for: UIControlState.normal)
        }
        if RightSpectrumArray[KeycountTotal] == 4 {
            FaUI.setTitleColor(UIColor.red, for: UIControlState.normal)
        }else{
            FaUI.setTitleColor(UIColor.black, for: UIControlState.normal)
        }
        if RightSpectrumArray[KeycountTotal] == 5 {
            SolUI.setTitleColor(UIColor.red, for: UIControlState.normal)
        }else{
            SolUI.setTitleColor(UIColor.black, for: UIControlState.normal)
        }
        if RightSpectrumArray[KeycountTotal] == 6 {
            LaUI.setTitleColor(UIColor.red, for: UIControlState.normal)
        }else{
            LaUI.setTitleColor(UIColor.black, for: UIControlState.normal)
        }
        if RightSpectrumArray[KeycountTotal] == 7 {
            SiUI.setTitleColor(UIColor.red, for: UIControlState.normal)
        }else{
            SiUI.setTitleColor(UIColor.black, for: UIControlState.normal)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

