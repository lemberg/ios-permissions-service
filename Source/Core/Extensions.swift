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
                case 3, 4: return .authorized
            default: return .unknown
            
        }
        
    }

    
}



