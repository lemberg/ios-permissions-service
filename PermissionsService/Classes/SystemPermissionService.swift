//
//  SystemPermissionController.swift
//
//  Created by Volodymyr Hyrka on 2/8/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import UIKit

public enum PermissionStatus: Int {
  case notDetermined
  case restricted
  case denied
  case authorized
  case authorizedWhenInUse
}

public protocol PermissionService {
  
  init()
  func checkStatus() -> PermissionStatus
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
  
  public func showAlert(vc: UIAlertController) {
    self.present(vc, animated: true, completion: nil)
  }
}

private struct DefaultMessages: ServiceMessages {
  
  let deniedTitle = "Access denied"
  let deniedMessage = "You can enable access in Privacy Settings"
  let restrictedTitle = "Access restricted"
  let restrictedMessage = "Access to this component is restricted"
}

public var closeTitle: String = "Close"
public var settingsTitle: String = "Settings"

open class Permission<T: PermissionService> {
  
  public typealias PermissionGranted = (_ granted:Bool) -> Swift.Void
  
  public class func prepare(for handler: ServiceDisplay, with messages: ServiceMessages = DefaultMessages(), callback: @escaping PermissionGranted) {
    
    let service = T()
    let status = service.checkStatus()

    switch status {
    case .notDetermined:
      service.requestStatus({ (success) in
        OperationQueue.main.addOperation {
          callback(success)
        }
      })
      break
    case .authorized:
      callback(true)
      break
    case .restricted:
      showRestrictedAlert(from: handler, with: messages)
      callback(false)
      break
    case .denied:
      showDeniedAlert(from: handler, with: messages)
      callback(false)
      break
    case .authorizedWhenInUse:
      service.requestStatus({ (success) in
        OperationQueue.main.addOperation {
          callback(success)
        }
      })
      break
    }
  }
  
  private class func showDeniedAlert(from sender:ServiceDisplay, with messages: ServiceMessages) {
    let alert = createAlert()
    alert.title = messages.deniedTitle
    alert.message = messages.deniedMessage
    alert.addAction(UIAlertController.openSettingsAction())
    sender.showAlert(vc: alert)
  }
  
  private class func showRestrictedAlert(from sender:ServiceDisplay, with messages: ServiceMessages) {
    let alert = createAlert()
    alert.title = messages.restrictedTitle
    alert.message = messages.restrictedMessage
    sender.showAlert(vc: alert)
  }
  
  private class func createAlert() -> UIAlertController {
    let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
    let closeAction = UIAlertAction(title: closeTitle, style: .cancel, handler: nil)
    alert.addAction(closeAction)
    return alert
  }
  
}

private extension UIAlertController {
  
  class func openSettingsAction() -> UIAlertAction {
    
    let action = UIAlertAction(title: settingsTitle, style: .default) { (action) in
      let settingsUrl = URL(string: UIApplicationOpenSettingsURLString)
      if let url = settingsUrl, UIApplication.shared.canOpenURL(url) {
        if #available(iOS 10.0, *) {
          UIApplication.shared.open(url, completionHandler: nil)
        } else {
          UIApplication.shared.openURL(url)
        }
      }
    }
    return action
  }
}
