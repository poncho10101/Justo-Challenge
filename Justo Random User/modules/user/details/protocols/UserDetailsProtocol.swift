//
//  UserDetailsProtocol.swift
//  Justo Random User
//
//  Created by Admin on 09/08/21.
//

import Foundation

protocol UserDetailsViewToPresenterProtocol:AnyObject {
    var view: UserDetailsPresenterToViewProtocol? {get set}
    var router: UserDetailsPresenterToRouterProtocol? {get set}
    
    var user: User? {get set}
    
    func requestUserData()
}

protocol UserDetailsPresenterToViewProtocol:PresenterToViewProtocol {
    var presenter: UserDetailsViewToPresenterProtocol? {get set}
    
    func populateView(_ user: User)
}

protocol UserDetailsPresenterToRouterProtocol:AnyObject {
    static func createUserDetailsModule(_ user: User) -> UserDetailsViewController
}
