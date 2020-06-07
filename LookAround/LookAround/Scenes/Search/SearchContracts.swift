//
//  SearchContracts.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

// MARK: View
protocol SearchViewProtocol: class {
    func handleOutput(_ output: SearchPresenterOutPut)
}

// MARK: - Presenter
protocol SearchPresenterProtocol: class {
    func load()
    func goMap(selected: MapInfoModel)
    func goSearch(text: String)
}

enum SearchPresenterOutPut {
    case showPlaces(data: [MapInfoModel])
}

// MARK: - Interactor
protocol SearchInteractorDelegate: class {
    func handleOutput(_ output: SearchInteractorOutput)
}

enum SearchInteractorOutput {
    case showPlaces(data: [Dictionary<String, AnyObject>])
}

protocol SearchInteractorProtocol: class {
    var delegete: SearchInteractorDelegate? { get set }
    func getSearchPlace(text: String)
}

// MARK: - Router
protocol SearchRouterProtocol: class {
    func navigate(to route: SearchRoute)
}

enum SearchRoute {
    case goOnMap(data: MapInfoModel)
}
