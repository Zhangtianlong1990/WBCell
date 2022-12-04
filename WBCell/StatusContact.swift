//
//  StatusPresenterInterface.swift
//  WBCell
//
//  Created by 张天龙 on 2022/12/3.
//

import Foundation

protocol StatusPresenterInterface {
    func attemptToGetStatus()
}

protocol StatusViewController: AnyObject{
    func updateStatus(status: [MJStatus])
}

extension StatusPresenterInterface {
//    func attemptToGetStatus(){
//        
//    }
}
