//
//  WindowView.swift
//  Exporter
//
//  Created by Meonardo on 2020/1/4.
//  Copyright © 2020 Meonardo. All rights reserved.
//

import SwiftUI

struct WindowView: View {
	
	@State private var showMainView: Bool = true
	
    var body: some View {
		ZStack {
			if showMainView {
				MainView(action: { (isExport) in
					self.showMainView = false
				})
            } else {
                ExportView(backAction: {
                    self.showMainView = true
                }).opacity(showMainView ? 0 : 1)
            }
		}
    }
}

struct WindowView_Previews: PreviewProvider {
    static var previews: some View {
        WindowView()
    }
}
