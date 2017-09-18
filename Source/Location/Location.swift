//
//  Location.swift
//
//  Created by Orest Grabovskyi on 12/28/16.
//  Copyright © 2016 Lemberg Solution. All rights reserved.
//

#if PERMISSION_LOCATION

import Foundation
import CoreLocation


/**
Class Location working with locationManager and CLLocationManagerDelegate for returning complition block like all others permissions. Location Manager Delegate return to be nil after all for callback finished.
 */
public final class Location: NSObject, PermissionService {
    
    fileprivate var locationManager = CLLocationManager()
    fileprivate let dispatchGroup = DispatchGroup()
    
    fileprivate var _type: CLAuthorizationStatus = CLAuthorizationStatus.authorizedWhenInUse
    
    var type: CLAuthorizationStatus {
        return _type
    }
    
    public required init(with configuration: PermissionConfiguration) {
        
        guard let config = configuration as? LocationConfiguration else {
            print("#ERROR - 001 Not correct Configuration")
            return
        }
        
        if let type = CLAuthorizationStatus(rawValue: Int32(config.permissionType.rawValue)) {
            self._type = type
        } else {
            self._type = CLAuthorizationStatus.authorizedWhenInUse
        }
        
    }
    
    public func requestPermission(_ callback: @escaping (_ success: Bool) -> Void) {
        
        locationManager.delegate = self
        dispatchGroup.enter()
        
        if self.type == CLAuthorizationStatus.authorizedWhenInUse {
            locationManager.requestWhenInUseAuthorization()
        } else {
            locationManager.requestAlwaysAuthorization()
        }
        
        dispatchGroup.notify(queue: DispatchQueue.main) {
            
            var permissionGranted = false
            let status = CLLocationManager.authorizationStatus()
            self.locationManager.delegate = nil
            
            switch (status) {
            case .authorizedAlways, .authorizedWhenInUse:
                permissionGranted = true
            case .denied,.restricted,.notDetermined:
                permissionGranted = false
            }
            
            callback(permissionGranted)
        }
        
    }
    
    
    public func status() -> PermissionStatus {
        let status = Int(CLLocationManager.authorizationStatus().rawValue)
        return status.permissionStatus()
    }
    
}

extension Location: CLLocationManagerDelegate {
    
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status != .notDetermined {
            dispatchGroup.leave()
        }
        
    }
}

#endif
