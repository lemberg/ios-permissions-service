//
//  MediaPlayer.swift
//  Pods
//
//  Created by Hellen Soloviy on 7/25/17.
//
//

import Foundation
import MediaPlayer


@available(iOS 9.3, *)
public final class MediaPlayer: PermissionService {
    
    public required init(with configuration: PermissionConfiguration) { }
    
    public func requestPermission(_ callback: @escaping (_ success: Bool) -> Void) {
        
        //TODO: Error handling
        if !checkPermissionKey(for: .mediaLibraryUsageDescription) { return }
        
        MPMediaLibrary.requestAuthorization { status in
            
            let status = status.rawValue.permissionStatus()
            var permissionGranted = false
            
            switch (status) {
            case .authorized:
                permissionGranted = true
                break
            default:
                permissionGranted = false
                break
            }
            
            callback(permissionGranted)
        }
        
    }

    public func status() -> PermissionStatus {
        
        let status = MPMediaLibrary.authorizationStatus()
        return status.rawValue.permissionStatus()
    }
    
}
