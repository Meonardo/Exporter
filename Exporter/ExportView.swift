//
//  ExportView.swift
//  Exporter
//
//  Created by Meonardo on 2020/1/3.
//  Copyright © 2020 Meonardo. All rights reserved.
//

import SwiftUI

struct TransparentButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
    }
}

struct ExportView: View {
	
	@State private var searchKey = ""
	@State private var rightTitle = "客户列表"
	@State private var isAddingInfo = false
	
	var backAction: (() -> Void)?
	
	private let viewWidth: CGFloat = 260
	
    private var selectionItems: [SelectionViewModel] = [
        SelectionViewModel(title: "客\n户", isSelected: true),
        SelectionViewModel(title: "商\n品", selectedColor: .orange),
    ]
	
	@State private var listDataSource: [Buyer]?
    
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
				
                SearchView(searchText: searchKey)
					.frame(minHeight: 44)
					.padding(.leading, 16)
					
				HStack(spacing: 8) {
                    ForEach(selectionItems, id: \.self) { (item) in
                        SelectionView(model: item, action: { (item) in
                            self.updateSeletion(model: item)
                        })
                    }
				}
				.padding(.leading, 16)
				
				Spacer()
			}.frame(width: viewWidth)
			
			ZStack {
				VStack(alignment: .leading) {
					HStack {
						Text(rightTitle)
							.font(Font.system(size: 24, weight: .semibold))
						Spacer()
						Button(action: {
							self.isAddingInfo.toggle()
						}) {
							Text("+")
								.font(Font.system(size: 24, weight: .semibold))
						}
						.buttonStyle(TransparentButtonStyle())
						.sheet(isPresented: $isAddingInfo) {
							BuyerAddView()
						}
					}
					
					BuyerView(buyers: [])
					.padding(.top, 16)
					.cornerRadius(10)
				}
				.frame(minWidth: viewWidth + 100, minHeight: 400)
				.padding(EdgeInsets(top: 4, leading: 8, bottom: 16, trailing: 16))
				
				Text("无数据")
					.font(Font.system(size: 24))
					.opacity((listDataSource?.isEmpty ?? false) ? 0 : 1)
			}
		}
		.background(Color(.windowBackgroundColor))
		.onAppear {
			self.loadData()
		}
	}
    
	init(backAction: (() -> Void)?) {
		self.backAction = backAction
	}
}

/// Data
extension ExportView {
	
	private func loadData() {
		
	}
	
	private func updateSeletion(model: SelectionViewModel) {
		if let lastSelection = selectionItems.filter({ $0.isSelected }).last {
			if lastSelection == model {
				return
			}
			lastSelection.isSelected = false
		}
		let title = model.title.replacingOccurrences(of: "\n", with: "") + "列表"
		rightTitle = title
		model.isSelected = true
    }
}

/// Actions
extension ExportView {
	
	private func searchAction() {
		
	}
	
	private func addAction() {
		
	}
}
