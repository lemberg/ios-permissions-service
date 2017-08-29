//
//  Camera.swift
//
//  Created by Volodymyr Hyrka on 2/9/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

#if PERMISSION_CAMERA
import Foundation
import Photos

public final class Camera: PermissionService {
    
    public required init(with configuration: PermissionConfiguration) { }

    let type = AVMediaTypeVideo
    
    public init() {}
    
    public func status() -> PermissionStatus {        
        let status = AVCaptureDevice.authorizationStatus(forMediaType: type)
        return status.rawValue.permissionStatus()
    }
    
    public func requestPermission(_ callback: @escaping (_ success: Bool) -> Void) {
        
        AVCaptureDevice.requestAccess(forMediaType: type) { (granted) -> Void in
            callback(granted)
        }
    }
    
}

#endif
