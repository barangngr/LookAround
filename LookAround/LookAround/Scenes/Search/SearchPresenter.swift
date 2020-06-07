//
//  SearchPresenter.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

class SearchPresenter {
    
    private weak var view: SearchViewProtocol?
    private var interactor: SearchInteractorProtocol
    private let router: SearchRouterProtocol
    
    init(view: SearchViewProtocol, interactor: SearchInteractorProtocol, router: SearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        self.interactor.delegete = self
    }
    
    func parseDict(data: [Dictionary<String, AnyObject>]) -> [MapInfoModel] {
        var response = [MapInfoModel]()
        for dt in data {
            let newResponse = parseData(data: dt)
            if newResponse != nil {
                response.append(newResponse!)
            }
        }
        return response
    }
    
    func parseData(data: Dictionary<String, AnyObject>) -> MapInfoModel? {
        guard let locationGeo = data["geometry"] as? Dictionary<String, AnyObject> else { return nil }
        guard let location = locationGeo["location"] as? Dictionary<String, AnyObject> else { return nil }
        guard let latitude = location["lat"] as? Double else { return nil }
        guard let longitude = location["lng"] as? Double else { return nil }
        guard let name = data["name"] as? String else { return nil }
        guard let adress = data["formatted_address"] as? String else { return nil }
        guard let rating = data["rating"] as? Double else { return nil }
        guard let icon = data["icon"] as? String else { return nil }
        guard let opening = data["opening_hours"] as? Dictionary<String, AnyObject> else { return nil }
        guard let isOpen = opening["open_now"] as? Bool else { return nil }
        
        return MapInfoModel(lat: latitude, lng: longitude, name: name, adress: adress, rating: rating, png: icon, isOpen: isOpen)
    }
    
}

// MARK: SearchPresenterProtocol
extension SearchPresenter: SearchPresenterProtocol {
     
    func load() {
        interactor.getSearchPlace(text: "")
    }
    
    func goMap(selected: MapInfoModel) {
        router.navigate(to: .goOnMap(data: selected))
    }
    
    func goSearch(text: String) {
        interactor.getSearchPlace(text: text)
    }
        
}

// MARK: SearchInteractorDelegate
extension SearchPresenter: SearchInteractorDelegate {
    
    func handleOutput(_ output: SearchInteractorOutput) {
        switch output {
        case .showPlaces(let data):
            let convertedData = parseDict(data: data)
            self.view?.handleOutput(.showPlaces(data: convertedData))
        }
    }
    
}
