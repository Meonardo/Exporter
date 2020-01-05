//
//  ExportView.swift
//  Exporter
//
//  Created by Meonardo on 2020/1/3.
//  Copyright © 2020 Meonardo. All rights reserved.
//

import SwiftUI

fileprivate struct TransparentButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
			.foregroundColor(.clear)
    }
}

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

struct SearchView: View {
	@State private var searchText = ""

    var body: some View {
        HStack {
			HStack {
				Image("search")

				ZStack {
					TextField("搜索", text: $searchText, onEditingChanged: { isEditing in

					}, onCommit: {
						print("onCommit")
					}).foregroundColor(.primary)
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

struct SelectView: View {
	
	var title: String
	var count: Int = 0
	var selectedColor = Color.blue
	
	@State private var isSelected: Bool = false
	
	var body: some View {
		ZStack {
			HStack {
				Text(title)
					.font(Font.system(size: 18, weight: .medium))
					.padding(10)
				Spacer()
				Text("\(count)")
					.font(Font.system(size: 14))
					.padding(.bottom, 30)
					.padding(.trailing, 10)
			}
		}
		.background(isSelected ? selectedColor : Color(.controlBackgroundColor))
		.cornerRadius(10)
		.onTapGesture {
			self.isSelected.toggle()
		}
	}
}

struct ExportView: View {
	
	@State private var buyerName = ""
	
	var backAction: (() -> Void)?
	
	private let viewWidth: CGFloat = 260
	
    var body: some View {
		HStack {
			VStack(alignment: .leading) {
				Button(action: {
					self.backAction?()
				}) {
					Image("back")
						.resizable()
						.frame(width: 20, height: 20)
						.padding(8)
				}.buttonStyle(TransparentButtonStyle())
				
				SearchView()
					.frame(minHeight: 44)
					.padding(.leading, 16)
					
				HStack(spacing: 8) {
					SelectView(title: "客\n户")
					SelectView(title: "商\n品", selectedColor: .orange)
				}
				.padding(.leading, 16)
				
				Spacer()
			}.frame(width: viewWidth)
			
			VStack(alignment: .leading) {
				Text("公司信息")
					.font(Font.system(size: 24, weight: .semibold))
				List {
					Text("公司信息")
					Text("公司信息")
					Text("公司信息")
				}
				.cornerRadius(10)
			}
			.frame(minWidth: viewWidth + 100, minHeight: 400)
			.padding(EdgeInsets(top: 4, leading: 8, bottom: 16, trailing: 16))
		}.background(Color(.windowBackgroundColor))
    }
	
	init(backAction: (() -> Void)?) {
		self.backAction = backAction
	}
}
