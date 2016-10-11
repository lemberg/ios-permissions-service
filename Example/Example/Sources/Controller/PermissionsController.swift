//
//  PrmissionsController.swift
//  PermissionsService
//
//  Created by Yuriy Trach on 10/11/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import PermissionsService

class PermissionsController: UITableViewController {
	
	enum CellsIndexes: Int
	{
		case gallery = 0
		case calendar
		case camera
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	// MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let cellIndex = CellsIndexes(rawValue: indexPath.row) else {
			assertionFailure("guarrd in \(#file) on \(#line) line")
			return
		}
		
		var service: PermissonConfiguration!
		let instanceName: String!
		
		switch cellIndex {
		case .gallery:
			service = GalleryPermission()
			instanceName = "gallery"
		case .calendar:
			service = CalendarPermission()
			instanceName = "calendar"
		case .camera:
			service = CalendarPermission()
			instanceName = "camera"
		}
		service.requestStatus { [unowned self] (granted) in
			var title: String!
			var message: String!
			if granted {
				title = "Success"
				message = "Permision for \(instanceName!) is granded"
			} else {
				title = "Denied"
				message = "Permision for \(instanceName!) is denied"
			}
			let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
			self.present(alert, animated: true, completion: nil)
		}
	}
	
}
