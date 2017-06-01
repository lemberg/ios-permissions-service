
//
//  ContactsPermission.swift
//  StylesCloud
//
//  Created by Sergiy Loza on 05.12.16.
//  Copyright © 2016 Lemberg Solution. All rights reserved.
//

import Foundation
import Contacts

@available(iOS 9.0, *)
public class ContactsPermission: PermissionService {
  
  public required init() {
    
  }
  
  public func checkStatus() -> PermissonStatus {
    let statusInt = CNContactStore.authorizationStatus(for: .contacts).rawValue
    guard let status = PermissonStatus(rawValue: statusInt) , (0...3) ~= statusInt else {
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
