//
//  Archive.swift
//  NYTimesNewsApp
//
//  Created by Rustam Manafov on 23.08.22.
//

import Foundation

// MARK: - Archive
struct Archive: Codable {
    let copyright: String?
    let response: ArchiveResponse?
}

// MARK: - ArchiveResponse
struct ArchiveResponse: Codable {
    let docs: [Article]?
    let meta: Meta?
}

// MARK: - Meta
struct Meta: Codable {
    let hits: Int?
}

// MARK: - Article
struct Article: Codable, ArchiveCellProtocol {
    let abstract: String?
    let webURL: String?
    let snippet, leadParagraph, printSection: String?
    let printPage: String?
    let source: String?
    let multimedia: [Multimedia]?
    let headline: Headline?
    let keywords: [Keyword]?
    let pubDate: String?
    let documentType, newsDesk, sectionName, subsectionName: String?
    let byline: Byline?
    let typeOfMaterial, id: String?
    let wordCount: Int?
    let uri: String?
    
    var imageURL: String {
        "\(NetworkHelper.shared.imageBaseURL)\(multimedia?.first?.url ?? "")"
    }
    
    var titleText: String {
        abstract ?? ""
    }
    
    var descText: String {
        leadParagraph ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case abstract
        case webURL = "web_url"
        case snippet
        case leadParagraph = "lead_paragraph"
        case printSection = "print_section"
        case printPage = "print_page"
        case source, multimedia, headline, keywords
        case pubDate = "pub_date"
        case documentType = "document_type"
        case newsDesk = "news_desk"
        case sectionName = "section_name"
        case subsectionName = "subsection_name"
        case byline
        case typeOfMaterial = "type_of_material"
        case id = "_id"
        case wordCount = "word_count"
        case uri
    }
}

// MARK: - Byline
struct Byline: Codable {
    let original: String?
    let person: [Person]?
    let organization: String?
}

// MARK: - Person
struct Person: Codable {
    let firstname, middlename, lastname, qualifier: String?
    let title, role, organization: String?
    let rank: Int?
}

// MARK: - Headline
struct Headline: Codable {
    let main, kicker, contentKicker, printHeadline: String?
    let name, seo, sub: String?

    enum CodingKeys: String, CodingKey {
        case main, kicker
        case contentKicker = "content_kicker"
        case printHeadline = "print_headline"
        case name, seo, sub
    }
}

// MARK: - Keyword
struct Keyword: Codable {
    let name, value: String?
    let rank: Int?
    let major: String?
}

// MARK: - Multimedia
struct Multimedia: Codable {
    let rank: Int?
    let subtype, caption, credit, type: String?
    let url: String?
    let height, width: Int?
    let subType, cropName: String?
    let legacy: Legacy?

    enum CodingKeys: String, CodingKey {
        case rank, subtype, caption, credit, type, url, height, width, subType
        case cropName = "crop_name"
        case legacy
    }
}

// MARK: - Legacy
struct Legacy: Codable {
    let xlarge: String?
    let xlargewidth, xlargeheight: Int?
    let thumbnail: String?
    let thumbnailwidth, thumbnailheight: Int?
}
