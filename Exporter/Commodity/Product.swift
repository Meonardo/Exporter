//
//  Product.swift
//  Wendy
//
//  Created by Hedi on 2019/12/26.
//  Copyright © 2019 Meonardo. All rights reserved.
//

import Foundation

struct Product {
    var id: String
    var name: String
    var model: String
    var price: Double // 美元报价
	var priceRMB: Double // 人民币报价
	
    var description: String?
	var imagePath: String?
}
