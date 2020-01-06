//
//  BuyerView.swift
//  Exporter
//
//  Created by Meonardo on 2020/1/6.
//  Copyright © 2020 Meonardo. All rights reserved.
//

import SwiftUI

struct BuyerView: View {
    var buyers: [Buyer]
	
	var body: some View {
		List {
			ForEach(buyers) { buyer in
				HStack(spacing: 8) {
					Text(buyer.name)
					Text(buyer.company)
					Text(buyer.country)
					Text(buyer.address)
					Text(buyer.contact)
				}
			}
		}
	}
}

struct BuyerView_Previews: PreviewProvider {
    static var previews: some View {
		BuyerView(buyers: [])
    }
}
