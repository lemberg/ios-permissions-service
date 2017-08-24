//
//  Microphone.swift
//
//  Created by Hellen Soloviy on 6/6/17.
//

#if PERMISSION_MICROPHONE
import Foundation
import Photos

public final class Microphone: PermissionService {
    
    let mediaType = AVMediaTypeAudio

    public required init(with configuration: PermissionConfiguration) { }

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
