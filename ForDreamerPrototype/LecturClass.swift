//
//  LecturClass.swift
//  ForDreamerPrototype
//
//  Created by CAUAD01 on 28/07/2018.
//  Copyright © 2018 CAUAD01. All rights reserved.
//

import UIKit

class Lecture {
    var lectureURL:String
    var lectureImg:UIImage?
    var lectureTitle:String
    var lectureDuration:Float64
    var lectureSectences:Int
    
    init(lectureURL:String, lectureImg:UIImage?, lectureTitle:String, lectureDuration:Float64, lectureSectences:Int) {
        self.lectureURL = lectureURL
        self.lectureImg = lectureImg
        self.lectureTitle = lectureTitle
        self.lectureDuration = lectureDuration
        self.lectureSectences = lectureSectences
    }
}
