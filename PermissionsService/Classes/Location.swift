//
//  Location.swift
//
//  Created by Orest Grabovskyi on 12/28/16.
//  Copyright © 2016 Lemberg Solution. All rights reserved.
//

import Foundation
import CoreLocation

public final class Location: PermissionService {
    
  let entityType = CLAuthorizationStatus.authorizedWhenInUse
    
  public init() {}
  
  public func checkStatus() -> PermissionStatus {
    let statusInt = Int(CLLocationManager.authorizationStatus().rawValue)
    guard let status = PermissionStatus(rawValue: statusInt), (0...4) ~= statusInt else {
      assertionFailure("Impossible status")
      return .notDetermined
    }
    return status
  }
  
  public func requestStatus(_ requestGranted: @escaping (_ successRequestResult: Bool) -> Void) {
//    CLLocationManager().requestWhenInUseAuthorization()
    requestGranted (CLLocationManager.authorizationStatus() == entityType)
  }
    
}
