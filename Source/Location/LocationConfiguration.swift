//
//  LocationConfiguration.swift
//  Pods
//
//  Created by Hellen Soloviy on 7/25/17.
//
//

#if PERMISSION_LOCATION
    
import Foundation
import CoreLocation

/**
 Class for configuration of location permission service, where can be two types of permission. For now only iOS 10 support. In future it will support new keys for iOS 11 too.
 */
public final class LocationConfiguration: PermissionConfiguration {
    
    public let messages: ServiceMessages
    public let permissionType: LocationPermissionType
    
    /**
     Enum Int values based on rawValues of CoreLocation status enum - CLAuthorizationStatus.
     
     - description: For pretty print if needed
     */
    public enum LocationPermissionType: Int, CustomStringConvertible {
        case always = 3
        case whenInUse = 4
        
        public var description: String {
            switch self {
                case .always:     return "always authorization"
                case .whenInUse:  return "whenInUse authorization"
            }
        }
       
    }
    
    public required init(_ type: LocationPermissionType = .whenInUse, with messages: ServiceMessages = DefaultMessages()) {
        
        self.messages = messages
        self.permissionType = type
        print("Configuration created for \(permissionType.description)")
        
    }
    
}

#endif
