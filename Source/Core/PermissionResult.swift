//
//  Structs.swift
//  Pods
//
//  Created by Hellen Soloviy on 7/24/17.
//
//

import Foundation

    /**
        List of permissions currently supported
 
    */
  public enum PermissionType: Int, CustomStringConvertible {
        case contacts, locationAlways, locationInUse, notifications, microphone, camera, photos, reminders, events, bluetooth, motion, siri
    
        public var prettyDescription: String {
            switch self {
            case .locationAlways, .locationInUse:
                return "Location"
            default:
                return "\(self)"
            }
        }
    
        public var description: String {
            switch self {
            case .contacts:         return "Contacts"
            case .events:           return "Events"
            case .locationAlways:   return "LocationAlways"
            case .locationInUse:    return "LocationInUse"
            case .notifications:    return "Notifications"
            case .microphone:       return "Microphone"
            case .camera:           return "Camera"
            case .photos:           return "Photos"
            case .reminders:        return "Reminders"
            case .bluetooth:        return "Bluetooth"
            case .motion:           return "Motion"
            case .siri:             return "Siri"
  
            }
        }
    
        static let allValues = [contacts, locationAlways, locationInUse, notifications, microphone, camera, photos, reminders, events, bluetooth, motion]
    }

    /**
        Possible statuses for a permission.
 
    */
  public enum PermissionStatus: Int, CustomStringConvertible {
        case unknown = -1
        case notDetermined = 0
        case restricted = 1
        case denied = 2
        case authorized = 3
    
      public var description: String {
          switch self {
          case .unknown:       return "Unknown"
          case .notDetermined: return "NotDetermined"
          case .restricted:    return "Restricted" // System-level
          case .denied:        return "Denied"
          case .authorized:    return "Authorized"
          }
      }
  }

    /**
        Result for a permission status request.
    */
  public class PermissionResult: NSObject {
      public let type: PermissionType
      public let status: PermissionStatus
    
      internal init(type:PermissionType, status:PermissionStatus) {
        self.type   = type
        self.status = status
      }
    
      override public var description: String {
         return "\(type) \(status)"
      }
}
