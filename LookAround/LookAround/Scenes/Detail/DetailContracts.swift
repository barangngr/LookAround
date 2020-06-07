//
//  DetailContracts.swift
//  LookAround
//
//  Created by Baran on 7.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import Foundation

// MARK: View
protocol DetailViewProtocol: class {
    func handleOutput(_ output: DetailPresenterOutPut)
}

// MARK: - Presenter
protocol DetailPresenterProtocol {
    func setData(data: MapInfoModel)
}

enum DetailPresenterOutPut {
    case showDetails(data: [DetailInfoModel])
}

// Network ve sayfa geçişleri kullanılmadığı için kod kalabalığı yapmaması adına Interactor ve router class'ları eklenmemiştir.
