//
//  LocationConfiguration.swift
//  Pods
//
//  Created by Hellen Soloviy on 7/25/17.
//
//

import Foundation

public final class LocationConfiguration: PermissionConfiguration {
    
    public enum LocationPermissionType {
        case whenInUse
        case always
    }
    
    public let messages: ServiceMessages
    public let permissionType: LocationPermissionType
    
    public init(_ type: LocationPermissionType = .whenInUse, with messages: ServiceMessages = DefaultMessages()) {
        self.messages = messages
        self.permissionType = type
    }
    
}
