//
//  ViewController.swift
//  EmotionDiary
//
//  Created by 쌩 on 5/17/24.
//

import UIKit

class ViewController: UIViewController {

    var countList = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var emotionList = ["행복해", "사랑해", "좋아해", "화났다", "보통얌", "잠온다", "식은땀", "속상해", "맘아파"]
    
    @IBOutlet var emotionLabelList: [UILabel]!
    @IBOutlet var emotionButtonList: [UIButton]!
    @IBOutlet var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleLabel.text = "감정 다이어리"
        checkMyData()
        for i in 0...emotionLabelList.count - 1 {
            emotionLabelList[i].tag = i
            emotionLabelList[i].text = emotionList[i]
            emotionButtonList[i].tag = i
            emotionLabelList[i].text = "\(emotionList[i]) \(countList[i])"
        }
        
    }
    private func checkMyData() {
        guard let oldData = UserDefaults.standard.array(forKey: "data") else {
            print("읽어오는 과정에서 문제가 있습니다.")
            return
        }
        countList = oldData as! [Int]
        
        print(#function, countList)
    }
    
    @IBAction func ImageButtonTapped(_ sender: UIButton) {
        let tag: Int = sender.tag
        countList[tag] += 1
        emotionLabelList[tag].text = "\(emotionList[tag]) \(countList[tag])"
        UserDefaults.standard.set(countList, forKey: "data")
        
        
    }
    
    
}

