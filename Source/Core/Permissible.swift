//
//  ServiceDisplay.swift
//
//  Created by Hellen Soloviy on 7/24/17.
//
//

import Foundation

public protocol ServiceMessages {
    
    var restrictedMessage: String { get }
    var restrictedTitle: String { get }
    var deniedMessage: String { get }
    var deniedTitle: String { get }
}

public protocol Permissible {
    
    func showAlert(vc: UIAlertController)
}

public extension Permissible where Self: UIViewController {
    
    public func showAlert(vc: UIAlertController) {
        self.present(vc, animated: true, completion: nil)
    }
    
}
