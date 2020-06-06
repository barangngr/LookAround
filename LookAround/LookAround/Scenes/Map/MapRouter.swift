//
//  MapRouter.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

class MapRouter {
    
    unowned let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
}

// MARK: MapRouterProtocol
extension MapRouter: MapRouterProtocol {
    
    func navigate(to route: MapRoute) {
        switch route {
        case .goOnMap:
            let detailView = DetailViewController()
            viewController.navigationController?.pushViewController(detailView, animated: true)
        }
    }
    
}

