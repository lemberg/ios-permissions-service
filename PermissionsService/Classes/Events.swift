//
//  CalendarEvent.swift
//
//  Created by Les Melnychuk on 2/19/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import UIKit
import EventKit

public final class Events: PermissionService {
    
    public required init(with configuration: PermissionConfiguration) { }

    let type = EKEntityType.event
        
    public func requestPermission(_ requestGranted: @escaping (_ successRequestResult: Bool) -> Void) {
        if !checkPermissionKey(for: .calendarsUsageDescription) { return }
        
        EKEventStore().requestAccess(to: type) {
            (accessGranted: Bool, error: Error?) in
            requestGranted(accessGranted)
        }
    }
    
    public func status() -> PermissionStatus {
        let statusInt = EKEventStore.authorizationStatus(for: type).rawValue
        guard let status = PermissionStatus(rawValue: statusInt), (0...3) ~= statusInt else {
            assertionFailure("Impossible status")
            return .notDetermined
        }
        return status
    }
    
    
}
