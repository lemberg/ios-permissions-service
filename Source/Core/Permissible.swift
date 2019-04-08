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
    
    func showAlert(vc: UIAlertController) {
        self.present(vc, animated: true, completion: nil)
    }
    
}

public extension ServiceMessages {
 
    func isEqual(to compareble: ServiceMessages) -> Bool {
        
        var isEqual: Bool = false
        
        if (self.deniedMessage == compareble.deniedMessage &&
            self.deniedTitle == compareble.deniedTitle &&
            self.restrictedMessage == compareble.restrictedMessage &&
            self.restrictedTitle == compareble.restrictedTitle) {
            isEqual = true
        } else {
            isEqual = false
        }
        
        return isEqual
        
    }
    
}

