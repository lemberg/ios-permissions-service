//
//  PermissionConfiguration.swift
//  Pods
//
//  Created by Hellen Soloviy on 7/25/17.
//
//

import Foundation

public protocol PermissionConfiguration {
    var messages: ServiceMessages { get }
    
}

extension PermissionConfiguration {
    public var messages: ServiceMessages { return DefaultMessages() }
    
}

public struct DefaultMessages: ServiceMessages {
    
    public let deniedTitle = "Access denied"
    public let deniedMessage = "You can enable access in Privacy Settings"
    public let restrictedTitle = "Access restricted"
    public let restrictedMessage = "Access to this component is restricted"
  
  public init() {}
}


public final class DefaultConfiguration: PermissionConfiguration {
    //mock for unknown&default situations
    public let messages: ServiceMessages
    
    public required init(with messages: ServiceMessages = DefaultMessages()) {
        self.messages = messages
        
    }
    
}


public final class Configurator: PermissionConfiguration {
    
    public var configuration: PermissionConfiguration = DefaultConfiguration()
    
    public init(for permission: PermissionService.Type) {
        
       #if PERMISSION_LOCATION
        switch permission {
        case is Location.Type:
            self.configuration = LocationConfiguration()            
        default:
            self.configuration = DefaultConfiguration()
        }
       
        #else
        self.configuration = DefaultConfiguration()
        
        #endif
        
        
    }
    
}
