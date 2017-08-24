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
        let statusInt = PHPhotoLibrary.authorizationStatus().rawValue
        guard let status = PermissionStatus(rawValue: statusInt), (0...3) ~= statusInt else {
            assertionFailure("Impossible status")
            return .notDetermined
        }
        return status
    }
    
    public func requestPermission(_ callback: @escaping (_ success: Bool) -> Void) {

        PHPhotoLibrary.requestAuthorization({ (newStatus) -> Void in
            let success = newStatus == PHAuthorizationStatus.authorized
            callback(success)
        })
    }
    
}

#endif
