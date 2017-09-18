//
//  Gallery.swift
//
//  Created by Volodymyr Hyrka on 2/9/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

#if PERMISSION_GALLERY
import Foundation
import Photos

public final class Gallery: PermissionService {
    
    public required init(with configuration: PermissionConfiguration) { }
    
    public func status() -> PermissionStatus {
        let status = PHPhotoLibrary.authorizationStatus()
        return status.rawValue.permissionStatus()
    }
    
    public func requestPermission(_ callback: @escaping (_ success: Bool) -> Void) {

        PHPhotoLibrary.requestAuthorization({ (newStatus) -> Void in
            let success = newStatus == PHAuthorizationStatus.authorized
            callback(success)
        })
    }
    
}

#endif
