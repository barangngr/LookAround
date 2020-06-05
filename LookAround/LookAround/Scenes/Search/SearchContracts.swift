//
//  SearchContracts.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import Foundation

// MARK: View
protocol CWFeedViewProtocol: class {
    func handleOutput(_ output: CWFeedPresenterOutPut)
}

// MARK: - Presenter
protocol CWFeedPresenterProtocol {
  
}

enum CWFeedPresenterOutPut {
    
}

// MARK: - Interactor
protocol CWFeedInteractorProtocol {
   
}

// MARK: - Router
protocol CWFeedRouterProtocol {
    func navigate(to route: CWFeedRoute)
}

enum CWFeedRoute {
    case goOnMap
}

protocol CWMediaViewerDelegate: class {
    
}
