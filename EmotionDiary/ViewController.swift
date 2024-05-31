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
    
    var countListChange: [Int] {
        get {
            guard let oldData = UserDefaults.standard.array(forKey: "data")  else {
               
                print("문제가 있는디")
                return []
                
            }
            countList = oldData as! [Int]
            setCountNumUI()
            return countList
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "data")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleLabel.text = "감정 다이어리"
        
        for i in 0...emotionLabelList.count - 1 {
            emotionLabelList[i].tag = i
            emotionButtonList[i].tag = i
        }
        _ = self.countListChange
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
        //대신에 카운트 체인지 프로퍼티 사용
//        UserDefaults.standard.set(countList, forKey: "data")
        countListChange = countList
    }
   
 
    
    @IBAction func deleteButtonClicked(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "data")
        setCountNumUI()
        countList = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
    
}

