//
//  MJStatus.swift
//  WBCell
//
//  Created by 张天龙 on 2022/12/3.
//

import UIKit

@objcMembers
class MJStatus: NSObject {
    var text: String?
    var icon: String?
    var picture: String?
    var name: String?
    var vip: NSNumber?
    var cellHeight: CGFloat = 0
    init(dic: [String:AnyObject]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
