//
//  CalendarReminder.swift
//
//  Created by Hellen Soloviy on 6/6/17.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import UIKit
import EventKit

public final class CalendarReminder: PermissionService {
    
    let entityType = EKEntityType.reminder
    
    public init() {}
    
    public func checkStatus() -> PermissionStatus {
        let statusInt = EKEventStore.authorizationStatus(for: EKEntityType.event).rawValue
        guard let status = PermissionStatus(rawValue: statusInt), (0...3) ~= statusInt else {
            assertionFailure("Impossible status")
            return .notDetermined
        }
        return status
    }
    
    public func requestStatus(_ requestGranted: @escaping (_ successRequestResult: Bool) -> Void) {
        EKEventStore().requestAccess(to: entityType) {
            (accessGranted: Bool, error: Error?) in
            requestGranted(accessGranted)
        }
    }
    
}

