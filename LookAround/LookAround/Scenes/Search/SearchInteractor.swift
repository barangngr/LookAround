//
//  SearchInteractor.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

class SearchInteractor: SearchInteractorProtocol {
    
    var delegete: SearchInteractorDelegate?
    
    
    func getSearchPlace() {
        service.request(.getSearch(title: "şükrüsaraç")) { (result) in
            switch result {
            case .success(let response):
                print(response.statusCode)
                let jsonDict = try? JSONSerialization.jsonObject(with: response.data, options: .mutableContainers)
                print("json == \(jsonDict)")
                self.delegete?.handleOutput(.showPlaces(data: ["baran"]))
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

