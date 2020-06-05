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
protocol MapPresenterProtocol {
}

enum MapPresenterOutPut {
}

// MARK: - Interactor
protocol MapInteractorDelegate: class {
    func handleOutput(_ output: MapInteractorOutput)
}

enum MapInteractorOutput {
    case showPlaces(data: [String])
}

protocol MapInteractorProtocol {
}

// MARK: - Router
protocol MapRouterProtocol {
    func navigate(to route: MapRoute)
}

enum MapRoute {
    case goOnMap
}
