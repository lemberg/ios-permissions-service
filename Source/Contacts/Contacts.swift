//
//  Contacts.swift
//  Pods
//
//  Created by Hellen Soloviy on 7/24/17.
//
//

#if PERMISSION_CONTACTS
import Foundation
import Contacts
import AddressBook

public final class Contacts: PermissionService {
    
    public required init(with configuration: PermissionConfiguration) {  }

    /**
     Request for accessing Contacts.
     
     - returns: Permission request result and error, if it exist
     */
    public func requestPermission(_ callback: @escaping (_ success: Bool) -> Void) {
        //TODO: Error handling
        
        if #available(iOS 8.0, *) {
            ABAddressBookRequestAccessWithCompletion(nil) { grandted, error in
                callback(grandted)
            }
            
        } else {
            CNContactStore().requestAccess(for: .contacts, completionHandler: {
                grandted, error in
                callback(grandted)
            })
        }
        
    }
    
    /**
     Returns the current permission status for accessing Contacts.
     
     - returns: Current permission status.
     */
    public func status() -> PermissionStatus {
        
        if #available(iOS 8.0, *) {
            let status = ABAddressBookGetAuthorizationStatus()
            return status.rawValue.permissionStatus()
            
        } else {
            let status = CNContactStore.authorizationStatus(for: .contacts)
            return status.rawValue.permissionStatus()
            
        }
    }
    
    
}

#endif
