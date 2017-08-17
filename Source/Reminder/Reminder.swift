//
//  Reminder.swift
//
//  Created by Hellen Soloviy on 6/6/17.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

#if PERMISSION_REMINDER
import UIKit
import EventKit

public final class Reminder: PermissionService {
    
    let entityType = EKEntityType.reminder
    
    public required init(with configuration: PermissionConfiguration) { }
    
    public func status() -> PermissionStatus {
        let statusInt = EKEventStore.authorizationStatus(for: entityType).rawValue
        guard let status = PermissionStatus(rawValue: statusInt), (0...3) ~= statusInt else {
            assertionFailure("Impossible status")
            return .notDetermined
        }
        return status
    }
    
    public func requestPermission(_ callback: @escaping (_ success: Bool) -> Void) {
        
        EKEventStore().requestAccess(to: entityType) {
            (accessGranted: Bool, error: Error?) in
            callback(accessGranted)
        }
    }
    
}

#endif
