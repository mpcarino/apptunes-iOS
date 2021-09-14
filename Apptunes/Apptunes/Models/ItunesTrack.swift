//
//  ItunesTrack.swift
//  Apptunes
//
//  Created by Marwin Carino on 9/14/21.
//

import Foundation

struct ItunesTrack: APIModelProtocol, Equatable, Codable {
    let trackId: Int
    let wrapperType: String
    let kind: String
    let artistName: String
    let collectionName: String
    let trackName: String
    let trackViewUrl: String
    let previewUrl: String
    let trackPrice: Double
    let currency: String
    let country: String
    
    var artworkSmallURL: String { artworkUrl30 }
    private let artworkUrl30: String
    
    var artworkMediumURL: String { artworkUrl60 }
    let artworkUrl60: String
    
    var artworkLargeURL: String { artworkUrl100 }
    let artworkUrl100: String
    
    let primaryGenreName: String
    let description: String
}
