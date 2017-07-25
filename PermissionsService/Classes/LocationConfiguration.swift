//
//  LocationConfiguration.swift
//  Pods
//
//  Created by Hellen Soloviy on 7/25/17.
//
//

import Foundation
import CoreLocation

//let LocationPermission = true
//        #if LocationPermission
//        #endif


public final class LocationConfiguration: PermissionConfiguration {
    
    public enum LocationPermissionType: Int {
        case whenInUse = 3
        case always = 4
    }
    
    public let messages: ServiceMessages
    public let permissionType: LocationPermissionType
    
    public required init(_ type: LocationPermissionType = .whenInUse, with messages: ServiceMessages = DefaultMessages()) {
        self.messages = messages
        self.permissionType = type
    }
    
}
