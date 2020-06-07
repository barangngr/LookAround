//
//  WebService.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import Moya

let service = MoyaProvider<MoyaService.BusinessesProvider>()

enum MoyaService {
    enum BusinessesProvider: TargetType {
        
        var baseURL: URL {
            return URL(string: "https://maps.googleapis.com/maps/api/place/textsearch/json?")!
        }
        
        var apikey: String {
            return "AIzaSyAbVGu9vGIQe6eXHsJ9d1rfZ3KZuLNZpUA"
        }
        
        var path: String {
            switch self {
            case .getSearch:
                return ""
            }
        }
        
        var method: Moya.Method {
            switch self {
            case .getSearch:
                return .get
            }
        }
        
        var sampleData: Data {
            return Data()
        }
        
        var task: Task {
            switch self {
            case .getSearch(let title):
                return .requestParameters(parameters: ["query" : title, "key" : apikey], encoding: URLEncoding.queryString)
            }
        }
        
        var headers: [String : String]? {
            return ["Content-Type": "application/json"]
        }
        
        case getSearch(title: String)
    }
    
}
