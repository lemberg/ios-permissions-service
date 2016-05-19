//
//  CalendarPermission.swift
//
//  Created by Les Melnychuk on 2/19/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import UIKit
import EventKit

final class CalendarPermission: PermissonConfiguration {
  
  func restrictedAlertMessage() -> String {
    return "This app does not have access to your calendar"
  }
  
  func checkStatus() -> Status {
    let statusInt = EKEventStore.authorizationStatusForEntityType(EKEntityType.Event).rawValue
    guard let status = Status(rawValue: statusInt) where (0...3) ~= statusInt else {
      assertionFailure("Impossible status")
      return .NotDetermined
    }
    return status
  }
  
  func requestStatus(requestGranted: (successRequestResult: Bool) -> Void) {
    EKEventStore().requestAccessToEntityType(EKEntityType.Event) {
      (accessGranted: Bool, error: NSError?) in
      requestGranted(successRequestResult: accessGranted)
    }
  }
}
