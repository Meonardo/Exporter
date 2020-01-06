//
//  ExportView.swift
//  Exporter
//
//  Created by Meonardo on 2020/1/3.
//  Copyright © 2020 Meonardo. All rights reserved.
//

import SwiftUI

private struct TransparentButtonStyle: ButtonStyle {
    
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

class SelectionViewModel: ObservableObject, Identifiable {

    @Published var isSelected: Bool
    var title: String
    var count: Int
    var selectedColor: Color
    
    init(title: String,
         count: Int = 0,
         isSelected: Bool = false,
         selectedColor: Color = .blue) {
        self.title = title
        self.isSelected = isSelected
        self.count = count
        self.selectedColor = selectedColor
    }
}

extension SelectionViewModel: Hashable {

    static func == (lhs: SelectionViewModel, rhs: SelectionViewModel) -> Bool {
        return lhs.count == rhs.count && lhs.title == rhs.title
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(title + "\(count)")
    }
}

struct SelectionView: View {
	
    @ObservedObject var model: SelectionViewModel
    var action: ((SelectionViewModel) -> Void)?
    
	var body: some View {
		ZStack {
			HStack {
                Text(model.title)
					.font(Font.system(size: 18, weight: .medium))
                    .foregroundColor(model.isSelected ? .white : .primary)
					.padding(10)
				Spacer()
                Text("\(model.count)")
					.font(Font.system(size: 14))
                    .foregroundColor(model.isSelected ? .white : .primary)
					.padding(.bottom, 30)
					.padding(.trailing, 10)
			}
		}
        .background(model.isSelected ? model.selectedColor : Color(.controlBackgroundColor))
		.cornerRadius(10)
		.onTapGesture {
            self.model.isSelected.toggle()
            self.action?(self.model)
		}
	}
}

struct ExportView: View {
	
	@State private var searchKey = ""
    
	var backAction: (() -> Void)?
	
	private let viewWidth: CGFloat = 260
    private var selectionItems: [SelectionViewModel] = [
        SelectionViewModel(title: "客\n户"),
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
	
    private func updateSeletion(model: SelectionViewModel) {
        selectionItems.filter({ $0 != model }).forEach({ $0.isSelected = false })
    }
    
	init(backAction: (() -> Void)?) {
		self.backAction = backAction
	}
}
