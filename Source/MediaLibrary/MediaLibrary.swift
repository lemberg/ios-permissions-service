//
//  MediaLibrary.swift
//  Pods
//
//  Created by Hellen Soloviy on 7/25/17.
//
//

#if PERMISSION_MEDIA_LIBRARY
import Foundation
import MediaPlayer


@available(iOS 9.3, *)
public final class MediaLibrary: PermissionService {
    
    public required init(with configuration: PermissionConfiguration) { }
    
    public func requestPermission(_ callback: @escaping (_ success: Bool) -> Void) {
        
        MPMediaLibrary.requestAuthorization { status in
            
            let status = status.rawValue.permissionStatus()
            var permissionGranted = false
            
            switch (status) {
            case .authorized:
                permissionGranted = true
            default:
                permissionGranted = false
            }
            
            callback(permissionGranted)
        }
        
    }

    public func status() -> PermissionStatus {
        
        let status = MPMediaLibrary.authorizationStatus()
        return status.rawValue.permissionStatus()
    }
    
}

#endif
