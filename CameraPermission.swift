//
//  CameraPermission.swift
//
//  Created by Volodymyr Hyrka on 2/9/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import Foundation
import Photos

class CameraPermissions: AbstractPermission {
  override func checkStatus() -> GenericStatus {
    let statusInt = AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeVideo).rawValue
    guard let status = GenericStatus(rawValue: statusInt) where (0...3) ~= statusInt else {
      assertionFailure("Impossible status")
      return .NotDetermined
    }
    return status
  }
  
  override func requestStatus(requestGranted: (successRequestResult: Bool) -> Void) {
    AVCaptureDevice.requestAccessForMediaType(AVMediaTypeVideo) { (granted) -> Void in
      requestGranted(successRequestResult: granted)
    }
  }
  
  override func restrictedAlertMessage() -> String {
    return "This app does not have access to your Camera"
  }
  
}
