//
//  Decoding.swift
//  MusicXML
//
//  Created by James Bean on 12/17/18.
//

import Foundation
import XMLCoder

extension MusicXML {

    public enum Error: Swift.Error {
        case invalidMusicXMLString(String)
    }

    /// Creates a `MusicXML` model from the given MusicXML-formatted `string`.
    public init(string: String) throws {
        guard let data = string.data(using: .utf8) else {
            throw Error.invalidMusicXMLString(string)
        }
        try self.init(data: data)
    }

    /// Creates a `MusicXML` model from the given MusicXML-formatted file at the given `url`.
    public init(url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    /// Creates a `MusicXML` model from the given MusicXML-formatted `data`.
    public init(data: Data) throws {
        self.score = try XMLDecoder().decode(Score.self, from: data)
    }
}
