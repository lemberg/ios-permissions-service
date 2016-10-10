//
//  CameraPermission.swift
//
//  Created by Volodymyr Hyrka on 2/9/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import Foundation
import Photos

public final class CameraPermissions: PermissonConfiguration {
  
  public init() {
    
  }
  
  public func checkStatus() -> PermissonStatus {
    let statusInt = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo).rawValue
    guard let status = PermissonStatus(rawValue: statusInt) , (0...3) ~= statusInt else {
      assertionFailure("Impossible status")
      return .notDetermined
    }
    return status
  }
  
  public func requestStatus(_ requestGranted: @escaping (_ successRequestResult: Bool) -> Void) {
    AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo) { (granted) -> Void in
      requestGranted(granted)
    }
  }
  
  public func restrictedAlertMessage() -> String {
    return "This app does not have access to your Camera"
  }
  
  public func deniedAlertMessage() -> String {
    return "Hello baby"
  }
}
