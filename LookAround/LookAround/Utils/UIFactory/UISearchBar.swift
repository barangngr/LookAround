//
//  UISearchBar.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

class UISearchBarFactory {
    
    private let searchBar: UISearchBar
    
    enum Style {
        case base
    }
    
    init(style: Style) {
        searchBar = UISearchBar()
        
        switch style {
        case .base: baseStyle()
        }
    }
    
    func build() -> UISearchBar {
        return searchBar
    }
    
    private func baseStyle() {
        searchBar.searchBarStyle = .default
        searchBar.barTintColor = .cusBlack
        searchBar.barStyle = .black
        searchBar.tintColor = .white
    }
    
}
