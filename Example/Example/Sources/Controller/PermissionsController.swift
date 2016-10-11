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
		case galery = 0
		case calendar
		case camera
	}
	
	// MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let cellIndex = CellsIndexes(rawValue: indexPath.row) else {
			assertionFailure("guarrd in \(#file) on \(#line) line")
			return
		}
		
		let showSuccessFullAlert = { [unowned self] (instanceName: String) in
			let alert = UIAlertController(title: "Success", message: "Permision for \(instanceName) is granded", preferredStyle: .alert)
		}
		
		switch cellIndex {
		case .galery:
			let service = GaleryPermission(
		default:
			<#code#>
		}
	}
	
}
