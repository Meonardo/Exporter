//
//  Buyer.swift
//  Wendy
//
//  Created by Hedi on 2019/12/26.
//  Copyright © 2019 Meonardo. All rights reserved.
//

import Foundation

class Buyer: Identifiable {
	
	lazy var id: String = {
		let combine = name + company + country + address + contact
		return combine.hashed(.sha1) ?? ""
	}()
	
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
	
	func isEmpty() -> String? {
		if name.isEmpty {
			return "姓名不能为空!"
		}
		if company.isEmpty {
			return "公司信息不能为空!"
		}
		if country.isEmpty {
			return "国家/地区不能为空!"
		}
		if address.isEmpty {
			return "地址信息不能为空!"
		}
		if contact.isEmpty {
			return "联系方式不能为空!"
		}
		return nil
	}
}

extension Buyer: ObservableObject {
	static func == (lhs: Buyer, rhs: Buyer) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension DataBaseManager {
	
	func update(buyer: Buyer) {
        dbQueue.inTransaction({ (db, rollback) in
			let id = buyer.id
            
            let sql = "SELECT * FROM BUYER WHERE (id = (?))"
            if let rs = try? db.executeQuery(sql, values: [id]) {
                if rs.next() {
                    let sql = "UPDATE BUYER SET name = ? add_date = ? country = ? company = ? contact = ? address = ? WHERE buyer_id = ?"
                    do {
						try db.executeUpdate(sql, values: [buyer.name, buyer.addDate.timeIntervalSince1970, buyer.country, buyer.company, buyer.contact, buyer.addDate, id])
                    } catch {
                        print("Unable to UPDATE Record with ERROR: \(error.localizedDescription)")
                    }
                } else {
                    let sql = "INSERT INTO BUYER (name, add_date, country, company, address, buyer_id) VALUES (?, ?, ?, ?, ?, ?)"
                    do {
                        try db.executeUpdate(sql, values: [buyer.name, buyer.addDate.timeIntervalSince1970, buyer.country, buyer.company, buyer.contact, buyer.addDate, id])
                    } catch {
                        print("Unable to INSERT Record with ERROR: \(error.localizedDescription)")
                    }
                }
                rs.close()
            }
        })
    }
}
