//
//  UserListRouter.swift
//  Justo Random User
//
//  Created by Admin on 09/08/21.
//

import Foundation
import UIKit

class UserListRouter: UserListPresenterToRouterProtocol {
    
    static func createUserListModule() -> UserListViewController {
        let view = UIStoryboard.getMain().instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
        
        let presenter: UserListViewToPresenterProtocol & UserListInteractorToPresenterProtocol = UserListPresenter()
        let interactor: UserListPresenterToInteractorProtocol = UserListInteractor()
        let router: UserListPresenterToRouterProtocol = UserListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func goToUserDetails(_ user: User) {
        AppDelegate.rootNavigationController?.pushViewController(
            UserDetailsRouter.createUserDetailsModule(user),
            animated: true
        )
    }
    
}
