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
		VStack(alignment: .leading) {
			HStack(spacing: 32) {
				Text("姓名")
				Text("公司信息")
				Text("国家/地区")
				Text("详细地址")
				Text("联系方式")
				Text("添加日期")
			}
			List {
				ForEach(buyers) { buyer in
					HStack(spacing: 8) {
						Text(buyer.name)
						Text(buyer.company)
						Text(buyer.country)
						Text(buyer.address)
						Text(buyer.contact)
						Text(buyer.addDateString)
					}
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
