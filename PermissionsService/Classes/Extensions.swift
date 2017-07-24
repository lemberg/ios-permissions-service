//
//  Extensions.swift
//
//  Created by Hellen Soloviy on 7/24/17.
//
//

import Foundation

extension Int {
 
    func permissionStatus() -> PermissionStatus {
        
            switch self {
                case 0: return .notDetermined
                case 1: return .restricted
                case 2: return .denied
                case 3: return .authorized
            default: return .unknown
            
        }
        
    }
    
}

extension Optional {
    
    /**
     Help to avoid if-let statements
     
     */
    var isNil: Bool {
        if case .none = self {
            return true
        } else {
            return false
        }
    }
}

extension PermissionService {
    
    /**
     Help developers to don't forget about keys
     
     */
    func checkPermissionKey(for key: String) -> Bool {
        
        let hasPermissionKey : Bool = Bundle.main.object(forInfoDictionaryKey: key).isNil
        if !hasPermissionKey {
            print("WARNING: \(key) not found in Info.plist.")
            return false
        } else {
            return true
        }
    }
    
}

extension String {
    
    static let locationWhenInUseUsageDescription    = "NSLocationWhenInUseUsageDescription"
    static let locationAlwaysUsageDescription       = "NSLocationAlwaysUsageDescription"
    
    static let microphoneUsageDescription           = "NSMicrophoneUsageDescription"
    static let speechRecognitionUsageDescription    = "NSSpeechRecognitionUsageDescription"
    
    static let photoLibraryUsageDescription         = "NSPhotoLibraryUsageDescription"
    static let photoLibraryAddUsageDescription      = "NSPhotoLibraryAddUsageDescription"
    static let cameraUsageDescription               = "NSCameraUsageDescription"
    
    static let mediaLibraryUsageDescription         = "NSAppleMusicUsageDescription"
    static let siriUsageDescription                 = "NSSiriUsageDescription"
    
    static let motionUsageDescription               = "NSMotionUsageDescription"
    static let contactsUsageDescription             = "NSContactsUsageDescription"
    
    static let remindersUsageDescription            = "NSRemindersUsageDescription"
    static let readerUsageDescription               = "NFCReaderUsageDescription"
    static let appleMusicUsageDescription           = "NSAppleMusicUsageDescription"
    
    static let bluetoothPeripheralUsageDescription  = "NSBluetoothPeripheralUsageDescription"
    static let calendarsUsageDescription            = "NSCalendarsUsageDescription"
    static let homeKitUsageDescription              = "NSHomeKitUsageDescription"
    
}


