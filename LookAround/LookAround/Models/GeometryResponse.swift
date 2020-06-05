//
//  GeometryResponse.swift
//  LookAround
//
//  Created by Baran on 5.06.2020.
//  Copyright © 2020 Baran Gungor. All rights reserved.
//

import Foundation

public struct LocationResponse: Codable {
    
    public var location: GeometryResponse?
    
    public init(location: GeometryResponse?){
        self.location = location
    }
    
}

public struct GeometryResponse: Codable {
    
    public var lat: Double?
    public var lng: Double?
    
    public init(lat: Double?, lng: Double?){
        self.lat = lat
        self.lng = lng
    }
    
}

public struct PhotosResponse: Codable {
    
    public var height: Int?
    public var width: Int?
    public var photo_reference: String?
    public var html_attributions: String?
    
    public init(height: Int?, width: Int?, photo_reference: String?, html_attributions: String?){
        self.height = height
        self.width = width
        self.photo_reference = photo_reference
        self.html_attributions = html_attributions
    }
    
}

public struct OpeningResponse: Codable {
    
    public var open_now: Bool?
    
    public init(open_now: Bool?){
        self.open_now = open_now
    }
    
}
