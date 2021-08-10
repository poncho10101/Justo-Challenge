//
//  UserListViewController.swift
//  Justo Random User
//
//  Created by Admin on 09/08/21.
//

import Foundation
import UIKit
import Kingfisher

class UserListViewController: UIViewController, UserListPresenterToViewProtocol {
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: UserListViewToPresenterProtocol?
    private var users: [User] = []
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadUserList(true)
        
        refreshControl.addTarget(self, action: #selector(refreshOnSwipe), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    func onLoadUserListSuccess(_ userList: [User]) {
        refreshControl.endRefreshing()
        users = userList
        tableView.reloadData()
    }
    
    func onLoadDataFailed(error: String) {
        refreshControl.endRefreshing()
        let alert = UIAlertController(title: nil, message: error, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc func refreshOnSwipe(_ sender: Any?) {
        presenter?.loadUserList(false)
    }
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserRow", for: indexPath) as! UserRow
        
        cell.configure(user: users[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.goToDetails(users[indexPath.row])
    }
}

class UserRow: UITableViewCell {
    @IBOutlet weak var ivPictureThumb: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    func configure(user: User) {
        lblName.text = "\(user.firstName ?? "") \(user.lastName ?? "")"
        lblEmail.text = user.email
        
        if let pictureUrl = user.thumbPictureUrl {
            ivPictureThumb.kf.setImage(
                with: URL(string: pictureUrl),
                options: [
                    .cacheOriginalImage
                ]
            )
        }
    }
}
