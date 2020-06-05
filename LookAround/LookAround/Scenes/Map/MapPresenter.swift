//
//  MapPresenter.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

class MapPresenter {
    
    private weak var view: MapViewProtocol?
    private let router: MapRouterProtocol
    
    init(view: MapViewProtocol, router: MapRouterProtocol) {
        self.view = view
        self.router = router
    }
    
}
