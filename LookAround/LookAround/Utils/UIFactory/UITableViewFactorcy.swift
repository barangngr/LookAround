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
        case detail
    }
    
    init(style: Style) {
        tableView = UITableView()
        
        switch style {
        case .base: baseStyle()
        case .detail: detailStyle()
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
    
    private func detailStyle() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = .cusGray
        tableView.tintColor = .red
        tableView.isScrollEnabled = false
    }
    
}
