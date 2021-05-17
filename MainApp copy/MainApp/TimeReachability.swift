//
//  TimeReachability.swift
//  MainApp
//
//  Created by Lelio Jorge on 17/05/21.
//

import Foundation


class TimeReachability {
    
    var pathTime: (() -> Void)?
    
    func start() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.pathTime?()
        }
    }
    
    func stop() {
        pathTime = nil
    }
}
