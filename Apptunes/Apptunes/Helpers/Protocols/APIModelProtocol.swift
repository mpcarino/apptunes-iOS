//
//  APIModelProtocol.swift
//  Apptunes
//
//  Created by Marwin Carino on 9/14/21.
//

import Foundation
import UIKit

protocol APIModelProtocol {
    static func decoder() -> JSONDecoder
    static func encoder() -> JSONEncoder
}

extension APIModelProtocol {
    static func decoder() -> JSONDecoder {
        let d = JSONDecoder()
        d.dateDecodingStrategy = .iso8601
        d.keyDecodingStrategy = .convertFromSnakeCase
        return d
    }

    static func encoder() -> JSONEncoder {
        let e = JSONEncoder()
        e.dateEncodingStrategy = .iso8601
        e.keyEncodingStrategy = .convertToSnakeCase
        return e
    }
}
