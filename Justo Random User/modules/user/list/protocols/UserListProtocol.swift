//
//  UserDetailsProtocol.swift
//  Justo Random User
//
//  Created by Admin on 09/08/21.
//

import Foundation
import UIKit


protocol UserListViewToPresenterProtocol: AnyObject {
    var view: UserListPresenterToViewProtocol? {get set}
    var interactor: UserListPresenterToInteractorProtocol? {get set}
    var router: UserListPresenterToRouterProtocol? {get set}
    
    func loadUserList(_ showLoading: Bool)
    
    func goToDetails(_ user: User)
}

protocol UserListPresenterToViewProtocol: PresenterToViewProtocol {
    var presenter: UserListViewToPresenterProtocol? {get set}
    
    func onLoadUserListSuccess(_ userList: [User])
    func onLoadDataFailed(error: String)
}

protocol UserListPresenterToRouterProtocol: AnyObject {
    static func createUserListModule() -> UserListViewController
    
    func goToUserDetails(_ user: User)
}

protocol UserListPresenterToInteractorProtocol:AnyObject {
    var presenter: UserListInteractorToPresenterProtocol? {get set}
    
    func requestUserList()
}

protocol UserListInteractorToPresenterProtocol:AnyObject {
    func requestUserListSuccess(_ userList: [User])
    func requestFailed(_ error: String?)
}
