//
//  CalendarPermission.swift
//
//  Created by Les Melnychuk on 2/19/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import UIKit
import EventKit

public final class CalendarPermission: PermissonConfiguration {
  
  public init() {
    
  }
  
  public func restrictedAlertMessage() -> String {
    return "This app does not have access to your calendar"
  }
  
  public func checkStatus() -> PermissonStatus {
    let statusInt = EKEventStore.authorizationStatus(for: EKEntityType.event).rawValue
    guard let status = PermissonStatus(rawValue: statusInt), (0...3) ~= statusInt else {
      assertionFailure("Impossible status")
      return .notDetermined
    }
    return status
  }
  
  public func requestStatus(_ requestGranted: @escaping (_ successRequestResult: Bool) -> Void) {
    EKEventStore().requestAccess(to: EKEntityType.event) {
      (accessGranted: Bool, error: Error?) in
      requestGranted(accessGranted)
    }
  }
}
