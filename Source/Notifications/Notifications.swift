//
//  Notifications.swift
//  Pods
//
//  Created by Hellen Soloviy on 7/25/17.
//
//

import Foundation
import UserNotifications

//TODO: Not End
private final class Notifications: PermissionService {
    
    public required init(with configuration: PermissionConfiguration) { }
    
    /**
     */
    
    public func requestPermission(_ callback: @escaping (_ success: Bool) -> Void) {
        //TODO: Error handling
        
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { (result, error) in
                
            }
        } else {
            // Fallback on earlier version
            
        }
    
    }
    
    /**
     
     */
    
    public func status() -> PermissionStatus {
        return .notDetermined
    }
    
}
