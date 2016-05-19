//
//  SystemPermissionController.swift
//
//  Created by Volodymyr Hyrka on 2/8/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import Foundation
import UIKit

enum Status: Int {
  case NotDetermined
  case Restricted
  case Denied
  case Authorized
}

protocol PermissonConfiguration {
  init()
  func restrictedAlertMessage() -> String
  func deniedAlertMessage() -> String
  func checkStatus() -> Status
  func requestStatus(requestGranted: (successRequestResult: Bool) -> Void)
}

extension PermissonConfiguration {
  func deniedAlertMessage() -> String {
    return "You can enable access in Privacy Settings"
  }
}

class Permission<T:PermissonConfiguration>{
  
  private var checker:T
  
  init() {
    checker = T()
  }
  
  func preparePermission(sender: UIViewController, granted: (granted: Bool) -> Void) {
    let status = checker.checkStatus()
    let alertController = UIAlertController(title: "Access Denied", message: nil, preferredStyle: .Alert)
    alertController.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default,handler: nil))
    switch status {
    case .NotDetermined:
      checker.requestStatus({ (successRequestResult) -> Void in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
          granted(granted: successRequestResult)
        })
      })
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
