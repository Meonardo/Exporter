//
//  Order.swift
//  Wendy
//
//  Created by Hedi on 2019/12/26.
//  Copyright © 2019 Meonardo. All rights reserved.
//

import Foundation

struct Order {
    var id: String // Order ID
    var date: Date
    var products: [Product]
    
    var quantity: Int {
        return products.count
    }
}
