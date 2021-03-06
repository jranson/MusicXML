//
//  PartList.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

// > The part-list identifies the different musical parts in
// > this movement. Each part has an ID that is used later
// > within the musical data. Since parts may be encoded
// > separately and combined later, identification elements
// > are present at both the score and score-part levels.
// > There must be at least one score-part, combined as
// > desired with part-group elements that indicate braces
// > and brackets. Parts are ordered from top to bottom in
// > a score based on the order in which they appear in the
// > part-list.
//
// > Each MusicXML part corresponds to a track in a Standard
// > MIDI Format 1 file. The score-instrument elements are
// > used when there are multiple instruments per track.
// > The midi-device element is used to make a MIDI device
// > or port assignment for the given track or specific MIDI
// > instruments. Initial midi-instrument assignments may be
// > made here as well.
// > The part-name-display and part-abbreviation-display
// > elements are defined in the common.mod file, as they can
// > be used within both the score-part and print elements.
//
// <!ELEMENT part-list (part-group*, score-part,
//    (part-group | score-part)*)>
public struct PartList: Equatable {
    public enum Element: Decodable, Equatable {
        case group(PartGroup) // PartGroup
        case part(ScorePart)
        enum CodingKeys: String, CodingKey {
            case group
            case part
        }
        public init(from decoder: Decoder) throws {
            let keyed = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self = .group(try keyed.decode(PartGroup.self, forKey: .group))
            } catch {
                self = .part(try keyed.decode(ScorePart.self, forKey: .part))
            }
        }
    }
    let elements: [Element]
}

extension PartList {

    // MARK: Nested Types

    // <!ELEMENT score-part (identification?,
    //    part-name, part-name-display?,
    //    part-abbreviation?, part-abbreviation-display?,
    //    group*, score-instrument*,
    //    (midi-device?, midi-instrument?)*)>
    // <!ATTLIST score-part
    //    id ID #REQUIRED
    //
    // > The part-name will often
    // > precede the first system, while the part-abbreviation will
    // > precede the other systems.
    //
    // > The formatting attributes for
    // > these elements are deprecated in Version 2.0 in favor of
    // > the new part-name-display and part-abbreviation-display
    // > elements. These are defined in the common.mod file as they
    // > are used in both the part-list and print elements. They
    // > provide more complete formatting control for how part names
    // > and abbreviations appear in a score.
    #warning("TODO: Add support for ScorePart print-style, print-object, and justify")
    public struct ScorePart: Equatable {

        // > The part-name indicates the full name of the musical part.
        //
        // <!ELEMENT part-name (#PCDATA)>
        // <!ATTLIST part-name
        //     %print-style;
        //     %print-object;
        //     %justify;
        // >
        public struct Name: Decodable, Equatable {
            let value: String
            let printStyle: PrintStyle?
            let printObject: Bool?
            let justification: Justification?
        }

        // > The part-abbreviation indicates the abbreviated version of
        // > the name of the musical part.
        //
        // <!ELEMENT part-abbreviation (#PCDATA)>
        // <!ATTLIST part-abbreviation
        //     %print-style;
        //     %print-object;
        //     %justify;
        // >
        public struct Abbreviation: Decodable, Equatable {
            let value: String
            let printStyle: PrintStyle?
            let printObject: Bool?
            let justification: Justification?
        }

        let id: String
        let identification: Identification?
        let name: Name
        let nameDisplay: PartNameDisplay?
    }
}

extension PartList.ScorePart: Decodable {

    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case id
        case identification
        case name = "part-name"
        case nameDisplay = "part-name-display"
    }
}

extension PartList: Decodable {

    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case parts = "score-part"
    }

    public init(from decoder: Decoder) throws {
        var unkeyed = try decoder.unkeyedContainer()
        self.elements = try unkeyed.decode([Element].self)
    }
}
