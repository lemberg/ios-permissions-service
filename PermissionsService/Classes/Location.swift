//
//  Location.swift
//
//  Created by Orest Grabovskyi on 12/28/16.
//  Copyright © 2016 Lemberg Solution. All rights reserved.
//

import Foundation
import CoreLocation

public final class Location: NSObject, PermissionService {
    
  internal var locationManager = CLLocationManager()
  internal let dispatchGroup = DispatchGroup()
 
  let entityType = CLAuthorizationStatus.authorizedWhenInUse

  public override init() {}
  
  public func status() -> PermissionStatus {
    let statusInt = Int(CLLocationManager.authorizationStatus().rawValue)
    guard let status = PermissionStatus(rawValue: statusInt), (0...4) ~= statusInt else {
      assertionFailure("Impossible status")
      return .notDetermined
    }
    return status
  }
  
    public func requestPermission(_ callback: @escaping (_ success: Bool) -> Void) {
        
        locationManager.delegate = self
        
        dispatchGroup.enter()
        locationManager.requestWhenInUseAuthorization()

        dispatchGroup.notify(queue: DispatchQueue.main) {
            
            var permissionGranted = false
            let status = CLLocationManager.authorizationStatus()
            self.locationManager.delegate = nil
            
            switch (status) {
            case .authorizedAlways, .authorizedWhenInUse:
                permissionGranted = true
                break
            case .denied,.restricted:
                permissionGranted = false
                break
            case .notDetermined:
                permissionGranted = false
                break
            }
            
            callback(permissionGranted)
        }

  }
    
}

extension Location: CLLocationManagerDelegate {

    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status != .notDetermined {
            dispatchGroup.leave()
        }
        
    }
}
