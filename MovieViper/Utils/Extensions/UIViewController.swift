//
//  UIViewController.swift
//  MovieViper
//
//  Created by hossein on 9/30/1401 AP.
//

import UIKit

extension UIViewController {
    
     func showAlert(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
           // show the alert
        present(alert, animated: true, completion: nil)
    }

}
