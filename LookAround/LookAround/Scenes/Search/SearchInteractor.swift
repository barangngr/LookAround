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
        service.request(.getSearch(title: "nurtepe")) { (result) in
            switch result {
            case .success(let response):
                let jsonDict = try? JSONSerialization.jsonObject(with: response.data, options: .mutableContainers)
                do {
                    let json = try JSONDecoder().decode(PlaceResponseModel.self, from: response.data )
                    //completionHandler(true, json)
                    print(json)
                } catch {
                    print("Error during JSON serialization: \(error.localizedDescription)")
                    //completionHandler(false, nil)
                }
                //let json = try? JSONDecoder().decode(PlaceResponseModel.self, from: response.data )
                print(jsonDict ?? "no data")
                self.delegete?.handleOutput(.showPlaces(data: ["baran"]))
            case .failure(let error):
                //UIAlertViewHelper oluşturulup kullanılması daha uygun olurdu, ama bu case de ekstra işlem olmaması adına eklemedim.
                print(error)
            }
        }
    }
    
}

