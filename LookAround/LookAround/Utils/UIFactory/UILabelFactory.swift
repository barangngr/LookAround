//
//  UILableFactory.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

class UILabelFactory {
    
    private let label: UILabel
    
    enum Style {
        case cellHeader
        case cellDescription
    }
    
    init(style: Style) {
        label = UILabel()
        
        switch style {
        case .cellHeader: cellHeaderStyle()
        case .cellDescription: cellDescpStyle()
        }
    }
    
    func build() -> UILabel {
        return label
    }
    
    private func cellHeaderStyle() {
        label.textColor = .white
        label.font = label.font.withSize(17)
        label.numberOfLines = 1
    }
    
    private func cellDescpStyle() {
        label.textColor = .gray
        label.font = label.font.withSize(13)
        label.numberOfLines = 0
    }
    
}
