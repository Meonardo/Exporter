//
//  BuyerAddView.swift
//  Exporter
//
//  Created by Meonardo on 2020/1/7.
//  Copyright © 2020 Meonardo. All rights reserved.
//

import SwiftUI

struct AddTextField: View {
	
	var title: String
	var placeholder: String
	@State var content = ""
	
	var body: some View {
		HStack {
			Text(title)
				.frame(width: 120, alignment: .leading)
			TextField(placeholder, text: $content)
			.foregroundColor(.primary)
			.textFieldStyle(RoundedBorderTextFieldStyle())
				.padding(.leading, -60)
		}
	}
}

struct BuyerAddView: View {
	@State private var showingAlert = false
	@State private var alertMessage = ""
	@Binding var isAddingInfo: Bool
	@State var buyer = Buyer()
    
	var body: some View {
		Form {
			AddTextField(title: "姓名", placeholder: "输入客户名称", content: buyer.name)
			AddTextField(title: "公司信息", placeholder: "输入公司名称和其他信息", content: buyer.company)
			AddTextField(title: "国家/地区", placeholder: "输入国家/地区", content: buyer.country)
			AddTextField(title: "详细地址", placeholder: "输入详细地址(包括城市, 街道)", content: buyer.address)
			AddTextField(title: "联系方式", placeholder: "输入联系方式(多个如: What's app, FaceBook等)", content: buyer.contact)
			HStack {
				Text("日期/时间 ")
				DatePicker("", selection: $buyer.addDate, displayedComponents: .date)
					.labelsHidden()
					.frame(width: 200, alignment: .leading)
			}
			
			
			HStack(spacing: 12) {
				Spacer()
				Button("添加") {
					if let emptyWarning = self.buyer.isEmpty() {
						self.showingAlert = true
						self.alertMessage = emptyWarning
						return
					}
					DataBaseManager.default.update(buyer: self.buyer)
				}.alert(isPresented: $showingAlert, content: {
					Alert(title: Text("提示"), message: Text("\(self.alertMessage)"), dismissButton: Alert.Button.cancel(Text("好")))
				})
				Button("取消") {
					self.isAddingInfo.toggle()
				}
			}
		}.padding()
    }
}
