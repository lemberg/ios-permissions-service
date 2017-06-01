//
//  CalendarPermission.swift
//
//  Created by Les Melnychuk on 2/19/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import UIKit
import EventKit

public final class CalendarPermission: PermissionService {
    
  public init() {
    
  }
  
	public var entityType = EKEntityType.event
  
  public func checkStatus() -> PermissonStatus {
    let statusInt = EKEventStore.authorizationStatus(for: EKEntityType.event).rawValue
    guard let status = PermissonStatus(rawValue: statusInt), (0...3) ~= statusInt else {
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
