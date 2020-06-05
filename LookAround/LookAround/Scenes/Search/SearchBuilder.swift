//
//  SearchBuilder.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

class SearchBuilder {
    
    static func make() -> SearchViewController {
        
        let view = SearchViewController()
        
        let interactor = SearchInteractor()
        let router = SearchRouter(viewController: view)
        let presenter = SearchPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        
        return view
    }
    
}
