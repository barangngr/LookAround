//
//  ResultsResponse.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import Foundation

public struct ResultsResponse: Codable {
    
    public var geometry: LocationResponse?
    public var icon: String?
    public var id: String?
    public var name: String?
    public var opening_hours: OpeningResponse?
    public var photos: [PhotosResponse]?
    public var place_id: String?
    public var reference: String?
    public var types: [String]?
    public var vicinity: String?
    
    public init(geometry: LocationResponse?, icon: String?, id: String?, name: String?, opening_hours: OpeningResponse?, photos: [PhotosResponse]?, place_id: String?, reference: String?, types: [String]?, vicinity: String?){
        self.geometry = geometry
        self.icon = icon
        self.id = id
        self.name = name
        self.opening_hours = opening_hours
        self.photos = photos
        self.place_id = place_id
        self.reference = reference
        self.types = types
        self.vicinity = vicinity
    }
    
}
