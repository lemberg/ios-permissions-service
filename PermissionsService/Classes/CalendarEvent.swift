//
//  CalendarEvent.swift
//
//  Created by Les Melnychuk on 2/19/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import UIKit
import EventKit

public final class CalendarEvent: PermissionService {
  
    let entityType = EKEntityType.event

    public init() {}
    
    public func checkStatus() -> PermissionStatus {
      let statusInt = EKEventStore.authorizationStatus(for: entityType).rawValue
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
