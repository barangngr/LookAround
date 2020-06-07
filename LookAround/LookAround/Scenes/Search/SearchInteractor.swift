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
    var resultsArray: [Dictionary<String, AnyObject>] = Array()
    
    func getSearchPlace(text: String) {
        service.request(.getSearch(title: text)) { (result) in
            switch result {
            case .success(let response):
                let jsonDict = try? JSONSerialization.jsonObject(with: response.data, options: .mutableContainers)
                
                //Burada response codable bir model'e atansaydı daha sağlıklı olurdu farkındayım, response'u modelleyemediğim için fazla zaman kaybetmemek adına dictionary yapısını kullanarak data'yı kullandım.
                if let dict = jsonDict as? Dictionary<String,AnyObject> {
                   
                    if let result = dict["results"] as? [Dictionary<String,AnyObject>] {
                        self.resultsArray.removeAll()
                        for dct in result {
                            self.resultsArray.append(dct)
                        }
                    }
                }
                self.delegete?.handleOutput(.showPlaces(data: self.resultsArray))
            case .failure(let error):
                //UIAlertViewHelper oluşturulup kullanılması daha uygun olurdu, ama bu case de ekstra işlem olmaması adına eklemedim.
                print(error)
            }
        }
    }
    
}

