//
//  Buyer.swift
//  Wendy
//
//  Created by Hedi on 2019/12/26.
//  Copyright © 2019 Meonardo. All rights reserved.
//

import Foundation

class Buyer: Identifiable {
	var id: String = UUID().uuidString
	
    @Published var name: String
	@Published var company: String
	@Published var country: String
	@Published var address: String
	@Published var contact: String
	
    var orders: [Order]?
    
	@Published var addDate: Date
	var addDateString: String {
		let df = DateFormatter()
		df.dateFormat = "yyyy-DD-MM, hh:mm:ss"
		return df.string(from: addDate)
	}
	
	init() {
		self.name = ""
		self.company = ""
		self.country = ""
		self.address = ""
		self.contact = ""
		self.addDate = Date()
	}
	
//	init(name: String, company: String, country: String, address: String, contact: String, date: Date) {
//		self.name = name
//		self.company = company
//		self.country = country
//		self.address = address
//		self.contact = contact
//		self.addDate = date
//	}
}

extension Buyer: ObservableObject {
	static func == (lhs: Buyer, rhs: Buyer) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
