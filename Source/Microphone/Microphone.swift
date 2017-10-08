//
//  Microphone.swift
//
//  Created by Hellen Soloviy on 6/6/17.
//

#if PERMISSION_MICROPHONE
import Foundation
import Photos

public final class Microphone: PermissionService {
    
    let type = AVMediaType.audio

    public required init(with configuration: PermissionConfiguration) { }

    public func status() -> PermissionStatus {
        let status = AVCaptureDevice.authorizationStatus(for: type)
        return status.rawValue.permissionStatus()
    }

    public func requestPermission(_ callback: @escaping (_ success: Bool) -> Void) {

        AVCaptureDevice.requestAccess(for: type) { (granted) -> Void in
            callback(granted)
        }
    }

}
    
#endif
