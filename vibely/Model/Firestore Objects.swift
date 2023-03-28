//
//  Firestore Objects.swift
//  vibely
//
//  Created by Robert on 20/03/2023.
//

import Foundation
import FirebaseFirestoreSwift

struct UserData: Codable {
//    @DocumentID public var id: String?
    var displayName: String
    var bio: String
    var uid: String
    var followers: [String]
}

struct Vibe: Codable, Identifiable {
    @DocumentID public var id: String?
    var displayName: String
    var post: String
    var uid: String
    var timeStamp: Double
}

struct SearchResult: Codable {
    var uid: String
}
