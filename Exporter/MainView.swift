//
//  MainView.swift
//  Exporter
//
//  Created by Meonardo on 2020/1/3.
//  Copyright © 2020 Meonardo. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
			Text("你好, Big Head Wendy!")
			.font(Font.system(size: 32, weight: .semibold, design: .rounded))
			.fontWeight(.semibold)
			.multilineTextAlignment(.leading)
			.lineLimit(nil)
			.padding([.top, .leading], 10.0)
			
			HStack {
				Button("导出表格") {
					
				}
				.font(Font.system(size: 12, weight: .semibold))
				.frame(width: 120, height: 80, alignment: .center)
				
				Button("修改信息") {
					
				}.font(Font.system(size: 12, weight: .semibold))
			}
			
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
