//
//  MainTableViewController.swift
//  ForDreamerPrototype
//
//  Created by CAUAD01 on 24/07/2018.
//  Copyright © 2018 CAUAD01. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class MainTableViewController: UITableViewController {

    // 빈 배열 선언
    var lectureArray:[Lecture] = []
    
    // 동영상의 썸네일을 따오는 함수
    func getThumbnailFrom(path: String) -> UIImage? {
        do {
            let asset = AVAsset(url: NSURL(fileURLWithPath: path) as URL)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            
            imgGenerator.appliesPreferredTrackTransform = true
            
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 2), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            
            return thumbnail
        } catch let error {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return nil
        }
    }
    
    // 동영상의 시간을 따오는 함수
    func getLectureDuration(path: String) -> Float64 {
        let asset = AVAsset(url: NSURL(fileURLWithPath: path) as URL)
        let duration = asset.duration
        
        return CMTimeGetSeconds(duration)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 배열에 추가할 각각의 데이터 생성
        let lecture_1 = Lecture(lectureURL: "/Users/cauad01/Desktop/ForDreamerPrototype/The Cheesecake 01.mp4",lectureImg: getThumbnailFrom(path: "/Users/cauad01/Desktop/ForDreamerPrototype/The Cheesecake 01.mp4"), lectureTitle: "The Cheesecake 1", lectureDuration: getLectureDuration(path: "/Users/cauad01/Desktop/ForDreamerPrototype/The Cheesecake 01.mp4"), lectureSectences: 1)
        let lecture_2 = Lecture(lectureURL: "/Users/cauad01/Desktop/ForDreamerPrototype/The Cheesecake 02.mp4",lectureImg: getThumbnailFrom(path: "/Users/cauad01/Desktop/ForDreamerPrototype/The Cheesecake 02.mp4"), lectureTitle: "The Cheesecake 2", lectureDuration: getLectureDuration(path: "/Users/cauad01/Desktop/ForDreamerPrototype/The Cheesecake 02.mp4"), lectureSectences: 2)
        let lecture_3 = Lecture(lectureURL: "/Users/cauad01/Desktop/ForDreamerPrototype/The Cheesecake 03.mp4",lectureImg: getThumbnailFrom(path: "/Users/cauad01/Desktop/ForDreamerPrototype/The Cheesecake 03.mp4"), lectureTitle: "The Cheesecake 3", lectureDuration: getLectureDuration(path: "/Users/cauad01/Desktop/ForDreamerPrototype/The Cheesecake 03.mp4"), lectureSectences: 3)
        
        // 데이터를 가진 배열로 초기화
        lectureArray = [lecture_1, lecture_2, lecture_3]
        
        // TableView의 높이 설정. 이게 없으면 기본 설정으로 되어 Cell 내용이 짤린다.
        self.tableView.rowHeight = 129
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        // 아직 따로 Section을 구분하지 않아 1로 설정
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 배열의 갯수만큼 셀 생성
        return lectureArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)

        // Configure the cell...
        guard let myCell = cell as? TableViewCell else {
            return cell
        }
        
        // 이미지 둥글게 표시 내용
        myCell.thumbnailView?.layer.cornerRadius = 15
        myCell.thumbnailView?.clipsToBounds = true  // 이미지 둥글게 표시 내용 끝
        myCell.thumbnailView?.image = lectureArray[indexPath.row].lectureImg
        
        myCell.videoTitle.text = lectureArray[indexPath.row].lectureTitle
        myCell.videoDuration.text = String(lectureArray[indexPath.row].lectureDuration)
        myCell.videoSectences.text = String(lectureArray[indexPath.row].lectureSectences)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // destination의 형태가 ViewController라서 형태를 바꿔줘야 한다
        let lectureViewController = segue.destination as? LectureViewController
        
        let selectedIndexPath = self.tableView.indexPathForSelectedRow
        
        if let indexPath = selectedIndexPath {
            lectureViewController?.selectedLecture = lectureArray[indexPath.row]
        }
    }
}

// Custom 으로 제작한 TablViewCell
class TableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoDuration: UILabel!
    @IBOutlet weak var videoSectences: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
