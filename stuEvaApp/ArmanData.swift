//
//  ArmanData.swift
//  stuEvaApp
//
//  Created by arman on 5/25/15.
//  Copyright (c) 2015 arman. All rights reserved.
//

import Foundation

class ArmanData {
    
    var xuehao = "1100012880"
    var xingming = "Arman"
    var xingbie = "male"
    var zhuanye = "EE"
    var shouji = "18810521459"
    var email = "balleddog@gmail.com"
    var shulianyuyan = "python"
    var macshulianchengdu = "fair"
    var xcodeshulianchengdu = "not bad"
    var jiangshouyuyan = "swift"
    var dayishijianduan = "monam"
    var status = "Insertion successful"
}

class ArmanResult {
    
    var zhuanye: [String: Int] = ["电子":0, "计算机":0, "微电子":0, "智能":0, "其他":0]
    var xingbie: [String: Int] = ["男":0, "女":0]
    var shulianyuyan:[String: Int] = ["C": 0, "C++": 0, "C#": 0, "JAVA": 0, "PHP": 0, "ObjC": 0, "Swift": 0, "Python": 0, "Ruby": 0, "其他": 0]
    var macshulianchengdu: [String: Int] = ["从未使用":0, "入门":0, "熟练":0, "精通":0]
    var xcodeshulianchengdu: [String: Int] = ["从未使用":0, "入门":0, "熟练":0, "精通":0]
    var jiangshouyuyan: [String: Int] = ["Swift":0, "Objc":0]
    var dayishijianduan: [String: Int] = ["周一上午": 0, "周一下午": 0, "周二上午": 0, "周二下午": 0, "周三上午": 0, "周三下午": 0, "周四上午": 0, "周四下午": 0, "周五上午": 0, "周五下午": 0, "周六上午": 0, "周六下午": 0, "周日上午": 0, "周日下午": 0]
}