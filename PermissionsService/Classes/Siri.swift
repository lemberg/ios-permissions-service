//
//  Siri.swift
//  Pods
//
//  Created by Hellen Soloviy on 7/24/17.
//
//

import Foundation
import Intents

@available(iOS 10.0, *)
public final class Siri: PermissionService {
    
    public required init(with configuration: PermissionConfiguration) { }
    
    public func requestPermission(_ callback: @escaping (_ success: Bool) -> Void) {
        
        INPreferences.requestSiriAuthorization { status in
            switch status {
                case .authorized:
                    callback(true)
                    break
                case .denied, .restricted, .notDetermined:
                    callback(false)
                    break
            }
        }
    }
    
    
    public func status() -> PermissionStatus {
        let status = INPreferences.siriAuthorizationStatus()
        return status.rawValue.permissionStatus()
    }
    
    
}
