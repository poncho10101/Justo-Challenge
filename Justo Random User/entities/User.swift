//
//  User.swift
//  Justo Random User
//
//  Created by Admin on 09/08/21.
//

import Foundation

struct User: Decodable {
    var id: String?
    var gender: String?
    var firstName: String?
    var lastName: String?
    var address: Address?
    var email: String?
    var birthDate: Date?
    var homePhone: String?
    var cellPhone: String?
    var pictureUrl: String?
    var thumbPictureUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case idInfo = "id"
        case gender
        case nameInfo = "name"
        case address = "location"
        case email
        case birthDateInfo = "dob"
        case homePhone = "phone"
        case cellPhone = "cell"
        case pictureInfo = "picture"
    }
    
    enum IdInfoCodingKeys: String, CodingKey {
        case id = "value"
    }
    
    enum NameInfoCodingKeys: String, CodingKey {
        case firstName = "first"
        case lastName = "last"
    }
    
    enum BirthDateInfoCodingKeys: String, CodingKey {
        case birthDate = "date"
    }
    
    enum PictureInfoCodingKeys: String, CodingKey {
        case pictureUrl = "large"
        case thumbPictureUrl = "thumbnail"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        gender = try? values.decode(String.self, forKey: .gender)
        email = try? values.decode(String.self, forKey: .email)
        homePhone = try? values.decode(String.self, forKey: .homePhone)
        cellPhone = try? values.decode(String.self, forKey: .cellPhone)
        address = try? values.decode(Address.self, forKey: .address)
        
        let idInfo = try values.nestedContainer(keyedBy: IdInfoCodingKeys.self, forKey: .idInfo)
        id = try? idInfo.decode(String.self, forKey: .id)
        
        let nameInfo = try values.nestedContainer(keyedBy: NameInfoCodingKeys.self, forKey: .nameInfo)
        firstName = try? nameInfo.decode(String.self, forKey: .firstName)
        lastName = try? nameInfo.decode(String.self, forKey: .lastName)
        
        let birthDateInfo = try values.nestedContainer(keyedBy: BirthDateInfoCodingKeys.self, forKey: .birthDateInfo)
        birthDate = try? birthDateInfo.decode(Date.self, forKey: .birthDate)
        
        let pictureInfo = try values.nestedContainer(keyedBy: PictureInfoCodingKeys.self, forKey: .pictureInfo)
        pictureUrl = try? pictureInfo.decode(String.self, forKey: .pictureUrl)
        thumbPictureUrl = try? pictureInfo.decode(String.self, forKey: .pictureUrl)
        
    }
}
