//
//  GalleryPermission.swift
//
//  Created by Volodymyr Hyrka on 2/9/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import Foundation
import Photos

class GalleryPermission: AbstractPermission {
  
  override func checkStatus() -> GenericStatus {
    let statusInt = PHPhotoLibrary.authorizationStatus().rawValue
    guard let status = GenericStatus(rawValue: statusInt) where (0...3) ~= statusInt else {
      assertionFailure("Impossible status")
      return .NotDetermined
    }
    return status
  }
  
  override func requestStatus(requestGranted: (successRequestResult: Bool) -> Void) {
    PHPhotoLibrary.requestAuthorization({ (newStatus) -> Void in
      let success = newStatus == PHAuthorizationStatus.Authorized
      requestGranted(successRequestResult: success)
    })
  }
  
  override func restrictedAlertMessage() -> String {
    return "This app does not have access to your photos and videos"
  }
    
}