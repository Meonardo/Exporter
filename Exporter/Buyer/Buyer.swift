//
//  Buyer.swift
//  Wendy
//
//  Created by Hedi on 2019/12/26.
//  Copyright © 2019 Meonardo. All rights reserved.
//

import Foundation

struct Buyer {
    var id: String
    var name: String
	var company: String
	var contry: String
	var address: String
	var contact: String
	
    var orders: [Order]
    var addDate: Date
}
