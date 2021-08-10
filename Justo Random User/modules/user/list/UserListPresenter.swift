//
//  UserListPresenter.swift
//  Justo Random User
//
//  Created by Admin on 09/08/21.
//

import Foundation
import UIKit

class UserListPresenter: UserListViewToPresenterProtocol, UserListInteractorToPresenterProtocol {
    weak var view: UserListPresenterToViewProtocol?
    
    var interactor: UserListPresenterToInteractorProtocol?
    
    var router: UserListPresenterToRouterProtocol?
    
    
    func loadUserList(_ showLoading: Bool) {
        if showLoading {
            view?.showLoading()
        }
        interactor?.requestUserList()
    }
    
    func requestUserListSuccess(_ userList: [User]) {
        view?.hideLoading()
        view?.onLoadUserListSuccess(userList)
    }
    
    func requestFailed(_ error: String?) {
        view?.hideLoading()
        
        view?.onLoadDataFailed(error: error ?? "Get records failed")
    }
    
    func goToDetails(_ user: User) {
        router?.goToUserDetails(user)
    }
    
}
