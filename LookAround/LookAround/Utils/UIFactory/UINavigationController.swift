//
//  UINavigationController.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

class UINavigationControllerFactory {
    
    private let navigationController: UINavigationController
    
    enum Style {
        case base
    }
    
    init(style: Style, rootViewController: UIViewController) {
        navigationController = UINavigationController(rootViewController: rootViewController)
        
        switch style {
        case .base: baseStyle()
        }
    }
    
    func build() -> UINavigationController {
        return navigationController
    }
    
    private func baseStyle() {
        navigationController.navigationBar.barTintColor = .cusBlack
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController.navigationBar.tintColor = #colorLiteral(red: 1, green: 0.99997437, blue: 0.9999912977, alpha: 1)
        navigationController.navigationBar.topItem?.title = "Look Around"
    }
    
}
