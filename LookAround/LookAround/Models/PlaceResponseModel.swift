//
//  PlaceModel.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import Foundation

public struct PlaceResponseModel: Codable {
    
    public var html_attributions: [String]?
    public var results: [ResultsResponse]?
    public var status: String?
    
    public init(html_attributions: [String]? , results: [ResultsResponse]?, status: String?){
        self.html_attributions = html_attributions
        self.results = results
        self.status = status
    }
    
}
