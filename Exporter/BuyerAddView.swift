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
			Spacer(minLength: 20)
			TextField(placeholder, text: $content)
			.foregroundColor(.primary)
			.textFieldStyle(RoundedBorderTextFieldStyle())
		}
	}
}

struct BuyerAddView: View {
	
	@State var buyer = Buyer()
    
	var body: some View {
		Form {
			AddTextField(title: "姓名", placeholder: "输入客户名称", content: buyer.name)
			AddTextField(title: "公司信息", placeholder: "输入公司名称和其他信息", content: buyer.company)
			AddTextField(title: "国家/地区", placeholder: "输入国家/地区", content: buyer.country)
			AddTextField(title: "详细地址", placeholder: "输入详细地址(包括城市, 街道)", content: buyer.address)
			AddTextField(title: "联系方式", placeholder: "输入联系方式(多个如: What's app, FaceBook等)", content: buyer.contact)
			DatePicker("选择日期和时间", selection: $buyer.addDate, displayedComponents: .date)
			HStack(spacing: 12) {
				Spacer()
				Button("添加") {
					
				}
				Button("取消") {
					
				}
			}
			
		}.padding()
    }
}

struct BuyerAddView_Previews: PreviewProvider {
    static var previews: some View {
        BuyerAddView()
    }
}
