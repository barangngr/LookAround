//
//  DetailPresenter.swift
//  LookAround
//
//  Created by Baran on 7.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

class DetailPresenter {
    
    private weak var view: DetailViewProtocol?
    private let headerData = ["Name:", "Adress:", "Latitude:", "Longitude:", "Rating:", "Open:"]
    
    init(view: DetailViewProtocol) {
        self.view = view
    }
    
    func convertData(incomingData: MapInfoModel) -> [DetailInfoModel] {
        //Seçilen mekanın type image url'inide sahibiz, bu url kingfisher gibi thirdParty library'ler kullanılarak kullanıcıya gösterilebilir ama UI da daha düzgün bir tasarım yapmak gerekir ve bu challenge için ekstra pod eklemek istemedim.
        var array = [DetailInfoModel]()
        
        array.append(DetailInfoModel(header: headerData[0], descp: incomingData.name))
        array.append(DetailInfoModel(header: headerData[1], descp: incomingData.adress))
        array.append(DetailInfoModel(header: headerData[2], descp: String(incomingData.lat)))
        array.append(DetailInfoModel(header: headerData[3], descp: String(incomingData.lng)))
        array.append(DetailInfoModel(header: headerData[4], descp: String(incomingData.rating)))
        array.append(DetailInfoModel(header: headerData[5], descp: incomingData.isOpen ? "Open" : "Close"))
        
        return array
    }
    
}

// MARK: DetailPresenterProtocol
extension DetailPresenter: DetailPresenterProtocol {

    func setData(data: MapInfoModel) {
        let data = convertData(incomingData: data)
        view?.handleOutput(.showDetails(data: data))
    }

}
