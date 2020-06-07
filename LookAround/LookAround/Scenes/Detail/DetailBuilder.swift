//
//  DetailBuilder.swift
//  LookAround
//
//  Created by Baran on 6.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import UIKit

class DetailBuilder {
    
    static func make(data: MapInfoModel) -> DetailViewController {
        
        let view = DetailViewController()
                
        view.data = data
        
        return view
    }
    
}
