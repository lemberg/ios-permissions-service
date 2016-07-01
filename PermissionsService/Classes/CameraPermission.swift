//
//  CameraPermission.swift
//
//  Created by Volodymyr Hyrka on 2/9/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import Foundation
import Photos

public final class CameraPermissions: PermissonConfiguration {
	
	public init() {
		
	}
	
	public func checkStatus() -> PermissonStatus {
		let statusInt = AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeVideo).rawValue
		guard let status = PermissonStatus(rawValue: statusInt) where (0...3) ~= statusInt else {
			assertionFailure("Impossible status")
			return .NotDetermined
		}
		return status
	}
	
	public func requestStatus(requestGranted: (successRequestResult: Bool) -> Void) {
		AVCaptureDevice.requestAccessForMediaType(AVMediaTypeVideo) { (granted) -> Void in
			requestGranted(successRequestResult: granted)
		}
	}
	
	public func restrictedAlertMessage() -> String {
		return "This app does not have access to your Camera"
	}
	
	public func deniedAlertMessage() -> String {
		return "Hello baby"
	}
}
