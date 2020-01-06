//
//  SearchView.swift
//  Exporter
//
//  Created by Meonardo on 2020/1/6.
//  Copyright © 2020 Meonardo. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
	@State var searchText = ""

    var body: some View {
        HStack {
			HStack {
				Image("search")

				ZStack {
					TextField("搜索", text: $searchText, onEditingChanged: { isEditing in

					}, onCommit: {
						print("onCommit")
                    })
                        .foregroundColor(.primary)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
					HStack {
						Spacer()
						Button(action: {
							self.searchText = ""
						}) {
							Image("search_close")
								.opacity(searchText.isEmpty ? 0 : 1)
							}
						.padding(.trailing, 8)
						.buttonStyle(TransparentButtonStyle())
					}
				}
				
				Button(action: {
					
				}) {
					Text("搜索")
				}
			}
			.padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
			.foregroundColor(.secondary)
			.background(Color(.controlBackgroundColor))
			.cornerRadius(10.0)
		}
    }
}


