//
//  SystemPermissionController.swift
//
//  Created by Volodymyr Hyrka on 2/8/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import Foundation
import UIKit

public enum PermissonStatus: Int {
  case NotDetermined
  case Restricted
  case Denied
  case Authorized
}

public protocol PermissonConfiguration {
  init()
  func restrictedAlertMessage() -> String
  func deniedAlertMessage() -> String
  func checkStatus() -> PermissonStatus
  func requestStatus(requestGranted: (successRequestResult: Bool) -> Void)
}

extension PermissonConfiguration {
  
  public func deniedAlertMessage() -> String {
    return "You can enable access in Privacy Settings"
  }
  
}

public class Permission<T: PermissonConfiguration> {
  
  private var checker: T
  
  public init() {
    checker = T()
  }
  
  public func preparePermission(sender: UIViewController, granted: (granted: Bool) -> Void) {
    let status = checker.checkStatus()
    let alertController = UIAlertController(title: "Access Denied", message: nil, preferredStyle: .Alert)
    let action = UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil)
    alertController.addAction(action)
    switch status {
    case .NotDetermined:
      checker.requestStatus {
        (successRequestResult) in dispatch_async(dispatch_get_main_queue()) {
          granted(granted: successRequestResult)
        }
      }
      return
    case .Authorized:
      granted(granted: true)
      return
    case .Restricted:
      alertController.message = checker.restrictedAlertMessage()
      granted(granted: false)
    case .Denied:
      alertController.message = checker.deniedAlertMessage()
      let settingsAction = UIAlertAction(title: "Settings", style: .Default) { (_) -> Void in
        let settingsUrl = NSURL(string: UIApplicationOpenSettingsURLString)
        if let url = settingsUrl {
          UIApplication.sharedApplication().openURL(url)
        }
      }
      alertController.addAction(settingsAction)
      granted(granted: false)
    }
    sender.presentViewController(alertController, animated: true, completion: nil)
  }
  
}
