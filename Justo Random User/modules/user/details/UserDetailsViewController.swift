//
//  UserDetailsViewController.swift
//  Justo Random User
//
//  Created by Admin on 09/08/21.
//

import Foundation
import UIKit
import Kingfisher


class UserDetailsViewController: UIViewController, UserDetailsPresenterToViewProtocol {
    @IBOutlet weak var ivPicture: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblDateOfBirth: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblCellPhone: UILabel!
    @IBOutlet weak var lblStreet: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblZipCode: UILabel!
    
    
    var presenter: UserDetailsViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.requestUserData()
    }
    
    func populateView(_ user: User) {
        if let pictureUrl = user.pictureUrl {
            ivPicture.kf.setImage(
                with: URL(string: pictureUrl),
                options: [
                    .cacheOriginalImage
                ]
            )
        }
        
        if let birthDate = user.birthDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd"
            dateFormatter.locale = Locale.current
            lblDateOfBirth.text = dateFormatter.string(from: birthDate)
            
            let age = Calendar.current.dateComponents([.year], from: birthDate, to: Date()).year!
            lblAge.text = "\(age)"
        }
        
        lblName.text = "\(user.firstName ?? "") \(user.lastName ?? "")"
        lblEmail.text = user.email
        lblGender.text = user.gender
        lblPhone.text = user.homePhone
        lblCellPhone.text = user.cellPhone
        
        if let address = user.address {
            lblStreet.text = address.street
            lblCity.text = address.city
            lblState.text = address.state
            lblCountry.text = address.country
            lblZipCode.text = address.zipCode != nil ? "\(address.zipCode!)" : ""
        }
    }
}
