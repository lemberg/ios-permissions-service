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

protocol C {
  
  func checkStatus() -> PermissonStatus
  func requestStatus(_ callback: @escaping (_ success: Bool) -> Void)
}

protocol M {
  var restrictedMessage: String { get }
  var deniedMessage: String { get }
  var deniedTitle: String { get }
}

protocol R {
  
  func showAlert(vc: UIAlertController)
}

extension R where Self: UIViewController {
  
  func showAlert(vc: UIAlertController) {
    self.present(vc, animated: true, completion: nil)
  }
}

open class P {
  
  typealias PermissionGranted = (_ granted:Bool) -> Swift.Void
  
  class func prep<T:C, U:M>(sender:R, s:T, m: U, callback: @escaping PermissionGranted) {
    let status = s.checkStatus()
    
    switch status {
    case .notDetermined:
      s.requestStatus({ (success) in
        DispatchQueue.main.async {
          callback(success)
        }
      })
      break
    case .authorized:
      break
    case .restricted:
      break
    case .denied:
      break
    case .authorizedWhenInUse:
      break
    }
  }
  
  private class func onNotDeterminated(){
    
  }
}
