//
//  Extensions.swift
//  Justo Random User
//
//  Created by Admin on 09/08/21.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIViewController {
    func showIndicator(_ title: String = "", _ description: String = "") {
        let indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
        indicator.label.text = title
        indicator.isUserInteractionEnabled = false
        indicator.detailsLabel.text = description
        indicator.show(animated: true)
    }
    
    func hideIndicator() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension UIStoryboard {
    static func getMain() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}

protocol PresenterToViewProtocol: AnyObject {}

extension PresenterToViewProtocol {
    func showLoading() {
        (self as? UIViewController)?.showIndicator()
    }

    func hideLoading() {
        (self as? UIViewController)?.hideIndicator()
    }
}
