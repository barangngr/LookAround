//
//  MapContracts.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

// MARK: View
protocol MapViewProtocol: class {
    func handleOutput(_ output: MapPresenterOutPut)
}

// MARK: - Presenter
protocol MapPresenterProtocol: class {
    func goDetail(data: MapInfoModel)
}

enum MapPresenterOutPut {
}

// MARK: - Router
protocol MapRouterProtocol: class {
    func navigate(to route: MapRoute)
}

enum MapRoute {
    case goOnMap(data: MapInfoModel)
}

// Network kullanılmadığı için kod kalabalığı yapmaması adına Interactor class'ı eklenmemiştir.
