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
			.foregroundColor(.clear)
    }
}

struct ExportView: View {
	
	@State private var searchKey = ""
	@State private var rightTitle = "客户列表"
	
	var backAction: (() -> Void)?
	
	private let viewWidth: CGFloat = 260
    private var selectionItems: [SelectionViewModel] = [
        SelectionViewModel(title: "客\n户", isSelected: true),
        SelectionViewModel(title: "商\n品", selectedColor: .orange),
    ]
    
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
			
			VStack(alignment: .leading) {
				Text(rightTitle)
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
    
	init(backAction: (() -> Void)?) {
		self.backAction = backAction
	}
}
