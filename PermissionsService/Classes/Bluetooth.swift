//
//  Bluetooth.swift
//  Pods
//
//  Created by Hellen Soloviy on 7/24/17.
//
//

import Foundation
import CoreBluetooth

public final class Bluetooth: NSObject, PermissionService {
    
    internal var bluetoothManager = CBPeripheralManager(
        delegate: nil,
        queue: nil,
        options: [CBPeripheralManagerOptionShowPowerAlertKey: false]
    )
    
//    internal var bluetoothManager = CBCentralManager(delegate: nil, queue: nil, options: [CBPeripheralManagerOptionShowPowerAlertKey: true])
    
    public required init(with configuration: PermissionConfiguration) {
        super.init()

        bluetoothManager.delegate = self
    }

    /**
     */
    public func requestPermission(_ callback: @escaping (_ success: Bool) -> Void) {
        
        //TODO: Error handling
        if !checkPermissionKey(for: .bluetoothPeripheralUsageDescription) { return }
        guard bluetoothManager.state == .poweredOn else { return }
        
        bluetoothManager.startAdvertising(nil)
        bluetoothManager.stopAdvertising()
    }
    
    /**

     */
    public func status() -> PermissionStatus {
        let status = CBPeripheralManager.authorizationStatus()
        return status.rawValue.permissionStatus()
    }

}

extension Bluetooth: CBPeripheralManagerDelegate {
    
    public func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        
//        UserDefaults.standard.stateBluetoothManagerDetermined = true
//        UserDefaults.standard.statusBluetooth = statusBluetooth
//        guard UserDefaults.standard.requestedBluetooth else { return }
//        callback?(statusBluetooth)
//        UserDefaults.standard.requestedBluetooth = false
        
//        if status != .notDetermined {
//            dispatchGroup.leave()
//        }
//        bluetoothManager.delegate = nil

    }
}
