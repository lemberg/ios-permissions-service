//
//  SystemPermissionController.swift
//
//  Created by Volodymyr Hyrka on 2/8/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import UIKit

public protocol PermissionService {
  
  init(with configuration: PermissionConfiguration)
  func status() -> PermissionStatus
  func requestPermission(_ callback: @escaping (_ success: Bool) -> Void)

}

public var closeTitle: String = "Close"
public var settingsTitle: String = "Settings"

open class Permission<T: PermissionService> {
  
  public typealias PermissionGranted = (_ granted:Bool) -> Swift.Void
    
    public class func prepare(for handler: Permissible, with configuration: PermissionConfiguration = Configurator(for: T.self).configuration, callback: @escaping PermissionGranted) {

    let service = T(with: configuration)
    let status = service.status()

    switch status {
    case .notDetermined:
      service.requestPermission({ (success) in
        OperationQueue.main.addOperation {
          callback(success)
        }
      })
    case .authorized:
      callback(true)
    case .restricted:
      showRestrictedAlert(from: handler, with: configuration.messages)
      callback(false)
    case .denied:
      showDeniedAlert(from: handler, with: configuration.messages)
      callback(false)
    default: fatalError()
    }
  }
    
 
  private class func showDeniedAlert(from sender:Permissible, with messages: ServiceMessages) {
    let alert = createAlert()
    alert.title = messages.deniedTitle
    alert.message = messages.deniedMessage
    alert.addAction(UIAlertController.openSettingsAction())
    sender.showAlert(vc: alert)
  }
  
  private class func showRestrictedAlert(from sender:Permissible, with messages: ServiceMessages) {
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
      let settingsUrl = URL(string: UIApplication.openSettingsURLString)
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
