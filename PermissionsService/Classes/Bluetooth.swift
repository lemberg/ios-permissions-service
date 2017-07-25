//
//  Bluetooth.swift
//  Pods
//
//  Created by Hellen Soloviy on 7/24/17.
//
//

import Foundation
import CoreBluetooth

//TODO: For now not working

public final class Bluetooth: PermissionService {
    
    public required init(with configuration: PermissionConfiguration) { }


    /**
     */
    
    public func requestPermission(_ callback: @escaping (_ success: Bool) -> Void) {
        //TODO: Error handling
        if !checkPermissionKey(for: .bluetoothPeripheralUsageDescription) { return }
        
    }
    
    /**

     */
    public func status() -> PermissionStatus {
        return .notDetermined
    }

}
