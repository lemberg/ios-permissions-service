//
//  GalleryPermission.swift
//
//  Created by Volodymyr Hyrka on 2/9/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import Foundation
import Photos

public final class GalleryPermission: PermissionConfiguration {
	
	public var restrictedAlertMessage = "This app does not have access to your photos and videos"
	public var deniedAlertMessage = DefaultValues.deniedAlertMessage
  public var deniedTitle = ""

  public init() {
    
  }
  
  public func checkStatus() -> PermissonStatus {
    let statusInt = PHPhotoLibrary.authorizationStatus().rawValue
    guard let status = PermissonStatus(rawValue: statusInt) , (0...3) ~= statusInt else {
      assertionFailure("Impossible status")
      return .notDetermined
    }
    return status
  }
  
  public func requestStatus(_ requestGranted: @escaping (_ successRequestResult: Bool) -> Void) {
    PHPhotoLibrary.requestAuthorization({ (newStatus) -> Void in
      let success = newStatus == PHAuthorizationStatus.authorized
      requestGranted(success)
    })
  }
  
}
