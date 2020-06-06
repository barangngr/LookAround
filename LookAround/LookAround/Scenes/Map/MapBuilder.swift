//
//  MapBuilder.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

class MapBuilder {
    
    static func make() -> MapViewController {
        
        let view = MapViewController()
        
        let router = MapRouter(viewController: view)
        let presenter = MapPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
    
}
