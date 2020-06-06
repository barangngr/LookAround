//
//  SearchRouter.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

class SearchRouter {
    unowned let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

// MARK: SearchRouterProtocol
extension SearchRouter: SearchRouterProtocol {
    
    func navigate(to route: SearchRoute) {
        switch route {
        case let .goOnMap(data):
            let mapView = MapBuilder.make(data: data)
            viewController.navigationController?.pushViewController(mapView, animated: true)
        }
    }
    
}
