//
//  UserListInteractor.swift
//  Justo Random User
//
//  Created by Admin on 09/08/21.
//

import Foundation
import Alamofire


class UserListInteractor: UserListPresenterToInteractorProtocol {
    weak var presenter: UserListInteractorToPresenterProtocol?
    
    func requestUserList() {
        AF.request(
            NetworkConstants.API_BASE_URL,
            method: .get
        ).validate().responseData { reponse in
            switch reponse.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = NetworkConstants.SERVER_DATE_FORMAT
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    
                    let userListResult = try decoder.decode(UserListResponse.self, from: data)
                    
                    print(userListResult)
                    self.presenter?.requestUserListSuccess(userListResult.results)
                } catch {
                    print(error)
                    self.presenter?.requestFailed("Failed to parse data")
                }
            
            case .failure(let error):
                print(error)
                // Here should handle/parse errors (400~, 500~) to messages
                self.presenter?.requestFailed("Failed to get Users data")
            }
        }
    }
}
