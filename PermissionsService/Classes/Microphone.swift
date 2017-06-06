//
//  Microphone.swift
//
//  Created by Hellen Soloviy on 6/6/17.
//


import Foundation
import Photos

public final class Microphone: PermissionService {
    
    let mediaType = AVMediaTypeAudio

    public init() {}

    public func checkStatus() -> PermissionStatus {
        let statusInt = AVCaptureDevice.authorizationStatus(forMediaType: mediaType).rawValue
        guard let status = PermissionStatus(rawValue: statusInt), (0...3) ~= statusInt else {
            assertionFailure("Impossible status")
            return .notDetermined
        }
        return status
    }

    public func requestStatus(_ requestGranted: @escaping (_ successRequestResult: Bool) -> Void) {
        AVCaptureDevice.requestAccess(forMediaType: mediaType) { (granted) -> Void in
            requestGranted(granted)
        }
    }

}
