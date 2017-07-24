//
//  Camera.swift
//
//  Created by Volodymyr Hyrka on 2/9/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import Foundation
import Photos

//TODO: AVCaptureDevice deprecated in iOS 10

public final class Camera: PermissionService {
  
    let mediaType = AVMediaTypeVideo
    
    public init() {}
    
    public func status() -> PermissionStatus {
      let statusInt = AVCaptureDevice.authorizationStatus(forMediaType: mediaType).rawValue
      guard let status = PermissionStatus(rawValue: statusInt), (0...3) ~= statusInt else {
        assertionFailure("Impossible status")
        return .notDetermined
      }
      return status
    }
    
    public func requestPermission(_ requestGranted: @escaping (_ successRequestResult: Bool) -> Void) {
      AVCaptureDevice.requestAccess(forMediaType: mediaType) { (granted) -> Void in
        requestGranted(granted)
      }
    }
    
}
