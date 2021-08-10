//
//  UserDetailsRouter.swift
//  Justo Random User
//
//  Created by Admin on 09/08/21.
//

import Foundation
import UIKit

class UserDetailsRouter: UserDetailsPresenterToRouterProtocol {
    static func createUserDetailsModule(_ user: User) -> UserDetailsViewController {
        let view = UIStoryboard.getMain().instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
        
        let presenter: UserDetailsViewToPresenterProtocol = UserDetailsPresenter()
        let router: UserDetailsPresenterToRouterProtocol = UserDetailsRouter()
        
        presenter.user = user
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        
        return view
    }
}
