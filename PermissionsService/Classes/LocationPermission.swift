//
//  LocationPermission.swift
//  StylesCloud
//
//  Created by Orest Grabovskyi on 12/28/16.
//  Copyright © 2016 Lemberg Solution. All rights reserved.
//

import Foundation
import CoreLocation

public final class LocationPermission: PermissionService {

  public init() {}
  
  public var entityType = CLAuthorizationStatus.authorizedWhenInUse
  
  public func checkStatus() -> PermissonStatus {
    let statusInt = Int(CLLocationManager.authorizationStatus().rawValue)
    guard let status = PermissonStatus(rawValue: statusInt), (0...4) ~= statusInt else {
      assertionFailure("Impossible status")
      return .notDetermined
    }
    return status
  }
  
  public func requestStatus(_ requestGranted: @escaping (_ successRequestResult: Bool) -> Void) {
    requestGranted (CLLocationManager.authorizationStatus() == entityType)
  }
    
}
