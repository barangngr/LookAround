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
        case detailHeader
        case detailDescription
    }
    
    init(style: Style) {
        label = UILabel()
        
        switch style {
        case .cellHeader: cellHeaderStyle()
        case .cellDescription: cellDescpStyle()
        case .detailHeader: detailHeaderStyle()
        case .detailDescription: detailDescpStyle()
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
    
    private func detailDescpStyle() {
        label.textColor = .white
        label.font = label.font.withSize(15)
        label.numberOfLines = 0
    }
    
    private func detailHeaderStyle() {
        label.textColor = .gray
        label.font = label.font.withSize(13)
        label.numberOfLines = 1
    }
    
}
