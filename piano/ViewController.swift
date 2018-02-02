//
//  ViewController.swift
//  piano
//
//  Created by wilson on 2018/1/25.
//  Copyright © 2018年 wilson. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
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
        }else{
            TipsImageView.alpha = 0
            InputCountLabel.alpha = 0
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
        Tips()
    }
    @IBAction func KeyRe(_ sender: Any) {
        playSound(soundName:"pianoD")
        SpectrumArray.append(2)
        KeyCount()
        keyCal()
        Tips()
    }
    @IBAction func KeyMi(_ sender: Any) {
        playSound(soundName:"pianoE")
        SpectrumArray.append(3)
        KeyCount()
        keyCal()
        Tips()
    }
    @IBAction func KeyFa(_ sender: Any) {
        playSound(soundName:"pianoF")
        SpectrumArray.append(4)
        KeyCount()
        keyCal()
        Tips()
    }
    @IBOutlet weak var TipsImageView: UIImageView!
    @IBAction func KeySol(_ sender: Any) {
        playSound(soundName:"pianoG")
        SpectrumArray.append(5)
        KeyCount()
        keyCal()
        Tips()
    }
    @IBAction func KeyLa(_ sender: Any) {
        playSound(soundName:"pianoA")
        SpectrumArray.append(6)
        KeyCount()
        keyCal()
        Tips()
    }
    @IBAction func KeySi(_ sender: Any) {
        playSound(soundName:"pianoB")
        SpectrumArray.append(7)
        KeyCount()
        keyCal()
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
                InputCountLabel.text = "🐸"
            } else if case 6...20 = Scores {
                InputCountLabel.text = "🐵🐵"
            } else if case 21...30 = Scores {
                InputCountLabel.text = "🦊🦊🦊"
            } else if case 31...41 = Scores {
                InputCountLabel.text = "🐶🐶🐶🐶"
            } else {
                InputCountLabel.text = "🐯🐯🐯🐯🐯"
            }
        }else{
            InputCountLabel.text = "\(41 - KeycountTotal)"
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

