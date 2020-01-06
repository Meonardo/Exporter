//
//  MainView.swift
//  Exporter
//
//  Created by Meonardo on 2020/1/3.
//  Copyright © 2020 Meonardo. All rights reserved.
//

import SwiftUI

struct BlueButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.blue : Color.white)
            .background(configuration.isPressed ? Color.white : Color.blue)
            .cornerRadius(10.0)
            .padding()
    }
}

struct MainView: View {
	
	var action: ((Bool) -> Void)?
	
    var body: some View {
		VStack(spacing: 32) {
			Text("Welcome, Wendy!")
			.font(Font.system(size: 40, weight: .semibold, design: .rounded))
			.padding(.bottom, 32)
			
			Button(action: {
                self.showFormView()
            }) {
                Text("导出表格")
                    .padding(16)
            }
            .buttonStyle(BlueButtonStyle())
            .font(Font.system(size: 14, weight: .semibold))
		}
		.frame(minWidth: 500, idealWidth: 500, maxWidth: .infinity, minHeight: 320, idealHeight: 320, maxHeight: .infinity, alignment: .center)
		.background(Color(.windowBackgroundColor))
    }
	
	private func showFormView() {
		action?(true)
	}
	
	private func showModifyView() {
		action?(false)
	}
	
	init(action: ((Bool) -> Void)? = nil) {
		self.action = action
	}
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
