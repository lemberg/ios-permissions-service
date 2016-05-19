//
//  CameraPermission.swift
//
//  Created by Volodymyr Hyrka on 2/9/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import Foundation
import Photos

final class CameraPermissions: PermissonConfiguration {
  func checkStatus() -> PermissonStatus {
    let statusInt = AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeVideo).rawValue
    guard let status = PermissonStatus(rawValue: statusInt) where (0...3) ~= statusInt else {
      assertionFailure("Impossible status")
      return .NotDetermined
    }
    return status
  }
  
  func requestStatus(requestGranted: (successRequestResult: Bool) -> Void) {
    AVCaptureDevice.requestAccessForMediaType(AVMediaTypeVideo) { (granted) -> Void in
      requestGranted(successRequestResult: granted)
    }
  }
  
  func restrictedAlertMessage() -> String {
    return "This app does not have access to your Camera"
  }
  
  func deniedAlertMessage() -> String {
    return "Hello baby"
  }
}
