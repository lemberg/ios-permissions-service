//
//  Contacts.swift
//  Pods
//
//  Created by Hellen Soloviy on 7/24/17.
//
//

import Foundation
import Contacts
import AddressBook

public final class Contacts: PermissionService {
    
    public init() {}
    
    /**
     Request for accessing Contacts.
     
     - returns: Permission request result and error, if it exist
     */
    public func requestPermission(_ requestGranted: @escaping (_ successRequestResult: Bool) -> Void) {
        //TODO: Error handling
        
        if #available(iOS 8.0, *) {
            ABAddressBookRequestAccessWithCompletion(nil) { grandted, error in
                requestGranted(grandted)
            }
            
        } else {
            CNContactStore().requestAccess(for: .contacts, completionHandler: {
                grandted, error in
                requestGranted(grandted)
            })
        }
        
    }
    
    /**
     Returns the current permission status for accessing Contacts.
     
     - returns: Current permission status.
     */
    public func status() -> PermissionStatus {
        //TODO: Switch more abstract. It is Int after all.
        
        if #available(iOS 8.0, *) {
            
            let status = ABAddressBookGetAuthorizationStatus()
            switch status {
            case .authorized: return .authorized
            case .denied: return .denied
            case .restricted: return .restricted
            case .notDetermined: return .notDetermined
            }
            
        } else {
            
            let status = CNContactStore.authorizationStatus(for: .contacts)
            switch status {
            case .authorized: return .authorized
            case .denied: return .denied
            case .restricted: return .restricted
            case .notDetermined: return .notDetermined
            }
            
        }
    }
    
    
}
