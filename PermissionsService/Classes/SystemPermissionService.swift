//
//  SystemPermissionController.swift
//
//  Created by Volodymyr Hyrka on 2/8/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import Foundation
import UIKit

public enum PermissonStatus: Int {
  case notDetermined
  case restricted
  case denied
  case authorized
  case authorizedWhenInUse
}

struct DefaultValues {
	static let deniedAlertMessage = "You can enable access in Privacy Settings"
}

public protocol PermissionConfiguration {
  init()
	var restrictedAlertMessage: String {get set}
	var deniedAlertMessage: String {get set}
  var deniedTitle: String {get set}

  func checkStatus() -> PermissonStatus
  func requestStatus(_ requestGranted: @escaping (_ successRequestResult: Bool) -> Void)
}

open class Permission<T: PermissionConfiguration> {
  
  fileprivate var checker: T
  
  public init() {
    checker = T()
  }
  
  open func preparePermission(_ sender: UIViewController, granted: @escaping (_ granted: Bool) -> Void) {
    let status = checker.checkStatus()
    let alertController = UIAlertController(title: "Access Denied", message: nil, preferredStyle: .alert)
    if !checker.deniedTitle.isEmpty {
      alertController.title = checker.deniedTitle
    }
    
    let action = UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil)
    alertController.addAction(action)
    switch status {
    case .notDetermined:
      checker.requestStatus {
        (successRequestResult) in DispatchQueue.main.async {
          granted(successRequestResult)
        }
      }
      return
    case .authorized:
      granted(true)
      return
    case .restricted:
      alertController.message = checker.restrictedAlertMessage
      granted(false)
    case .denied:
      alertController.message = checker.deniedAlertMessage
      let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
        let settingsUrl = URL(string: UIApplicationOpenSettingsURLString)
        if let url = settingsUrl, UIApplication.shared.canOpenURL(url) {
          UIApplication.shared.openURL(url)
        }
      }
      alertController.addAction(settingsAction)
      granted(false)
    case .authorizedWhenInUse:
      checker.requestStatus {
        (successRequestResult) in DispatchQueue.main.async {
          granted(successRequestResult)
        }
      }
      return
    }
    sender.present(alertController, animated: true, completion: nil)
  }
}
