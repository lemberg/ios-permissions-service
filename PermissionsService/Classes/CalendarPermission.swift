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
    let statusInt = EKEventStore.authorizationStatusForEntityType(EKEntityType.Event).rawValue
    guard let status = PermissonStatus(rawValue: statusInt) where (0...3) ~= statusInt else {
      assertionFailure("Impossible status")
      return .NotDetermined
    }
    return status
  }
  
  public func requestStatus(requestGranted: (successRequestResult: Bool) -> Void) {
    EKEventStore().requestAccessToEntityType(EKEntityType.Event) {
      (accessGranted: Bool, error: NSError?) in
      requestGranted(successRequestResult: accessGranted)
    }
  }
}
