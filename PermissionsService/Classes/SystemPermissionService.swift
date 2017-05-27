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

public protocol PermissionService {
  
  init()
  func checkStatus() -> PermissonStatus
  func requestStatus(_ callback: @escaping (_ success: Bool) -> Void)
}

public protocol ServiceMessages {
  
  var restrictedMessage: String { get }
  var restrictedTitle: String { get }
  var deniedMessage: String { get }
  var deniedTitle: String { get }
}

public protocol ServiceDisplay {
  
  func showAlert(vc: UIAlertController)
}

public extension ServiceDisplay where Self: UIViewController {
  
  func showAlert(vc: UIAlertController) {
    self.present(vc, animated: true, completion: nil)
  }
}

private struct DefaultMessages: ServiceMessages {
  
  let deniedTitle = "Access denied"
  let deniedMessage = "Access to this component is denied"
  let restrictedTitle = "Access restricted"
  let restrictedMessage = "Access to this component is restricted"
}


public var closeTitle:String = "Close"
public var settingsTitle:String = "Settings"

open class P<T: PermissionService> {
  
  typealias PermissionGranted = (_ granted:Bool) -> Swift.Void
  
  
  class func prep<U:ServiceMessages>(sender: ServiceDisplay, m: U , callback: @escaping PermissionGranted) {
    
    let s = T()
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

class ASD: PermissionService {
  
  required init() {
  }
  
  func checkStatus() -> PermissonStatus {
    return PermissonStatus(rawValue: 0)!
  }
  
  func requestStatus(_ callback: @escaping (Bool) -> Void) {
    
  }
}


class Using: ServiceDisplay {
  
  func foo() {
    P<ASD>.prep(sender: self, m: DefaultMessages()) { (s) in
      
    }
  }
  
  func showAlert(vc: UIAlertController) {
    
  }
}

//private extension UIAlertController {
//  
//  class func createDeniedAlert<T:M>(with m:T) -> UIAlertController {
//    let vc = UIAlertController()
//    vc.title = m.deniedTitle
//  }
//}
