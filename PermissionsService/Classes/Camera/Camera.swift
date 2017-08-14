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

    let mediaType = AVMediaTypeVideo
    
    public init() {}
    
    public func status() -> PermissionStatus {        
        let statusInt = AVCaptureDevice.authorizationStatus(forMediaType: mediaType).rawValue
        guard let status = PermissionStatus(rawValue: statusInt), (0...3) ~= statusInt else {
            assertionFailure("Impossible status")
            return .notDetermined
        }
        return status
    }
    
    public func requestPermission(_ callback: @escaping (_ success: Bool) -> Void) {
        
        AVCaptureDevice.requestAccess(forMediaType: mediaType) { (granted) -> Void in
            callback(granted)
        }
    }
    
}

#endif
