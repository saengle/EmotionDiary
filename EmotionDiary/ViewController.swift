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
            emotionButtonList[i].tag = i
        }
        checkMyData()
    }
    private func checkMyData() {
        guard let oldData = UserDefaults.standard.array(forKey: "data") else {
            print("읽어오는 과정에 문제가 있습니다.")
            setCountNumUI()
            return
        }
        countList = oldData as! [Int]
        setCountNumUI()
    }
    
    private func setCountNumUI() {
        for i in 0...emotionList.count - 1 {
            if countList[i] == 0 {
                emotionLabelList[i].text = "\(emotionList[i])"
            } else {
                emotionLabelList[i].text = "\(emotionList[i]) \(countList[i])"
            }
        }
    }
    
    @IBAction func ImageButtonTapped(_ sender: UIButton) {
        let tag: Int = sender.tag
        countList[tag] += 1
        emotionLabelList[tag].text = "\(emotionList[tag]) \(countList[tag])"
        UserDefaults.standard.set(countList, forKey: "data")
    }
    
    @IBAction func deleteButtonClicked(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "data")
        setCountNumUI()
        countList = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
    
}

