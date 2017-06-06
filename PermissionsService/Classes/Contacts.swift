//
//  Contacts.swift
//
//  Created by Sergiy Loza on 05.12.16.
//  Copyright © 2016 Lemberg Solution. All rights reserved.
//

import Foundation
import Contacts

@available(iOS 9.0, *)
public final class Contacts: PermissionService {
  
  public init() {}
  
  public func checkStatus() -> PermissionStatus {
    let statusInt = CNContactStore.authorizationStatus(for: .contacts).rawValue
    guard let status = PermissionStatus(rawValue: statusInt), (0...3) ~= statusInt else {
      assertionFailure("Impossible status")
      return .notDetermined
    }
    return status
  }
  
  public func requestStatus(_ requestGranted: @escaping (Bool) -> Void) {
    CNContactStore().requestAccess(for: .contacts) { (grandted, error) in
      requestGranted(grandted)
    }
  }
    
}
