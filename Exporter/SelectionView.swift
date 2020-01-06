//
//  SwiftUIView.swift
//  Exporter
//
//  Created by Meonardo on 2020/1/6.
//  Copyright © 2020 Meonardo. All rights reserved.
//

import SwiftUI

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
			self.action?(self.model)
		}
	}
}
