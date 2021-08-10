//
//  Address.swift
//  Justo Random User
//
//  Created by Admin on 09/08/21.
//

import Foundation


struct Address: Decodable {
    var street: String?
    var city: String?
    var state: String?
    var country: String?
    var zipCode: Int?

    enum CodingKeys: String, CodingKey {
        case streetInfo = "street"
        case city
        case state
        case country
        case zipCode = "postcode"
    }
    
    enum StreetInfoCodingKeys: String, CodingKey {
        case name
        case number
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        city = try? values.decode(String.self, forKey: .city)
        state = try? values.decode(String.self, forKey: .state)
        country = try? values.decode(String.self, forKey: .country)
        zipCode = try? values.decode(Int.self, forKey: .zipCode)
        
        let streetInfo = try values.nestedContainer(keyedBy: StreetInfoCodingKeys.self, forKey: .streetInfo)
        let streetName = try? streetInfo.decode(String.self, forKey: .name)
        street = "\(streetName ?? "")"
        if let streetNumber = try? streetInfo.decode(Int.self, forKey: .number) {
            street! += " \(streetNumber)"
        }
    }
}
