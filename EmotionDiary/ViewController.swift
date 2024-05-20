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
        
        for i in 0...emotionLabelList.count - 1 {
            emotionLabelList[i].tag = i
            emotionLabelList[i].text = emotionList[i]
            emotionButtonList[i].tag = i
        }
    }

    
    @IBAction func ImageButtonTapped(_ sender: UIButton) {
        let tag: Int = sender.tag
        countList[tag] += 1
        emotionLabelList[tag].text = "\(emotionList[tag]) \(countList[tag])"
    }
    
    
}

