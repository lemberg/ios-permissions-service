//
//  Camera.swift
//
//  Created by Volodymyr Hyrka on 2/9/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import Foundation
import Photos

public final class Camera: PermissionService {
  
  public var mediaType = AVMediaTypeVideo

  public init() {}
  
  public func checkStatus() -> PermissionStatus {
    let statusInt = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo).rawValue
    guard let status = PermissionStatus(rawValue: statusInt), (0...3) ~= statusInt else {
      assertionFailure("Impossible status")
      return .notDetermined
    }
    return status
  }
  
  public func requestStatus(_ requestGranted: @escaping (_ successRequestResult: Bool) -> Void) {
    AVCaptureDevice.requestAccess(forMediaType: mediaType) { (granted) -> Void in
      requestGranted(granted)
    }
  }
  
}
