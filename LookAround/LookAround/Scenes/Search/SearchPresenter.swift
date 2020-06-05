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
    
}

// MARK: SearchPresenterProtocol
extension SearchPresenter: SearchPresenterProtocol {
    
    func load() {
        interactor.getSearchPlace()
    }

}

extension SearchPresenter: SearchInteractorDelegate {
    
    func handleOutput(_ output: SearchInteractorOutput) {
        switch output {
        case .showPlaces(let data):
            self.view?.handleOutput(.showPlaces(data: data))
        }
    }
    
}
