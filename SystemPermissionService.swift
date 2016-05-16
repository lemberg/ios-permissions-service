//
//  SystemPermissionController.swift
//
//  Created by Volodymyr Hyrka on 2/8/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import Foundation
import UIKit

protocol PermissionAbstractMethods {
  func restrictedAlertMessage() -> String
  func deniedAlertMessage() -> String
  func checkStatus() -> AbstractPermission.GenericStatus
  func requestStatus(requestGranted: (successRequestResult: Bool) -> Void)
}

class AbstractPermission: PermissionAbstractMethods {
  
  enum GenericStatus: Int {
    case NotDetermined
    case Restricted
    case Denied
    case Authorized
  }

  func preparePermission(sender: UIViewController, granted: (granted: Bool) -> Void) {
    let status = self.checkStatus()
    let alertController = UIAlertController(title: "Access Denied", message: nil, preferredStyle: .Alert)
    alertController.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default,handler: nil))
    switch status {
    case .NotDetermined:
      self.requestStatus({ (successRequestResult) -> Void in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
          granted(granted: successRequestResult)
        })
      })
      return
    case .Authorized:
      granted(granted: true)
      return
    case .Restricted:
      alertController.message = self.restrictedAlertMessage()
      granted(granted: false)
    case .Denied:
      alertController.message = self.deniedAlertMessage()
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
  
  //MARK: - abstract methods
  func checkStatus() -> GenericStatus {
    assertionFailure("Abstract method shoud be overwriten")
    return .NotDetermined
  }
  func restrictedAlertMessage() -> String {
    assertionFailure("Abstract method shoud be overwriten")
    return ""
  }
  func requestStatus(requestGranted: (successRequestResult: Bool) -> Void) {
    assertionFailure("Abstract method shoud be overwriten")
    requestGranted(successRequestResult: false)
    return
  }
  func deniedAlertMessage() -> String {
    return "You can enable access in Privacy Settings"
  }
}
