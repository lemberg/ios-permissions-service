//
//  SpeechRecognition.swift
//  Pods
//
//  Created by Hellen Soloviy on 7/25/17.
//
//

#if PERMISSION_SPEECH_RECOGNITION
import Foundation
import Speech

@available(iOS 10.0, *)
public final class SpeechRecognition: PermissionService {
    
    public required init(with configuration: PermissionConfiguration) { }

    public func requestPermission(_ callback: @escaping (_ success: Bool) -> Void) {
       
        SFSpeechRecognizer.requestAuthorization { status in
            
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
        
        let status = SFSpeechRecognizer.authorizationStatus()
        return status.rawValue.permissionStatus()
        
    }
    
}
#endif
