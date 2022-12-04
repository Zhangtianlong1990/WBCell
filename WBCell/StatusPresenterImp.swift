//
//  StatusPresenterImp.swift
//  WBCell
//
//  Created by 张天龙 on 2022/12/3.
//

import UIKit

class StatusPresenterImp: NSObject, StatusPresenterInterface {
    
    weak var controller: StatusViewController?
    
    func attemptToGetStatus() {
        var statuses = [MJStatus]()

        guard let filePath = Bundle.main.path(forResource: statusPlistPath, ofType: nil) else {
            if let controller = controller {
                controller.updateStatus(status: statuses)
            }
            return
        }

        guard let statusDics = NSArray.init(contentsOfFile: filePath) as? [[String:AnyObject]] else {
            if let controller = controller {
                controller.updateStatus(status: statuses)
            }
            return
        }

        for dic in statusDics {
            let status = MJStatus(dic: dic)
            statuses.append(status)
        }
        
        if let controller = controller {
            controller.updateStatus(status: statuses)
        }
    }
}


//    lazy var statuses: [MJStatus] = {
//
//        var statuses = [MJStatus]()
//
//        guard let filePath = Bundle.main.path(forResource: statusPlistPath, ofType: nil) else {
//            return statuses
//        }
//
//        guard let statusDics = NSArray.init(contentsOfFile: filePath) as? [[String:AnyObject]] else {
//            return statuses
//        }
//
//        for dic in statusDics {
//            let status = MJStatus(dic: dic)
//            statuses.append(status)
//        }
//
//        return statuses
//    }()
    
//    lazy var statuses: [MJStatus] = {
//        var statuses = [MJStatus]()
//
//        guard let filePath = Bundle.main.path(forResource: statusJSONPath, ofType: nil) else {
//            return statuses
//        }
//
//        guard let data = NSData(contentsOfFile: filePath) else {
//            return statuses
//        }
//
//        guard  let jsonObject = try? JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers) else {
//            return statuses
//        }
//
//        guard  let statusDics = jsonObject as? [[String: AnyObject]] else {
//            return statuses
//        }
//
//        for dic in statusDics {
//            let status = MJStatus(dic: dic)
//            statuses.append(status)
//        }
//
//        return statuses
//    }()
