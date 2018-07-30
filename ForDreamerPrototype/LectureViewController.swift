//
//  LectureViewController.swift
//  ForDreamerPrototype
//
//  Created by CAUAD01 on 28/07/2018.
//  Copyright © 2018 CAUAD01. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class LectureViewController: UIViewController {

    // 전 화면인 MainTableViewController 에서 선택된 셀의 index를 받는 변수 선언
    var selectedLecture:Lecture?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard let lecture = selectedLecture else{
            return
        }
        playLecture(path: lecture.lectureURL)
    }
    
    // 동영상 실행하는 함수
    private func playLecture(path: String) {
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        
        // 영상 보여주기 및 
        playerLayer.frame = self.view.bounds
        playerLayer.frame = CGRect(x: 0, y: 64, width: 375, height: 218)
        self.view.layer.addSublayer(playerLayer)
    
        player.play()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
