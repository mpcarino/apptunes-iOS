//
//  ItunesTrackClient.swift
//  Apptunes
//
//  Created by Marwin Carino on 9/14/21.
//

import Foundation
import UIKit
import SwiftyJSON

class TrackClient {
    // MARK: - Properties
    private static let root = L10n.APIs.Url.Itunes.root
}

// MARK: - Extensions
extension TrackClient {
    // MARK: - Enums
    private enum Path {
        case search
        
        var url: String {
            switch self {
            case .search: return root + L10n.APIs.Path.Itunes.Tracks.search
            }
        }
    }
}

extension TrackClient {
    // MARK: - User Functions
    /// Get data from search API, received as .txt file then convert contents into JSON data
    func downloadTracks(completion: @escaping ([ItunesTrack]) -> Void) {
        let path: Path = .search
        
        if let url = URL(string: path.url) {
            DispatchQueue.global().async {
                // Convert data content of .txt file to JSON data
                if let string = try? String(contentsOf: url) {
                    let json = JSON(parseJSON: string)
                    let results = json["results"]

                    // Map JSON data to an array of 'ItunesTrack' then update shared data
                    if let decodedResponse = try? JSONDecoder().decode([ItunesTrack].self, from: results.rawData()) {
//                        UserDataManager.shared.itunesTracks = decodedResponse
                    }
                }

//                completion(UserDataManager.shared.itunesTracks)
            }
        }
    }
}
