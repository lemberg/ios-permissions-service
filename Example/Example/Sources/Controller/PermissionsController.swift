//
//  PrmissionsController.swift
//  PermissionsService
//
//  Created by Yuriy Trach on 10/11/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import PermissionsService

extension PermissionsController: ServiceDisplay {}

struct CameraMessages: ServiceMessages {
  
  let deniedTitle = "Access denied"
  let deniedMessage = "You can enable access to camera in Privacy Settings"
  let restrictedTitle = "Access restricted"
  let restrictedMessage = "Access to camera is restricted"
  
}

class PermissionsController: UITableViewController {
	
	enum CellsIndexes: Int
	{
		case gallery = 0
		case calendar
		case camera
    case location
    case contacts
    case microphone
    case reminder

	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	// MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
		guard let cellIndex = CellsIndexes(rawValue: indexPath.row) else {
			assertionFailure("guard in \(#file) on \(#line) line")
			return
		}
		
		var instanceName = ""
		
		let block = { [unowned self] (granted: Bool) in
			var title: String!
			var message: String!
			if granted {
				title = "Success"
				message = "Permision for \(instanceName) is granded"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
			}
		}
    
    
//    let conf = LocationConfiguration(.whenInUse)
    
		switch cellIndex {
		case .gallery:
      instanceName = "Gallery"
  		Permission<Gallery>.prepare(for: self, callback: block)
		case .calendar:
      instanceName = "Events"
      Permission<Events>.prepare(for: self, callback: block)
		case .camera:
      instanceName = "Camera"
      Permission<Camera>.prepare(for: self, callback: block)
    case .location:
      instanceName = "Location"
      Permission<Location>.prepare(for: self, callback: block)
    case .contacts:
      instanceName = "Contacts"
      Permission<Contacts>.prepare(for: self, callback: block)
    case .microphone:
      instanceName = "Microphone"
      Permission<Microphone>.prepare(for: self, callback: block)
    case .reminder:
      instanceName = "Reminder"
      Permission<Reminder>.prepare(for: self, callback: block)
		}
	}
	
}
