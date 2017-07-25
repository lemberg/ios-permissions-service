//
//  Notifications.swift
//  Pods
//
//  Created by Hellen Soloviy on 7/25/17.
//
//

import Foundation

//    UNUserNotificationCenter.current().requestAuthorization(options: [.alert])

public final class Notifications: PermissionService {
    
    public init() {}
    
    /**
     */
    
    public func requestPermission(_ callback: @escaping (_ success: Bool) -> Void) {
        //TODO: Error handling
        if !checkPermissionKey(for: .bluetoothPeripheralUsageDescription) { return }
        
    }
    
    /**
     
     */
    
    public func status() -> PermissionStatus {
        return .notDetermined
    }
    
}
