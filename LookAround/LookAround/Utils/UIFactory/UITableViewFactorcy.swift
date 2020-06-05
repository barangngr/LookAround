//
//  UITableViewFactorcy.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

class UITableViewFactorcy {
    
    private let tableView: UITableView
    
    enum Style {
        case base
    }
    
    init(style: Style) {
        tableView = UITableView()
        
        switch style {
        case .base: baseStyle()
        }
    }
    
    func build() -> UITableView {
        return tableView
    }
    
    private func baseStyle() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = .cusBlack
        tableView.tintColor = .red
    }
    
}
