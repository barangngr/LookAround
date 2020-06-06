//
//  MapBuilder.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

class MapBuilder {
    
    static func make(data: MapInfoModel) -> MapViewController {
        
        let view = MapViewController()
        
        let router = MapRouter(viewController: view)
        let presenter = MapPresenter(view: view, router: router)
        
        view.presenter = presenter
        view.data = data
        
        return view
    }
    
}
