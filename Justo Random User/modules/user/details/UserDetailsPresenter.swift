//
//  UserDetailsPresenter.swift
//  Justo Random User
//
//  Created by Admin on 09/08/21.
//

import Foundation

class UserDetailsPresenter: UserDetailsViewToPresenterProtocol {
    weak var view: UserDetailsPresenterToViewProtocol?
    
    var router: UserDetailsPresenterToRouterProtocol?
    
    var user: User?
    
    func requestUserData() {
        if let user = user {
            view?.populateView(user)
        }
    }
}
