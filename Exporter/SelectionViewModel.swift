//
//  SelectionViewModel.swift
//  Exporter
//
//  Created by Meonardo on 2020/1/6.
//  Copyright © 2020 Meonardo. All rights reserved.
//

import Foundation
import SwiftUI

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
