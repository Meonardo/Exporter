//
//  ExportView.swift
//  Exporter
//
//  Created by Meonardo on 2020/1/3.
//  Copyright © 2020 Meonardo. All rights reserved.
//

import SwiftUI

struct BuyerView {
	
	var buyers: [Buyer]
	
	var body: some View {
		Section {
			List {
				ForEach(buyers) { buyer in
					HStack {
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
}

struct ExportView: View {
	
	@State private var buyerName = ""
	
    var body: some View {
		NavigationView {
			List {
				Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
				Text("Hello, World!")
			}.listStyle(SidebarListStyle())
		}
    }
}

struct ExportView_Previews: PreviewProvider {
    static var previews: some View {
        ExportView()
    }
}
