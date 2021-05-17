//
//  Connection.swift
//  MainApp
//
//  Created by Lelio Jorge on 17/05/21.
//


import Foundation
import Network

class NetworkReachability {
    
    var pathMonitor: NWPathMonitor!
    var path: NWPath?
    
    private lazy var pathUpdateHandler: ((NWPath) -> Void) = { path in
        self.path = path
    }
    
    let backgroudQueue = DispatchQueue.global(qos: .background)
    
    init() {
        pathMonitor = NWPathMonitor()
        pathMonitor.pathUpdateHandler = self.pathUpdateHandler
        pathMonitor.start(queue: backgroudQueue)
    }
    
    func isConnectionAvailable() -> Bool {
        if let path = self.path {
            if path.status == NWPath.Status.satisfied {
                return true
            }
        }
        return false
    }
}
